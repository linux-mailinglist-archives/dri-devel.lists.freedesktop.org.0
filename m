Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B2991D865
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 08:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF98B10E275;
	Mon,  1 Jul 2024 06:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="R6mkUNw4";
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="h8J08LNf";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="MVPYdlxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3640 seconds by postgrey-1.36 at gabe;
 Mon, 01 Jul 2024 06:57:39 UTC
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420F210E275
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 06:57:39 +0000 (UTC)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45UMjem2009883;
 Sun, 30 Jun 2024 22:56:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
 cc:content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pfptdkimsnps; bh=5WniFHsk6vaDTB/C6eQnz+TJitGhyHBoRPoWjGi0AqI=; b=
 R6mkUNw4+oaLex6bPOXP77e4YFvHsNNxcsYXfyVieoy/w7IgO1x3xpYtK7rz8GJF
 z+rbRj8XbxcDz3xGbOUwLpLQrTzLtcjxmRRlVWIVuSnaBATusOQ1Pfk8y4kG4j75
 JAY7tQi3hHSWurKspdRmkBsfnoPospGWydWtT9geAyEvufRZI5PZAzBjTvyFnzLf
 QP75Sis9R7AyuG6AdthGGPjJn48D+/e/OuVpIooeX6ji32G0X2TmGJGscJq+TaV4
 tMYqIj+BBLZX70MKP62Wz3o2gND0SwEZCAUsNg4mDSO2ZVxjMHD7Enr+ZAwZCiz7
 pYEbDln3GtDMD8ht9DiA7w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 402h9k41ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 30 Jun 2024 22:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1719813392; bh=5WniFHsk6vaDTB/C6eQnz+TJitGhyHBoRPoWjGi0AqI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=h8J08LNftSQLs8pT3Al7KrKV/iHw2xe7PlJOYw8aQvwM5nvhQwlkz+EjNKBEcPRbk
 9MbznsP75XafTBCYRznTXhT6twAdU0dmNFu9d22aYIm3rczhol4CFvt1tWCYbIiR39
 hrFK1MS3XLv6lUlkfWrCzT3wDrJiF1XISdRaZTcE90cpeKWT5v/wnaOWBYtAZrabTy
 WWgIwEIZOyxnoipB9trsm5uFzr9BJMcp075XS3EjkdLcd8dnk6Mk6i+eWEzC/NSUwv
 trVCucMtbxOO0NpnF2Bj5QA+TAApBgQIefJKOPlNUj+8AiN4QrChhz3OtYXv5BZTyR
 bajSu9EyL+6uQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 281E7400A2;
 Mon,  1 Jul 2024 05:56:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8C93CA006B;
 Mon,  1 Jul 2024 05:56:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=MVPYdlxs; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id CB23640567;
 Mon,  1 Jul 2024 05:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxLN3/r/4AWOA4wbvD4RBgcGcBfsDbQIpZcUeBLKuqYN005XkkoLcG5EUAb1imndoSMzq5aetGg2MJbyxFHercCueKlAdg71l8VY/TY3R0NOdLTKzzl3SX2QDa9LUN1RHOEahRe3frNsvDg86igM3NweXJjH+YYHx3E5f0ia+pcxaV9jfEerYnN1AmjMjneRStxA38HGkX7h+IuTA+Gt0q/8dn5XPgRRwUK+3m7jekZoIg8ZBCS0UrnVTT35CDU0teM1Q3NCBankV4Vs9t6wHj89EBbEnr/epprtzi+Ig9lKQPZrcfpwgKCRsyPCMkYp9+qsmb5En9VkiWfItw6i2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WniFHsk6vaDTB/C6eQnz+TJitGhyHBoRPoWjGi0AqI=;
 b=MSuc14PmYUgotH+dA3QBJXoV6tga4T3DOHK6FW8yCiR2Tlqzge+u26bnqGyi1POMrxn7AY0MWUInBZn3MMyU/EpsQuGU8ghhCwZVWAWid5YVwdOE6QVei0zF0o7O+ASsU3fVi6pjgzgz1O8cMZld30tf5vGUZhtUsAgn2yE923YnIeNgpnKGBu87CJT0UgSXqj3xyHT2kRvphdHflyfhRTLM/Wv1Ykrni8KBPuQn/yTDLXLfSf0Xe+F5r+EPYId49m0Yjdh9C1UDVY0ohT8ulbweBZnRvLQTJFchfI5/Y0uU0uTAurMBsjPSEocQ0F0P3j28sWW+wUYoQyydkEUcVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WniFHsk6vaDTB/C6eQnz+TJitGhyHBoRPoWjGi0AqI=;
 b=MVPYdlxsk50JAEt1g/Qt4peOg8mTsh2prqF2CGyM/OzMKtCeMWr3kjdCxjjoVRJBZvGVcjHziA6I2Ju7NjPEk/kghi8S6rgh79w3QjlnMPYGWo8o66mk6yV5VpXhcUD/evJs1v1+Trf7kpy0YCuXRIm0wgHZJWiXlXSXf6b70mg=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 05:56:21 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%5]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 05:56:21 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Lukas
 Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kernel-list@raspberrypi.com"
 <kernel-list@raspberrypi.com>
Subject: Re: [PATCH 09/11] usb: dwc2: Skip clock gating on Broadcom SoCs
Thread-Topic: [PATCH 09/11] usb: dwc2: Skip clock gating on Broadcom SoCs
Thread-Index: AQHaywNvcuvv1/8APkCL7CcvC4BcW7HhYMMA
Date: Mon, 1 Jul 2024 05:56:21 +0000
Message-ID: <c0e98579-e54f-bf15-3c00-f7e4493b3baf@synopsys.com>
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-10-wahrenst@gmx.net>
In-Reply-To: <20240630153652.318882-10-wahrenst@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|IA0PR12MB8982:EE_
x-ms-office365-filtering-correlation-id: c95a28a2-e98d-4507-8b26-08dc9992885a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cFdnQk1pN3huVGQvaytscGlURU9YSGZRck1yUkt1c2UzaE5UVjZndkJNM0p6?=
 =?utf-8?B?T3B0UzU3czJMTnZ1djQ3YlFtRkVXdzlKWUR2cXl3WS82WWpzNkNZL2VLTEVU?=
 =?utf-8?B?QjRBRm5OL0ZSMC9nWVpRaW1uRC8zc2wxWm1Ya2dzUVhFUmR6ZWIyZmF3ZTIz?=
 =?utf-8?B?dGgvTVR0OVhYR0htd3ZFekVCZWU2QnR5UTBmRmZRMGE0d0ZuRG5QdG0zYzZ5?=
 =?utf-8?B?WTlKZ2lCSTZ0WERrb1lkaW5QazNMcTVQS3JKZlhZaks4S29PenE4R3p1TTBa?=
 =?utf-8?B?bVFaU2ZJZzhYSFZ6cVlRTGcxd2VjdnZvMmI1R0V1NXA4L0R3N1c5ZkdoU2lZ?=
 =?utf-8?B?d3VSNjJIVC9jT1lKWjQ1c0NBa3hiaEtjWlIxOWNDTGNwSjFMZWpSczJmL0p5?=
 =?utf-8?B?dTg2VTRCKzZyM2ZpSnAxSThlaWZYRkF3aThjNS9kRUo3eFZlOGVOZ3RRSmtu?=
 =?utf-8?B?MUpZRVJzU29sMXZUSUxEUndvSkxWSU90UTRrZjlEenp4RE9ZNmEwQzRwU2h0?=
 =?utf-8?B?TlBESUNGeEg5MFRGUzA0M3p1bFowbkNnbVA0c0RiSGJxc1p2T1JnaHYvVGNh?=
 =?utf-8?B?R09IOHNUTGo1Z2FLRlhEZzI0eWZyTWRzVlc2UGE3dUd3M3Rlc01oVFMwQ1Zx?=
 =?utf-8?B?cTd3Zk9kMnVEbEZUVmZDSEkyKzlJSzNrZ09EejBjMnUxVWlEMitnZTZ3Tjlt?=
 =?utf-8?B?TVQ1S3NlcW9Ibi9qSFZlQkFqc09zREgxTXQ4V1hmZnc4VURKK0FId3hrVUJW?=
 =?utf-8?B?Vmp1MTZldGd4QXNYL1R3djRJb0k0RkJJTksvbmdUbGQzcmxXa3dHcCtGSWNJ?=
 =?utf-8?B?ZUpXZVVSYnR3alY2dFlTL3NmTlM2R3pEQVlYU2ZZRkJuUTRwcmc4bVowRUdj?=
 =?utf-8?B?ZTFZNmlnMVFmR3NDYjhuekxhVHhFclM4Mk8yMGMvZHZKSTl4U2dmUksvMWc1?=
 =?utf-8?B?N2dwZFhzcGFYOXNwREk0RHIySlplZ0drZ2JjVzNId054MGRBUUhhRlZpMkpI?=
 =?utf-8?B?cmRVbDV2SmZUVjVaSjc4M1VUZnVRK1M3TEVFN0pqWmM5bWxwTXhiV2lsbkta?=
 =?utf-8?B?Wmx5eDZuU1NTRDdVSkxjZ3VraTFXdEFZcW5rQ1ExaFQyYm0xbWYxeTdTRmhF?=
 =?utf-8?B?dGN1L1ZCcWRqWXpNa1huc1lXWUhFTEZpOTI0bXhCRHVPenhTd2dEeTlIeW5p?=
 =?utf-8?B?bW1DU3pON2RVMzJycVpTTndFNXE1QnJJK3JETGw5VnRoNm1JNnJ1WmQyb08z?=
 =?utf-8?B?Um9oRFRSdDZUUHZEY1Q3M0hBV1c0cXVlZ3dFSGpTMndHUXEvalRvU3NZUUxa?=
 =?utf-8?B?TkFzWDFKa3JNSXQrcUR1NXNCZnRFS0gzbi9adGIyaklJKzVwSHlEVXVWOHBj?=
 =?utf-8?B?di9IdmNGOXZ0VU9Fb3d4K2NQK1p1N3l5M0ZoN3poTWg0UnowQXFzQWhteHRu?=
 =?utf-8?B?R1I2ZzRJWXhZeVcyL0R5R042dkNueW5CSFVTU1RXbXdBbEM5N1ZkMlZtZkRD?=
 =?utf-8?B?VFNGcDhPR1lzMnpyNDlVdEJ2UytmUkxnemJtOW5mRmwxOW91V2RvRzU4RDZP?=
 =?utf-8?B?NVhRMDJNNlVhdUEzTTZ0UW43RjFzSDlwdnVIT1ZadUQ1eXVjUE5NaVAyQ1hI?=
 =?utf-8?B?c2JoWFZNWFFOdTZ6ZU9sRlNkR2RBY25rZk15MFhGK01BUmZWZ3VLbmNubVRl?=
 =?utf-8?B?L3l2blJ2b08wSG9FOWxsY0M5YlJYa2JIMEwxcTUwTXVOOERBVXFzTnZBZWNn?=
 =?utf-8?B?SUwxUk1NYXBSRWpTbWkzdVM5ck0rQjlKUTV2VDF3RU1zcm9YcnlrOUd3d081?=
 =?utf-8?B?cUdFMEJOT2o3dTkzbzJ5VTdDZ1RnbmVxMEJ0cDhWeDAvOWV2aWRoYkVnYnk1?=
 =?utf-8?Q?6ECXG6l7pmr5w?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8796.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFhuTHI0M2JZSFljbTVsckpoV3ZWaGpqSWhHTThrVWJORTE3dEVneWQrK3Jz?=
 =?utf-8?B?NUFVczYvVnl4NGRTeldVZDRNMTd0QkhnS1o3Q0wyUEg2VmVUSkdYMkJnYSto?=
 =?utf-8?B?cWIyekhrRnFMQitRUVNzdUVqbkVYbm03U2ZUQW8wWjVYM0hoa0hrVHJKSjhZ?=
 =?utf-8?B?aWJFRFlIc0JZdVdzc2N4NXU0cWR0L2VLSnB5SXhQam1hWncwd0VMUEFIOENr?=
 =?utf-8?B?NlRPQjI5emtxWUJubklLa1Y4Nmo1dGNFNFZOTndITlI5dHNQY2hhaEI2blVx?=
 =?utf-8?B?anN3YXRlenA0TVNXV05MQnU4WDNJNHgzNHAveC94dHRBUEozWE9aK2RKeVFR?=
 =?utf-8?B?bUlwc2kwNHRickN0SzBGSTVJQk1MR0tZRnhOenhTY2ZPQ1dyYmdkZFdjSTFa?=
 =?utf-8?B?dHJpUkZOcmZDd3ZOMUdnNU9BaVVZaGxFY2pHRjFSZk5LSzk0cllzaHFJVElz?=
 =?utf-8?B?QkdGWXB1amxMYldhcWR1Tm0rblFyeEtOYnFYeHphT0lkL1NueTlDSjZlaTFy?=
 =?utf-8?B?dzhBTkF4MmJtNE4ybk4vS0RhaXZvS2RDRnJRV0FnZnplYXVlNW95SlhxZ3Jw?=
 =?utf-8?B?bTQrazN3UFZobERUQkZTN3pjcGMrNzFhUDVRY011QlVvaW1DWWdzUUxyNGZL?=
 =?utf-8?B?dHJHR3FYZU85dUZ4cDNqUXVFM29GYzVhQ1dzTlF6RVdRdXlWMUxhMkg3WWFx?=
 =?utf-8?B?UTRqR000alhKWDh2c0VyZ2xmeVIySUwrVllzUFpJdlZYQWpYSFppZ3pueFk5?=
 =?utf-8?B?YW1nVmpVeThpTVNHZnBJNkpQekNiQXN3MVA2NDN2Y1Y5bEtCeDZ3em1UMnpu?=
 =?utf-8?B?QTNPdjZ5dkREZW9vOUZPTC9qMkoxa3RyWkV4dUxYcG83cElVMThPelZ6aGF5?=
 =?utf-8?B?dHVvUXEzcU5lUlh2aUxtc0o5WVNEYmF1dk10ZzNKWXpFckZNYkFzSUFYVUpT?=
 =?utf-8?B?dUtPdUNmYndaT0l4cDZLUThIR3JpTUszRXVWQmtWbXBRMlJQQkpsbk5aSjZh?=
 =?utf-8?B?dVdWaHg3OHA1QjFjcXBmWkVOV1dja3BlYWxTcVNaTGpWUzNmWFBDUllQY3BV?=
 =?utf-8?B?RXpIYnk4ejN1aWRmOVlnL2FObU1YTkowUVlHZ0Y5T2g0UUZpYi82UkEvR1lS?=
 =?utf-8?B?WG9JUkRwT2FXWlF1MWFsSkFDeWh6MmxYbVFDc0ZzRU1wNVN0UXl6L3FSNSs0?=
 =?utf-8?B?WHdhb01oQTA5WFFnRzh2UXJPTi83bTdTQVhKUllPamdvWVlld2xlVnZ1SDhj?=
 =?utf-8?B?MFh2YUhzMzM5MDVLd1RnVU1NU21MZnlCZkgyRnU5VVhTb0JsV3JUcnlrdldn?=
 =?utf-8?B?TUpJNDJKVjJ3VUhBeWxRR0xQZm5nVXpwTDhIdVlSMFZwcGlyYmRlMVZXbnI5?=
 =?utf-8?B?UGx3LzUwNytPVTFrOWg0NHlBaDJSV1VpMzFreFR4SC9nQ0luOVNGczBjdVFB?=
 =?utf-8?B?Y2NBbWluQVJFaVBTQSsrTDRJTUdUcTNVdGgrcjk2eWsyalAzSURsb0txTUx3?=
 =?utf-8?B?MzZxS2M5QkMwaFhhRThSaEphb0lGZDE2VkxTenIwSXBRTFBHVkJxNWRWMGYz?=
 =?utf-8?B?R3RGZDJvSUZlQnpuUk85bkNtWmhGN1VzdTBadEo2bmFUUXBHdm9JZEJVMkZa?=
 =?utf-8?B?cnBSenk0WlRSTXJsblR3M2VHVTJYL3p2UExTUVdueEdhMDFrbjg5NWZ1bmVZ?=
 =?utf-8?B?czlpQmNBdDFoUW1ad1AvQlJVOUZkTk1ZQTgxY2oxZFpRbkQ4b0tveUUzTk5E?=
 =?utf-8?B?V0dsWXExK00rd3psZVRBenJNZm84RDFRUURHOHNXay8vQ09jTmNTcU1Wd2w1?=
 =?utf-8?B?ZzdsL05IL3AvNUErOFk0QkJ3ekowa1FDY0FHdzk0R2VMYjY2M1gvVnNUUVU3?=
 =?utf-8?B?b1dqWVQ4cVN5ek9YTzhCQ2ZlTE5rK2RJRzFraFAwN0I3RVpka1kwS0VleVdm?=
 =?utf-8?B?QmczRVpEeXVIQllseUorbGpOa2VVVExOdlNxRFQrRXF6cWt0dmhOWWpWWFh0?=
 =?utf-8?B?b2wxMldtcndIZ2hrQzVUY2U1UmJzdzFHVHU0UUhoNThxVnc4MHJ1clFyWjJ6?=
 =?utf-8?B?c1JCY2thSG5iaDE5RHRVZEJUV0VXckZMQXllazVOUXh4Q0NJdGRGOW0xQ0V3?=
 =?utf-8?Q?wV4P4TpfXPSR2jj2e2cuy2XdO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D40846C637E6C0438F00F2CC7ADBA02D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6Jn9sWh9O2KLCg04cMeMwQ1U4rQCC9k+KAbqIZY3cGYXPiqdRKbIwo+FbSs2oFSUFYN+NW232BI1KAuMMxRDPBOwg4TLDz5ChiTmXgu0hWwvKkY09UusuWDKRXCJbOWgS6S5iIoBf+ms+CVHaO/mmIoquYLq0HpfZ8Iq2pBJIhIniWH39a9d2W9C/EhPy3rBGeUrLNKhcsXwktWIL8gOpdHrXmHUdkEfqcVlU2BwzXjpdJlXXXKCsDQ+taQbllU4nGyAeMciFq+IeW/rLuiyFZeaLoZriFfGt78xoddMEtpSk1Hl/hz/j+Ha5fJ3a9sczY+guqzafceNnvhBaBVQaGudWUFckH69+EU49w2wOWlpfVPxhR1ON/MseuC0/5BcueEcI26nyyPjOpZEdvlVDJwA2N2kP7oSDO48AeLOiuIVr0/ElZ6Hmdlw9mqbR7tw6UOZe025q+0c6Y4/rBjIEw8jah4LFoXoPyWrRDcXC/r8ohOKe+N/JBXr7PfMneWiqJZDfT5JRm86YA8MBObBLr2RS4XlRJ9BhgrERvvG1cJgvuAC4+uLGyncfxM/QUOUliEoHg3hEBuBJ7k9KiShPdxPZMiT4pbftzNISQMKLGoGU0vQa5O5ZFzAKQO40ZbU7iFsifbO1BRv9JHcEDQ4XQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95a28a2-e98d-4507-8b26-08dc9992885a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 05:56:21.1048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D4sG2vSlTbqTqytGqpP5MgYByNH14TueTdz698OKU3u/nFag3dOHfQUB/myRXK3hAuf1JVMzmdVvd5LaIdGCUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982
X-Proofpoint-ORIG-GUID: CbhreX5DygwaT4StHroC5unbQa3Y2wFF
X-Proofpoint-GUID: CbhreX5DygwaT4StHroC5unbQa3Y2wFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_04,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407010043
X-Mailman-Approved-At: Mon, 01 Jul 2024 06:59:14 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDYvMzAvMjQgMTk6MzYsIFN0ZWZhbiBXYWhyZW4gd3JvdGU6DQo+IE9uIHJlc3VtZSBv
ZiB0aGUgUmFzcGJlcnJ5IFBpIHRoZSBkd2MyIGRyaXZlciBmYWlscyB0byBlbmFibGUNCj4gSENE
X0ZMQUdfSFdfQUNDRVNTSUJMRSBiZWZvcmUgcmUtZW5hYmxpbmcgdGhlIGludGVycnVwdHMuDQo+
IFRoaXMgY2F1c2VzIGEgc2l0dWF0aW9uIHdoZXJlIGJvdGggaGFuZGxlciBpZ25vcmUgYSBpbmNv
bWluZyBwb3J0DQo+IGludGVycnVwdCBhbmQgZm9yY2UgdGhlIHVwcGVyIGxheWVycyB0byBkaXNh
YmxlIHRoZSBkd2MyIGludGVycnVwdCBsaW5lLg0KPiBUaGlzIGxlYXZlcyB0aGUgVVNCIGludGVy
ZmFjZSBpbiBhIHVudXNhYmxlIHN0YXRlOg0KPiANCj4gaXJxIDY2OiBub2JvZHkgY2FyZWQgKHRy
eSBib290aW5nIHdpdGggdGhlICJpcnFwb2xsIiBvcHRpb24pDQo+IENQVTogMCBQSUQ6IDAgQ29t
bTogc3dhcHBlci8wIFRhaW50ZWQ6IEcgVyAgICAgICAgICA2LjEwLjAtcmMzDQo+IEhhcmR3YXJl
IG5hbWU6IEJDTTI4MzUNCj4gQ2FsbCB0cmFjZToNCj4gdW53aW5kX2JhY2t0cmFjZSBmcm9tIHNo
b3dfc3RhY2srMHgxMC8weDE0DQo+IHNob3dfc3RhY2sgZnJvbSBkdW1wX3N0YWNrX2x2bCsweDUw
LzB4NjQNCj4gZHVtcF9zdGFja19sdmwgZnJvbSBfX3JlcG9ydF9iYWRfaXJxKzB4MzgvMHhjMA0K
PiBfX3JlcG9ydF9iYWRfaXJxIGZyb20gbm90ZV9pbnRlcnJ1cHQrMHgyYWMvMHgyZjQNCj4gbm90
ZV9pbnRlcnJ1cHQgZnJvbSBoYW5kbGVfaXJxX2V2ZW50KzB4ODgvMHg4Yw0KPiBoYW5kbGVfaXJx
X2V2ZW50IGZyb20gaGFuZGxlX2xldmVsX2lycSsweGI0LzB4MWFjDQo+IGhhbmRsZV9sZXZlbF9p
cnEgZnJvbSBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKzB4MjQvMHgzNA0KPiBnZW5lcmljX2hh
bmRsZV9kb21haW5faXJxIGZyb20gYmNtMjgzNl9jaGFpbmVkX2hhbmRsZV9pcnErMHgyNC8weDI4
DQo+IGJjbTI4MzZfY2hhaW5lZF9oYW5kbGVfaXJxIGZyb20gZ2VuZXJpY19oYW5kbGVfZG9tYWlu
X2lycSsweDI0LzB4MzQNCj4gZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSBmcm9tIGdlbmVyaWNf
aGFuZGxlX2FyY2hfaXJxKzB4MzQvMHg0NA0KPiBnZW5lcmljX2hhbmRsZV9hcmNoX2lycSBmcm9t
IF9faXJxX3N2YysweDg4LzB4YjANCj4gRXhjZXB0aW9uIHN0YWNrKDB4YzFiMDFmMjAgdG8gMHhj
MWIwMWY2OCkNCj4gMWYyMDogMDAwNWMwZDQgMDAwMDAwMDEgMDAwMDAwMDAgMDAwMDAwMDAgYzFi
MDk3ODAgYzFkNmIzMmMgYzFiMDRlNTQgYzFhNWVhZTgNCj4gMWY0MDogYzFiMDRlOTAgMDAwMDAw
MDAgMDAwMDAwMDAgMDAwMDAwMDAgYzFkNmE4YTAgYzFiMDFmNzAgYzExZDJkYTggYzExZDQxNjAN
Cj4gMWY2MDogNjAwMDAwMTMgZmZmZmZmZmYNCj4gX19pcnFfc3ZjIGZyb20gZGVmYXVsdF9pZGxl
X2NhbGwrMHgxYy8weGIwDQo+IGRlZmF1bHRfaWRsZV9jYWxsIGZyb20gZG9faWRsZSsweDIxYy8w
eDI4NA0KPiBkb19pZGxlIGZyb20gY3B1X3N0YXJ0dXBfZW50cnkrMHgyOC8weDJjDQo+IGNwdV9z
dGFydHVwX2VudHJ5IGZyb20ga2VybmVsX2luaXQrMHgwLzB4MTJjDQo+IGhhbmRsZXJzOg0KPiBb
PGY1MzllMGY0Pl0gZHdjMl9oYW5kbGVfY29tbW9uX2ludHINCj4gWzw3NWNkMjc4Yj5dIHVzYl9o
Y2RfaXJxDQo+IERpc2FibGluZyBJUlEgIzY2DQo+IA0KPiBEaXNhYmxpbmcgY2xvY2sgZ2F0bGlu
ZyB3b3JrYXJvdW5kIHRoaXMgaXNzdWUuDQo+IA0KPiBGaXhlczogMDExMmI3Y2U2OGVhICgidXNi
OiBkd2MyOiBVcGRhdGUgZHdjMl9oYW5kbGVfdXNiX3N1c3BlbmRfaW50ciBmdW5jdGlvbi4iKQ0K
PiBMaW5rOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtdXNiLzNmZDBjMmZiLTQ3NTItNDViMy05NGViLTQyMzUyNzAzZTFmZEBnbXgubmV0
L1QvX187ISFBNEYyUjlHX3BnIWN0OGlXVk9BdlZkNG1fNFluWXg3YzNXM01OLTEtek5tRVNFbnRw
YW5hcEFYVEwzRkhGUDNZWHp6eUJaQ0VkT3NETGZRaC1hX2QtbUpUNUEkDQo+IFNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+DQoNCkFja2VkLWJ5OiBNaW5hcyBI
YXJ1dHl1bnlhbiA8aG1pbmFzQHN5bm9wc3lzLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL3Vz
Yi9kd2MyL3BhcmFtcy5jIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYyBiL2RyaXZlcnMv
dXNiL2R3YzIvcGFyYW1zLmMNCj4gaW5kZXggNWExNTAwZDBiZGQ5Li42NjU4MGRlNTI4ODIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMi9wYXJhbXMuYw0KPiBAQCAtMjMsNiArMjMsNyBAQCBzdGF0aWMgdm9pZCBkd2MyX3Nl
dF9iY21fcGFyYW1zKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4gICAJcC0+bWF4X3RyYW5z
ZmVyX3NpemUgPSA2NTUzNTsNCj4gICAJcC0+bWF4X3BhY2tldF9jb3VudCA9IDUxMTsNCj4gICAJ
cC0+YWhiY2ZnID0gMHgxMDsNCj4gKwlwLT5ub19jbG9ja19nYXRpbmcgPSB0cnVlOw0KPiAgIH0N
Cj4gDQo+ICAgc3RhdGljIHZvaWQgZHdjMl9zZXRfaGlzX3BhcmFtcyhzdHJ1Y3QgZHdjMl9oc290
ZyAqaHNvdGcpDQo+IC0tDQo+IDIuMzQuMQ0KPiA=
