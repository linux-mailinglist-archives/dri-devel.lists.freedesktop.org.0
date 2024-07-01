Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BEA91E9EC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 22:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14D010E0F5;
	Mon,  1 Jul 2024 20:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tVUVdgDN";
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ei2oXMPH";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="FPRWG+mO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4672 seconds by postgrey-1.36 at gabe;
 Mon, 01 Jul 2024 07:14:34 UTC
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024A310E336
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 07:14:34 +0000 (UTC)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461366BW031697;
 Sun, 30 Jun 2024 22:56:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
 cc:content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pfptdkimsnps; bh=W8Mm3FMB/gwv3GbsTO4cgtBntIThdGAnlQNKEKS8gIo=; b=
 tVUVdgDNPGp1iMBbU8tLiyt6hYkFQeeoixgMI0Hkzqbx5A2SBtGFBMc4lX/mU5n4
 Ohz17avKxBpKgJLGoghhfkGKWiAVOcZ5RkNvuXoOmIVMCXhSSAuqNbogJksrovL9
 CrmQZHct3MYZGM6gsiBOGJQvyNFLh+NYNlme1ZeXUhpSWx0KR219+KA4OPf369b4
 T0FwO5WNTjPtKic0dm1aC+1LDj5fvI6AqK581pq77FfIIBfnSo3BqG73BdZxj3LK
 R2KsHgeA9dKgmESH6BdLiGL6Z4ruTeJZjjgw2AjJQZTlOpOLgxOYf8FQ5AthaEM9
 xkHrjk+jPcassp6MySlW2A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 402h6sc2f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 30 Jun 2024 22:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1719813375; bh=W8Mm3FMB/gwv3GbsTO4cgtBntIThdGAnlQNKEKS8gIo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ei2oXMPH38yLo9ZZDGmQPJ+++kgLiwijXORWuG9wQsuKGT2WxnEF5DFH2ISTFoSLz
 LEWluvV3ErRXlWf0nC9ZAd0CXXPYAasnjqRXywku+zvmuy1WDG0LkWk2xiZGzsP+Rz
 9qlhY2i3O+YwgdGtZ1eNDEEbEL7Qo8JvVoIt1RAH21vniC8eDbcs+rqmmkcWoXIg8D
 5TTRYPdwLCHZUPZtp0MDjV877voWKKlFf7BZRHyKr6JwaPeklLzIiFCvWFKZqt1nzv
 IY1uRaXi3eGu3tdx73ma8PByAqLfT4f6NYIpzoEpFoT72sKaTQElS96uGp9yDrSONV
 NmwovRvJ+8q7g==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BA6140357;
 Mon,  1 Jul 2024 05:56:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 57CC1A007F;
 Mon,  1 Jul 2024 05:56:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=FPRWG+mO; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 753F24035B;
 Mon,  1 Jul 2024 05:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8tzSpMHvzA2qoaJYNaz+ymt389NrY0wre1SyytHYkfBOEjkqTL6+q6898hOdtvtGzqJ51JrDBdzTa5C96Pknzlv4EBDDP8y69anJSxaGOOAAkdZ6fOGNvLCd/awUR0sJlCdImYru/mMY3gUSqsiX4A5y0H/936D81VwbKn+ciPOJeJXrYJ8B98rmp4FCrozh4t2XS7bhKmML4+QQLanlwcSRkHmwm0CNZ4EyyyyNoqsy3s7JrJQRoudCdpQMin6oszJHaHVSpuJI82C0VSq+LOknLKIfAzGNSXC5ZaPHr3f4j/53XgxnIJl9JQ5NI0hc5hPMsopwyHMQO28vqJvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8Mm3FMB/gwv3GbsTO4cgtBntIThdGAnlQNKEKS8gIo=;
 b=mLKoJErAG6Uf1+N9jJ8VzfpiLQVCAUuEUu1PyBAgWVCJAJtxpWwpLyqC36qeJ9elergaedZPH7IGk1tEJNn+n7HEADy8kSDQ6esmId0utyg5gdf5T9KE/7Aw7nYOQW7sQC6+HklIhunSKynrvi5pkP4Lw3ALhm/o3qXHxj7/2htvhJU99F+yOW5R6s5TMmIYWjtIH28IPa5msdM16JM/D44KGWTJxsqNbSPh5E6hxgLE6ZZrhk+BnslITbOMJ8BLoP/p7mA25EmvEqxmjemH6WeqpKV0172Z//TyuecA+euit5YMAor3wh4GMqCLZ0QZBRdw+Q3bvbL9x0zIzNhnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8Mm3FMB/gwv3GbsTO4cgtBntIThdGAnlQNKEKS8gIo=;
 b=FPRWG+mOJbI97FS6Idr88wC4Ma+b/MUGP2yuIZV9BodpT+TgCVO+S0k8gtvbLXWzL4w/nklUWLvhTNnC/Cr2hWnmxOer1fiCtLILt/ae7Htf5pmGiUpdDpNydRE9Lf31vckxoKg7dHNByMfscY3sXm/JgTbD4IQg2DbXHo4j4pI=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 05:56:03 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%5]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 05:56:03 +0000
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
Subject: Re: [PATCH 08/11] usb: dwc2: debugfs: Print parameter no_clock_gating
Thread-Topic: [PATCH 08/11] usb: dwc2: debugfs: Print parameter no_clock_gating
Thread-Index: AQHaywNvuF/mmCpBpUuA1s4LbSn6+rHhYK4A
Date: Mon, 1 Jul 2024 05:56:03 +0000
Message-ID: <5bd0e3f2-4f06-67cb-c4f4-00593625ef1f@synopsys.com>
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-9-wahrenst@gmx.net>
In-Reply-To: <20240630153652.318882-9-wahrenst@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|IA0PR12MB8982:EE_
x-ms-office365-filtering-correlation-id: 935896a5-0331-4d73-732f-08dc99927dc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?djFjVjRPa0lLSnFBcWVxWWtSZzJZQjZJRzFCcUNxeXBnL2ZVZm9ud2UxY1RI?=
 =?utf-8?B?azVlZTYySjBKdzMyWXBsdFVzR1FHSWtDMC9OMGx0Qlh3ZWFNZmtwZkZhMHdr?=
 =?utf-8?B?NjM2SDN0M3Z5c291WUdhNXVKakVmeFNyZ2ExTFVqRHNHcEJxZDlxMGNKMnlx?=
 =?utf-8?B?a01BZFI0U1prakJ6b1NNRCs0cnpFS3lLTTRCbzFRSyt0dHFmY1N6OVVKbFEz?=
 =?utf-8?B?WlZXb0NkVmRVckgvTVQ3UFVsKy9HZ2ZzazN3SThobW42L0RWaW5zd3JsdG9u?=
 =?utf-8?B?UEdNVzcvOG5OY2lub1BLeEU2WDZYVWZtWGJXSG5aZlBXRkRERzFMcjNOcFpi?=
 =?utf-8?B?OHhaUnljYlRqNlN3VS84UDBOZmVTK1Q0THVZRkZLb3ZOV3VXWC9BK0dNZWVU?=
 =?utf-8?B?Tmh6UC9UMHQxNGtWbU5hd3NKSEpWU0YxcGhQbDU1Wmo3ayt5V0RzVkY0L1NF?=
 =?utf-8?B?TCsrdjdBN0ZEU2NIbFF6cHNSZWd4YVZjKytWcG9WOElIcGdIRHVHSytoTHh3?=
 =?utf-8?B?TTJ4NUtNQ00wMmtLOFM0L2dEQ2grMDhmNVp2S0lGY3p4N05yZTJya2FCMTB1?=
 =?utf-8?B?bndBcC9YSmhoTzA3QUVEd2UxWDhQN2RURmNmUTRvSTkwZU9OZ0t0aGVlUEZv?=
 =?utf-8?B?OHpNcGd5emREZmpzb2pncVlhQ015N2Z5WHBPUHFaT1NnV2NSZmZ3S2RBV2gv?=
 =?utf-8?B?aVZkTm1kNFNxalNuVmNFZHB1am1PZ1N6QjN4VU9SUkt0SHlndTFkcnpmTS9a?=
 =?utf-8?B?dXh3ZFRLWVYvU2FqMFU0amNTVG90Z2RBU3ZwbDVuT0FkL0dDNzRkRGMxV2Zu?=
 =?utf-8?B?ZFM5YlRnRk9Ca1FkQkJCMUIzUkJDb3E5OHQvOVZGT0wwdFVseWovNGFnaUZu?=
 =?utf-8?B?WmhySjljaHpIRk1HNHJhSEF2bFE1STdXRjhDTFcwZ0o3cWFnd0lQZ0UyczU3?=
 =?utf-8?B?bVBib0xlQTZJbGx0SzM4K1FzVHNuZHNRWE04bklNTVZRQXlXWU1jYmdXN2RO?=
 =?utf-8?B?d2JrV010TDFzVUZLMFlrMDdIc2pDSHVsWEJ3L2hDdFlKbWRSTGZWdlA5bGZW?=
 =?utf-8?B?ZEN3dkJKSm1wVEFuZlExaEZmZW5rdlFKQmUwM3MxdTZYZjVPMHA4RmU1MjZG?=
 =?utf-8?B?TTZLSVpxeFdEaHNMaWFXM2x5aXFCUSsxUXk4Rlk2YklMdVhtSHpJeXFybFh4?=
 =?utf-8?B?bFAyWnJnZUFaSVEzaFJGYlVzcTFPRnNQV3BhWGxhL0I5em9hbjBaRjhaQUQy?=
 =?utf-8?B?dW1URnNOSlFNNG1aUWxtYTgzMnJvdXAvaTFzbzJIK0lka0J3UzdsZzl3bE4v?=
 =?utf-8?B?djFtY05DNXluUTJKeWEyeGpvMEpJck0rd1BuZ2xyZXlkdzZtZUxuT282Nlg1?=
 =?utf-8?B?N2JNLzB5M2RvQUJyaHdjUU8vL09ZY0M1Sm1JVCtQRlNORnh3VU5iNVJ6Zk15?=
 =?utf-8?B?NUxOcy9QVUdVcUdwQzR3UzdGUWk4MkNMRDg3N0tHZVl0ZkNZZTV5R2VCanoz?=
 =?utf-8?B?djJEZlo5c083ZmRVb2tMSHk4WGU5YVlhU2tUTlZjaUFrU2x5a3hpVGY5VFlP?=
 =?utf-8?B?dURGNktiWmhQMU5ZRzl6Nkg2c2M1aHVVU1BtcElpREJ1SU5HbGdzRlZ6ZTNs?=
 =?utf-8?B?YXdNZkZNVWRIdEJuR2FiU2d5OU9YWk13aG5nQ2tOR1A5WnZNOXNWdjZDUXhz?=
 =?utf-8?B?QjcrQk1DRjF0TEZlYTR2M0l6UXlWSDFubWhlZGZQZmh5cExHWGpkcmVvaDc4?=
 =?utf-8?B?cEpaSktxbmJLa3dmcG9sQjk5bkE1dStvRHFXY2J5SHRod0FoeEptQUFtRmcw?=
 =?utf-8?B?YjFlRTVtMDhjWllTTHlyUHBVeEFiTXlMQTl2Wk5uSFU3bXVCS0xiSUtxL3Ja?=
 =?utf-8?B?OWozSk1FODdBN2RhKzEyNXBjSUpCMGxIdGcvZ3AxbHpCUWFQaEVUQ3hCdG5U?=
 =?utf-8?Q?pkUdOVb3sHs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8796.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkhvOTBsWlVqaXZxeUREMFViekdmUGI5NkE1SVAyYm42WkhsUS9BOFN5bUhF?=
 =?utf-8?B?NUt4ODBva3puYkVrWk14bFhBc1N3bkllY1M2T2UzMkJJU3kxbG5zV3Y0ZUJw?=
 =?utf-8?B?TWFKNFBCa2dYMnI4K1hZcm5WZVpRTVFMQ2JhM0c1LzBKbWREUDk1bitoRCsr?=
 =?utf-8?B?T3o2TE01Qk5mOUdxYWpyZzBBSE9UR0ZtcEVvWmVVbUpYQllESEdTWGIzbWtZ?=
 =?utf-8?B?ejRqc1hDZjZ0UVZvb01PSlp2aUtmUnU4K0ZpOTFuek9wRjZ1UE1kUzdXUEpI?=
 =?utf-8?B?T0V0MTRnczJjTkxkR1hEaVpYQWxJdUR2YkZacWtYY0hnUFVSVGFPLytuN25M?=
 =?utf-8?B?UlVrT3hNbmdNcFBqS1lZTkZxaWI1QXZ2dUY4TUM3dDFJakFMVHM4aTZBY2RI?=
 =?utf-8?B?bXJ3VDgvSWk5Z2llSEZDZE9NQjZkS3B6NUFoeXMwb1pOSXdEY3FidFRoUUtu?=
 =?utf-8?B?RHNSbVJNZm5aNzJqZmV5OFFlZXNhTlp6TStBaTVzeklhYWxTSmJpajdXWjU2?=
 =?utf-8?B?RS9VS3UzVUxWZFpwRFRlVmhVbjkrQ0JGYjljajVrQWlsVXdZWFRGMzlPczNS?=
 =?utf-8?B?Q1prMXJJK3BXL1pvbEtaTDdiYnRoVk9MVW5DYVRuamtta2NPTWExNXJxcERH?=
 =?utf-8?B?NTRRZTcxalVqMXJTN29BOFpTNFlBWnhYejU5WmM1NVBsK0RCMzRrK25WajlD?=
 =?utf-8?B?cG03b1VKZGtUdW5aZDNMU1E5OXN5MTJtaHBYL3JwY21vVmVkc0JGdXRMVkY0?=
 =?utf-8?B?d1dhYXVWcjRSWmdMbHYxTEswaVVKYzlKT042YTF2bjdIc0FMVUd3YVRCZlc3?=
 =?utf-8?B?b1YxL3lHMzNYeXpMZ0FFUWdzbTk0M0Fab1FkZFdndWp6Z2dYNXZ1OU1uVWs5?=
 =?utf-8?B?SmpiUXBVTlV6c0xnNFZvak91d2NOMWFXak1kcHJqMTdjbXhmaXhHeVovS2Yy?=
 =?utf-8?B?N29ydHovZ3pxTFNwS2xVOUtwaEplT2pGcURIR0F5ZjRBZklSNFgvYWFTMVNE?=
 =?utf-8?B?TTltNzFzWVZ2N2tRRlJvTDFQaDIzRlhiOG1yZUFyVmpUMENkWU5xQ3ZPTHBt?=
 =?utf-8?B?a2RZS216M3d1cWpmQ3BOcndZNWU3NlNRYjMwa3NuMDkxUUpjZ0VwMWRxWVhi?=
 =?utf-8?B?NzUybTAvdjhHME1qSjJmZnd4OHRMM1lNVTI5YmJKRis4eXJJYWxyeG5VYjZH?=
 =?utf-8?B?U1h0TkZ1eXF1WEVncDhyblYrc0FZMFFOVzhxaXpKLzluUFJMMWFIUy92b2VH?=
 =?utf-8?B?YWU1OUJ6L2tEbUxyYnJtQjNTb2tMbjdlWWxFU05Iam51SG4wNlB0OEhUSzFT?=
 =?utf-8?B?eGM4MlE5R0RJTCtUNGs2RzNpcTk4TVJZM3BmSER4c2tyWnVwTE4yaVQ3LzA2?=
 =?utf-8?B?N3lFbWlYRjl1RkUwbXN1cUV1Y2F3dXhVUEQyZkJyMlpzWlE1WlFkWURpL3ZQ?=
 =?utf-8?B?SXNURXVsYXNtV3djRXBBVzNFUklCSVBTSjl0NlhoUWM3elVtWVVSc0g0Nmp6?=
 =?utf-8?B?blVsMDBvMFVFSXRON1FWVm1yRHd1bkNjZXZXNFd2c0QxcVlHVCtHT1VBOWlj?=
 =?utf-8?B?a0laWkQ3Q3hxUlBxdmkxaHI1ZytMYkJHdEQ0eDJ4WERJVk9BQkV6aEsxZTJP?=
 =?utf-8?B?aUp3dGVPMWhwZndSRkp1QjdSZ3VOSllac1NLNmtyc2dWUWJpelcySWlaY2Fx?=
 =?utf-8?B?RHJTY0RHaWp2bkJPTDU1aEJiYjhsNDhLeUZ1bkhQVHpKYVdHN1AvZkNnZWNR?=
 =?utf-8?B?emxETHBKTXF6NmF2MkRJSmhXbTlQV2pxaVh0Zm1JYlB6VEJ2MHVCR3VtYUxD?=
 =?utf-8?B?LzJ3Vjg2dWNZdmZBUUkwK2FsZy9GaEdsbmNzcGlKMjN3VXduODR6Z1kza3NZ?=
 =?utf-8?B?K0Uvc0RTSWl5Tko0NXNPM1NlRWd5UHhxT0lYQk9VWE9SNVNpWk5Fait5Z29V?=
 =?utf-8?B?UnFPeno1dU5pZEpOdGtUa1V1dVNkeUFONnZmMUkvRmp5eklWeWRVb3B2QVVs?=
 =?utf-8?B?U1FDc1J6b2dBcUh0ZDVwY1VLTHlsMHZUOU53MDIvZWFMTHp4VytKRUxLa01h?=
 =?utf-8?B?bFNRdVgxTEswb05NVWdPdXkwaGhTSWFxK3hMbC9lVlpLcGo2TW1XVmJsM1RW?=
 =?utf-8?Q?9CsYw7Vr/JvgQ1R9yCsfTcezQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BC6FC722F49234C943942BFEC3B371B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NW06VoY42TFZYLdXphgoRe43mv8JDDaMQbLLVGAdlECicapUxxNbz7qPChraEZ4Nce04uW9e9bN4mPAXov/jl1tCfTDP9xew2QlEINRrEzJS1LmjVPuY2b4/Ch+xNawP4U2Wqd2lefYd50+tV3fBIzGZ/VSE5zP/U9spbD8DaTHTnQeBtpHp8pV19Rb0XcSuZqqBrXZnm80ByCr1++S2YhHyWcp3b4tIfyoriBJFOuk8WQE6yt3N3x549cX3qnvTHz+KN6cFIxjGXGSPm+YEgE0AcRqtAl3zSiUDZBiKvBjL7OGjfY0BHltiWs+b9r13kRYveH/SG0CAK4Kcfvded/5Hwr8iY2T3S1vwzzXKUVCcR2gUDfZ8/hVitkjcEUgsO4mZGHx8s/FFZv9q6WPefTIxB3kby5Y0VeMvyisd+b2fxJ8Hh0T+mVG7LgjCaFy3Mt3mCSDSUrAc9eqd9XmLurYmZKTUfgfGUo09wg3kO5Q/Cb7EVZ8PwM2H0lYvYhP5773+Cgvk3WDDlzM9QxyY9sXkC1Y1Ape2lUwy4RiGJO41N7JnXQRxBbEFzJoQd73aQR8LHPbHAA4+kEABZQJnkkyZto7MZ845CQGsvjUoZxoTzlsnvApWK++O1ZuyaBJBLZpTrjf+q2BdETrZNFCVpA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935896a5-0331-4d73-732f-08dc99927dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 05:56:03.3836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPx8NyOBDw02dJW/bDDTdp8Phba1Ayr9XCZhYhaWHoQ7nhVggpAvzO6hWNsRQfIRjnY1wFtlxQE7TGPLO1FRUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982
X-Proofpoint-GUID: DijTqd-ssNGhZdaEbxJFTTbjR9oTqNhd
X-Proofpoint-ORIG-GUID: DijTqd-ssNGhZdaEbxJFTTbjR9oTqNhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_04,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407010043
X-Mailman-Approved-At: Mon, 01 Jul 2024 20:57:14 +0000
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

DQoNCk9uIDYvMzAvMjQgMTk6MzYsIFN0ZWZhbiBXYWhyZW4gd3JvdGU6DQo+IFRoZSBjb21taXQg
YzRhMGY3YTZhYjU0ICgidXNiOiBkd2MyOiBTa2lwIGNsb2NrIGdhdGluZyBvbiBTYW1zdW5nDQo+
IFNvQ3MiKSBpbnRyb2R1Y2VkIGEgcGFyYW1ldGVyIHRvIHNraXAgZW5hYmxpbmcgY2xvY2sgZ2F0
aW5nIG1vZGUNCj4gZXZlbiB0aGUgaGFyZHdhcmUgcGxhdGZvcm0gc2hvdWxkIHN1cHBvcnRzIGl0
Lg0KPiANCj4gSW4gb3JkZXIgdG8gbWFrZSB0aGlzIG1vcmUgdmlzaWJsZSBhbHNvIHByaW50IHRo
aXMgaW4gc2hvdw0KPiBwYXJhbWV0ZXJzIG9mIGRlYnVnZnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBTdGVmYW4gV2FocmVuIDx3YWhyZW5zdEBnbXgubmV0Pg0KDQpBY2tlZC1ieTogTWluYXMgSGFy
dXR5dW55YW4gPGhtaW5hc0BzeW5vcHN5cy5jb20+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy91c2Iv
ZHdjMi9kZWJ1Z2ZzLmMgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL2RlYnVnZnMuYyBiL2RyaXZlcnMv
dXNiL2R3YzIvZGVidWdmcy5jDQo+IGluZGV4IDdjODJhYjU5MDQwMS4uMzExNmFjNzI3NDdmIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2RlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MyL2RlYnVnZnMuYw0KPiBAQCAtNzAyLDYgKzcwMiw3IEBAIHN0YXRpYyBpbnQgcGFy
YW1zX3Nob3coc3RydWN0IHNlcV9maWxlICpzZXEsIHZvaWQgKnYpDQo+ICAgCXByaW50X3BhcmFt
KHNlcSwgcCwgdWZyYW1lX3NjaGVkKTsNCj4gICAJcHJpbnRfcGFyYW0oc2VxLCBwLCBleHRlcm5h
bF9pZF9waW5fY3RsKTsNCj4gICAJcHJpbnRfcGFyYW0oc2VxLCBwLCBwb3dlcl9kb3duKTsNCj4g
KwlwcmludF9wYXJhbShzZXEsIHAsIG5vX2Nsb2NrX2dhdGluZyk7DQo+ICAgCXByaW50X3BhcmFt
KHNlcSwgcCwgbHBtKTsNCj4gICAJcHJpbnRfcGFyYW0oc2VxLCBwLCBscG1fY2xvY2tfZ2F0aW5n
KTsNCj4gICAJcHJpbnRfcGFyYW0oc2VxLCBwLCBiZXNsKTsNCj4gLS0NCj4gMi4zNC4xDQo+IA==
