Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNP9OZD4kmlx0gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:59:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB4142981
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BD210E24B;
	Mon, 16 Feb 2026 10:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="LEAB5QBi";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="eg5lHymo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AE910E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 10:59:23 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61G710Uf3974293; Mon, 16 Feb 2026 10:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=c5anwuNEVUaeTXB0Pv1N4wQHp
 0ctNarVLVf3hOgD4ws=; b=LEAB5QBiaSEus5pGWqKkstjPoLksnaWAHl0AA9Lon
 BoEZOGKk44tTDv95Zahzr6Bx0ozJLUEkmqJI35a/F5kDYF2bThp6EQJ9kTMPpxba
 UKbiG7XtVQsWKGjdgLvFS/KZTmr3ydcxKBeC8G981JGSjgU6j1q0NvjXuD7PqwBM
 nYtu4/Co8zoDaPoW2f7Vv2LfqL8TgsMUO/Ca9pD2c1LWlpy3QAz+QiuijiD3dkJd
 xGHsqW5mbXbGDR+QYu1CLjdDO5YjcO7TRTWi/IqkwioZ+hr5vvjQbbA0TKWY6RVJ
 EZlsQSilt248GNHoo0cakxPRQ8QCqJ+fLu7Og21z0bvXw==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020120.outbound.protection.outlook.com [52.101.195.120])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4cbcqq8k7v-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 16 Feb 2026 10:59:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpH8sh6yobOS8o7Pdb7SbpscEZuVLHg4wJ3a0Bga0FjtkyBtt1ApgBApdGOqbiQXQ778T+wTBJazGkd3cETpyNbXLELrmy23PWPNMUVBghoR71zcIN6IdLqKGWHKspTatM4RLVaHFkMxx1uHTxwwQ8BL4E4IcBRZnUooOkzuqmJ/Ni1bZbCCR3ff91Iao5xXCN65gA8Sd/YcSEwrVo/DlESpS6dVSJP6yyV3QFsRlirvRLEOIqMzO8MLRNOapB2NoONLuPxUlul5+/Uu6lw8wkX8ZQsCI5iIHmH51QrXGy6jkn/Q3xlD7q8cW9JCcuSEaqsOlwrEMWh8e+bZSLgg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5anwuNEVUaeTXB0Pv1N4wQHp0ctNarVLVf3hOgD4ws=;
 b=cXuusqFibw9xdGhFLUC0eShBGPxIJa6X/qskv4GB8WEweIeY4qBo63bjEbCZr4tJita+ft+AiZnMMZjeeDnTgkSrazqm89yM19uNfV4L/f4nyjKMfFBUk731rvLOuGVWnGLOBLkvJPp90NecoY8tL2nOOManH+Egmj4EDBv4pN4+kwDzcME7GGVWezW2hTq8uorqJVfhLeDqpEHYh2eZlI+UkqXfCdn23nO+qUkdmTOiILvQIYx96FSKQvlOWcuOYCPkFRM9cpaHdSbsznfdXr9VLKCNXdceKnZF+eRaoSpsUuNi6yuTqp7zALp2W+rGaaKkSAkKRRLHLDbI9KG5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5anwuNEVUaeTXB0Pv1N4wQHp0ctNarVLVf3hOgD4ws=;
 b=eg5lHymoe/iwB3IFzHHzDm53TBqmVsYYCq8gb0vupm4zqm8SGomWZCS+392bksLbsSd08rrP46cBp0zC9WJP/snn9FZtX8j4juY1mE2YsvJW57txFMAqX9P4eCeVpRnKpMbB0LgKsNbMW8q6uMEBdLmqTpPliiJJ3Xrf9ZkPn54=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by LO0P265MB6502.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:59:12 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9611.012; Mon, 16 Feb 2026
 10:59:12 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Marek Vasut
 <marek.vasut@mailbox.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Frank Binns
 <Frank.Binns@imgtec.com>, Brajesh Gupta <Brajesh.Gupta@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Topic: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Index: AQHcnzNIVZFC/8YcoUa0GPQhI8PvNw==
Date: Mon, 16 Feb 2026 10:59:12 +0000
Message-ID: <9028586c-4e81-4a6d-aed6-bc1fdb7058a0@imgtec.com>
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <47f95b5b-c240-48b1-a904-2285700a9d3f@imgtec.com>
In-Reply-To: <47f95b5b-c240-48b1-a904-2285700a9d3f@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|LO0P265MB6502:EE_
x-ms-office365-filtering-correlation-id: dd2a8771-f787-4ea8-129d-08de6d4a6b35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|6049299003|38070700021|4053099003;
x-microsoft-antispam-message-info: =?utf-8?B?TEJ1QjJSdGpKT0l2MVBIaEN6b1o5bmZzRk1kSkJQWVNWMUdQTkw3K1MwZGZY?=
 =?utf-8?B?Y0FsZnkxK3ZmR2ZMNUZ1M1kveVRyVEMxNllHVm9JeFJ6ZUhqT1FXUXRYbjNT?=
 =?utf-8?B?cjVSbGVsZXhUZkN0MnVNaXR1djlVSmROcXJJd2s5djNsaWpFVWxrNldadTV6?=
 =?utf-8?B?VDdrRGFWaERpTS9BUmswdXYzeU5jUUR6YVloZ1o0dWdHWnBINVVQMHNLbzg1?=
 =?utf-8?B?ZHlhUXRNNHV4aGMxTHowODNOSEl2RHp4dTk4cXdnK2NjTXFBV1dlcHRJTHZF?=
 =?utf-8?B?U1hEZkM4b252WnBrQk5maDNGQzRKWjRLN0hlS0JKdEZIMUlPcVh3Szl5YTRu?=
 =?utf-8?B?TjJqWEJrc0Q4ZDZ4OFhyQnNyQmVCNmRWbEtCcDkwU05tNm1XQmloenE2T1F4?=
 =?utf-8?B?SFJNWkp3cHFxSnZvVFVHWHlXK0dyQlVzTTlyM1R5RXVaamtCQkFEaWZXbklT?=
 =?utf-8?B?aisvdmV0MFpNNWEzby9UT0VHK0J2cEN2QkU0encxWGJiaytmU0dwTzJJdUNx?=
 =?utf-8?B?WXU1VHNiNTNLTU5qNER1MUlhZ0VXT3NCVEVzc1h2aDBHSis0aHczdmR4blRp?=
 =?utf-8?B?Q0VOSDQwN2pFMWJBZ1pUY2J5WHdTV2JuY2kxcERWOXQwUmh0N0FNb2dZT244?=
 =?utf-8?B?SUhocCtvVTltRzh2TXg3cXA1Z0hrKzAzU0l2eldDb2V1U3RSRCtCWHlDbWkr?=
 =?utf-8?B?azBnUHZhdnZMOXZuSmNXT0xYMnNUNEgrRjgzY3JQdVBEdHc1L1plaE5vdUh4?=
 =?utf-8?B?T205Q0ZZVnBhcjM5NSs1OXY4Zmx4TTdRTDBodnd3RU84ZUgyZGszU1dkSS8r?=
 =?utf-8?B?Y05QUEMvaDBmYjNlTzRpdFhmVjNSMXpqNzQ5c2psbk43cDloRzlwcEIrVy8x?=
 =?utf-8?B?cGpTK1RURkFHRm1nTUIyY1JQTW8yQ29vYnIxSkNyNUtJUUFzd3JkdVlxbmRn?=
 =?utf-8?B?a08rTEdZa2VYODBSRUdsK3NGVHVIcDZMM0s2K2J3TUlCWGE5NXRSOWUzaTJC?=
 =?utf-8?B?VC9vYXpRQmJNajcwWkdGZ1JxSThFYkVsZmtiaGpBUDMzQk1WY3U2Z1JvTmF2?=
 =?utf-8?B?KzFzWVQ2SjdxalZZeVI2VjU0bXhSalVnbURrNlg0ajhYR0ViT2VJTVI2ZWVq?=
 =?utf-8?B?RERXZSsvN096aDFQalZCV1BwYmtoWGNKS3UzOFg0bzVsSzlVRVREOWx3ay9B?=
 =?utf-8?B?OWx0YzVjMVpHeDVReUdPUjJjSFNMKzRWWXRPNENhVjBIOGIvN3hBaUtWZUdI?=
 =?utf-8?B?UitWSlhsQWI4RXdTQUthckVCRWcxU1hSMU42d1ZuV1IwV3hMN2I5S1dEaFNX?=
 =?utf-8?B?Rngra1p3V1VHOFNxNTN0dW4zQWkwYTF1MEZjTGptWks5WFNsbUdkeStXdmdZ?=
 =?utf-8?B?eTZyeHNUL0Q1OUVzS2llN01mRDdEL2RBN05oMGxnaDBDaENaUEJBZHJSajlG?=
 =?utf-8?B?M3hiWW15RjMzbGFJOWxHVy9VQ3hYUlk2RHhYYnZRWG02V0cwN0pSeFNobWtD?=
 =?utf-8?B?VWhYSVM3R0xveGV3YjU2VmZnODhiT28reUhUNGprVUx4WVE5M3lIa01XZmFl?=
 =?utf-8?B?Z2V2cDNzNjJwdTBUTGw5eFYwT3pHZ3FpUm93NWtnQ3hOQ0F3WUE0c09NenVw?=
 =?utf-8?B?bzI3VnBNYVltWXZaNEY4bDVYZXc0ZVczTnlnTFNyaFVyQWhOSm53NHh5TjBR?=
 =?utf-8?B?dmcvejR6OStpa3ZTVC9PTGZZUkd1NUVzb29pRnpJMStxcmhvNmx6cWJTdGFy?=
 =?utf-8?B?K3FTaU43TEpqYjllNlErZDhQam9YWmtOYjBOdEdTZWd1T1pkL2g0cGNxck9N?=
 =?utf-8?B?ZWNsNFpEVWVMb2xRclVUSEhYczNoY3lBTlg4dkh1ZTEvbFd0ZG5KeExJc0ZB?=
 =?utf-8?B?c3FuOUpLcmF1MkY5aFJBdk9JQmVVME1BTnJKbnYxNXA1ZnZNd2g4STU3K1Mz?=
 =?utf-8?B?MEJMR0F2UWxkaC80dElWdWJJRW5tRy9WVUhtdFJrRVNSck8rQzlyTnFZV2xi?=
 =?utf-8?B?clVxQUxCSjBJY05xMlFYS2szcSt3TGloMEE4VUJvTjFMRW9MbmRzNy9sY2ho?=
 =?utf-8?B?ZGpIeGtjM3FXa3ZEbTMrWjU0UlFHUisvRCtwWk5jVlZPTkZHR1FxYlVCSzdV?=
 =?utf-8?B?M3FqWVorOWtMRk9qQXBVUDFSbkZXb0FTdUl2c2JYWnBlcGNub2dIR0hWN0dn?=
 =?utf-8?Q?HAj+hL445q3EcS6oWKhWWQtIA+V6iaIeDTzey2UrMmwr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(6049299003)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHM2SnlBMi9OWVQ0Y3NxSW1GeXVxK2V5VFoxMk1DcTA2TldGQktEQTA4cFkx?=
 =?utf-8?B?YWFEeDFEczN2d0NUTExCZGdWbXN0ejhQRWh0ZjVTVVVPM2hQRW5BLzhrQ2Zp?=
 =?utf-8?B?QnVzYWR4S3Jick1Ca09YemprVFk0UW16R0VmV3FFN09xU3RKVk43SjBZTGFH?=
 =?utf-8?B?UzBadnZwYmVoVjdMV0FRNzc1TmNxZmVEektDanhJRkR1V1k3ekorajQvbGpy?=
 =?utf-8?B?WDJLY3JCSklkNjFFeVQwTVJOeE80Snc4YVd2RWVDWmV6MGRva3M2L2tKMXov?=
 =?utf-8?B?MWZOUFVVdjVweCtJKzE1eXZibjBEK1hUazIzdGI3dDFNaE5zeWZwMG5qWkZ3?=
 =?utf-8?B?S0Q3dE5vbmM0THh5Z1Y1ajFIVHlTN3A5M1E5Y3ZYYU9Ld2YwcEpjM3hiUzI5?=
 =?utf-8?B?TXBjSzR5RHVsTFRhQjh3dzJGd21UbFlqTE1FL0hXRDgxVWkwQzdMZlFpMDJZ?=
 =?utf-8?B?NWd1bEtGb3FWdXV6Wi9LQXlscUtKNWt2VGZ6NmYrblZRUHpKbjR1WVVETFNY?=
 =?utf-8?B?NWVqUDZPWElxSW9PbjdPclBKdXl1bGlYT0VJSEo3a1BjclljNlhSVUdiTmtS?=
 =?utf-8?B?cFExNGk5VnlpM09jRnpNcVJ6Mk1tNE8zOU9aL3FLQzZDelhzYjFNVEtUS3V2?=
 =?utf-8?B?SXFqU2dFbElHNzJPRUh0b1JEOCs5V2JXNE5JMUpCakpvajFRVWpJYmdsZUJO?=
 =?utf-8?B?cWpicUZnM050aWtIaXZsSnZPMWN3eU9pQTlFL1FWZjEzYldLMU1WeEViUzJJ?=
 =?utf-8?B?NWFQWHRqN0d2eXk1MW1tWk9JTlB3a2FlY01nYkx0V29wcGdtN2ZRbHZSNzkx?=
 =?utf-8?B?MGdhNnl1MVIzNHlGd094ekNRZ3FZQnY5L2ZmUDREek5RSGtnYWg3VS91azZw?=
 =?utf-8?B?MExnMFBRaVRMWFVrd1luYnVpYVRXd1JXdEQ0dUR1a2J2TlZ4ejExbkxYWm5U?=
 =?utf-8?B?cVhIQ3dsSmI3RzY3K3dwbmdBTTZHZStqU2RyN1VpdXBOL3RQVEZJYUZpd2hn?=
 =?utf-8?B?SmVCdzQxM2ptSFNERndvcnZJeHRjTnpWSmZ3UEtnQUNTOTg5Zy9oMk9WcU1p?=
 =?utf-8?B?STBCYU5tQmc1T01WaDJZVGRIVmg3ZXk1MnZ4YkZSUmNDamtrWHlqcmVZWnF3?=
 =?utf-8?B?U2VmZDFoQ2JVZVRMUCtVWVF6TmlXanRLZ1k3a0I0RTMranF3WFEwcnB2L3JQ?=
 =?utf-8?B?aDg3ek1aTStGMjBXQmRrY2h1eDRDU05vYkRkcmRxRGFheTI1TlJSQ29aWXpW?=
 =?utf-8?B?dzdXTTZNcU1NT1FjOUl5TmVaVmlDeFNmOHFaQzlqUXo4bUt1cU04cjVCeUNi?=
 =?utf-8?B?bjJkb0F1MWtGV1lLamF3QUJERTZ1L1VKa1Z5SlFoZmxhVzl4NkJBUmNRdFgv?=
 =?utf-8?B?TklVRUNZb3NhM3Q5QzdUdEhxSjNXSWdTTE8zU1NUWkgzek0zZytybVhBbzFE?=
 =?utf-8?B?QVRtQlNnaWEwdnE2L0Y2Q3hLa0phRlluU09GNFdkQTg1NXNkbEJ2MUxWb2x0?=
 =?utf-8?B?QUtQeHY3L0JISFhDNnFZTzV6cWdKS0x1SkZCdTRldEFxc0pYaTdyYzJvUzdM?=
 =?utf-8?B?dEdKZ0lQNm8xbXV3b2w1K1FFbjh1anpsclZ3RGgzaXlJdHlMZlI5dDY2elU5?=
 =?utf-8?B?SUhVMFpwRGFhbVBuU2UvVDFGNlFnK2xObnBPSjQ5ZHlIYnNtdUs3SDJNWTFv?=
 =?utf-8?B?akxGSnlDeDlVMWFJUHNwdWY3eE1ZUTZvRU9FVW1IRjV2ejR3MnVpa0NxYUox?=
 =?utf-8?B?RmI4dW1OVHZPcnZrYmVKR0N1bldkWWhpVGJ3VThhUGc2RDFQRWVMYzZ6WUFi?=
 =?utf-8?B?R1Y5ck1EMUFGeU1WdkNudURITTR0b2g4cWxFdHhWcGJjYi9XQUgzdFFLTlc5?=
 =?utf-8?B?M3d0VDlhaGdwNnU1YTN3Y3lHYWRyWkRubFNLUis3Q1FUdFF4M1R5ZXVMcmtI?=
 =?utf-8?B?WFlxMWV2dyt1bXpGbVNIT2VORmx6blpqSDF5RkY3T1V3LzhrK3BOTXpMOUZl?=
 =?utf-8?B?aDBLRjkyOXhSd1JXWVJQZUt3cUVxY2Q1K09wSEptYXhsZWRBT3E1aFVYeFJh?=
 =?utf-8?B?TWVMUmJIVmcyOTNmMEUzVVZINkxuN09OU1lpM0VWazkrVEt5TDZaRi9LTXMr?=
 =?utf-8?B?ZElxOXdnWS95WENmOXVoNmpJS09VQ1g2MGZ5d3pONXRwNVFRSVJleEoyNGpx?=
 =?utf-8?B?M1Ryc29xcWxwMWNsYXFMNlZySkI5SjBXQlQrQ0lCSGFvWDRhODRuLzR3VFFt?=
 =?utf-8?B?L1JRNEcyelRuRy9WamZleXVhVFlPa2diQW4yTnBIaEtrM2xMREs2WEVzTUR1?=
 =?utf-8?B?RG9mdmlROG5qWEp1cEFoSk1hSXJZTFFxQUthRnZoNFdLSTY5NU5EdHp0RXhR?=
 =?utf-8?Q?adCK8jbKgSU1qMg4=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VE4FfxC8FPSSFgTto23Dm4ob"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2a8771-f787-4ea8-129d-08de6d4a6b35
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 10:59:12.6733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UQdtbLS4ef4d+ZKGqEA5rv/epJoQ4+OOZBTos73wp/Llz6uscJy1KVyYKW1/aEs/4LDOxGhGMlDxE+H4Sj64Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6502
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MiBTYWx0ZWRfX0T35f0RgeJlI
 0e7Rs4XxOvdqJk1KAVnXOhAzWhjxAksFl2iqEXcs0jPAK2dUDD/XAS42LMbe0q6Fr+ldjstH/K1
 qgKhtEKrggbYKMo/SGRLSNOGSIbUzp37TSevDhp5FyrgMXP0k3dja3P5UbHEMIUKQnagJnFWRW9
 2sMEgMPVqFmTUGHvgKlnE/bc1nxqsbbeH0FHPCbHl4eyY57J6EFcLMuAybBoJ5FVvKiojVMytb4
 ikEGkI855jcHlG24vUk2c0V929n+13yGETSZEcS5dSlid93FYeqAYqubBK3yd0xKQxvh+Fk9Ehl
 qgQXbnGUwEV9DbGqLCt8r5iqtiEsXONvlMQAw0y6g2pRjYMzZrpUuwTmNEaP020+XFd07xGnHWU
 WuyVUG9eNh9iH4uyHZAt1nxxabVMhnAAcr7qTGeJ2AHN1/Bt6probQJTP5caxX39avbTkn4Nh8g
 Pw5VSTSB/85RctR6TaQ==
X-Authority-Analysis: v=2.4 cv=aepsXBot c=1 sm=1 tr=0 ts=6992f883 cx=c_pps
 a=r6flpba3aIlT3cEwwQ+y1Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=pGLkceISAAAA:8
 a=b3CbU_ItAAAA:8 a=EHq_tcq5PHyuLU4A2wkA:9 a=QEXdDO2ut3YA:10
 a=hkJlc_IRnfUFjANpJ7wA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-GUID: P4xPuCwms3S_thxKk9BNXljrZYPRTdAA
X-Proofpoint-ORIG-GUID: P4xPuCwms3S_thxKk9BNXljrZYPRTdAA
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:marek.vasut@mailbox.org,m:geert@linux-m68k.org,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[linux-m68k.org,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:mid,imgtec.com:dkim,imgtec.com:email,IMGTecCRM.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 42DB4142981
X-Rspamd-Action: no action

--------------VE4FfxC8FPSSFgTto23Dm4ob
Content-Type: multipart/mixed; boundary="------------dziar7a5yYZRTekdxfTKCGEo";
 protected-headers="v1"
Message-ID: <9028586c-4e81-4a6d-aed6-bc1fdb7058a0@imgtec.com>
Date: Mon, 16 Feb 2026 10:59:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
From: Matt Coster <matt.coster@imgtec.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <47f95b5b-c240-48b1-a904-2285700a9d3f@imgtec.com>
Content-Language: en-GB
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <47f95b5b-c240-48b1-a904-2285700a9d3f@imgtec.com>

--------------dziar7a5yYZRTekdxfTKCGEo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Apologies, sent the wrong draft. Please disregard and see [1] instead.

Cheers,
Matt

[1]: https://lore.kernel.org/r/21b1fd77-252e-4fb3-aa65-1c26043c5412@imgte=
c.com/

On 16/02/2026 10:57, Matt Coster wrote:
> On 12/02/2026 15:56, Thorsten Leemhuis wrote:
>> On 2/12/26 15:38, Marek Vasut wrote:
>>> On 2/12/26 10:00 AM, Matt Coster wrote:
>>>> On 11/02/2026 19:17, Marek Vasut wrote:
>>>>> On 1/23/26 2:50 PM, Geert Uytterhoeven wrote:
>>>>>> On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com>=

>>>>>> wrote:
>>>>>>> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
>>>>>>>> Call the dev_pm_domain_attach_list() and dev_pm_domain_detach_li=
st()
>>>>>>>> helpers instead of open-coding multi PM Domain handling.
>>>>>>>>
>>>>>>>> This changes behavior slightly:
>>>>>>>>     - The new handling is also applied in case of a single PM Do=
main,
>>>>>>>>     - PM Domains are now referred to by index instead of by name=
, but
>>>>>>>>       "make dtbs_check" enforces the actual naming and ordering
>>>>>>>> anyway,
>>>>>>>>     - There are no longer device links created between virtual d=
omain
>>>>>>>>       devices, only between virtual devices and the parent devic=
e.
>>>>>>>
>>>>>>> We still need this guarantee, both at start and end of day. In th=
e
>>>>>>> current implementation dev_pm_domain_attach_list() iterates forwa=
rds,
>>>>>>> but so does dev_pm_domain_detach_list(). Even if we changed that,=
 I'd
>>>>>>> prefer not to rely on the implementation details when we can
>>>>>>> declare the
>>>>>>> dependencies explicitly.
>>>>>>
>>>>>> Note that on R-Car, the PM Domains are nested (see e.g.
>>>>>> r8a7795_areas[]),
>>>>>> so they are always (un)powered in the correct order.  But that may=
 not
>>>>>> be the case in the integration on other SoCs.
>>>>>>
>>>>>>> We had/have a patch (attached) kicking around internally to use t=
he
>>>>>>> *_list() functions but keep the inter-domain links in place; it g=
ot
>>>>>>> held
>>>>>>> up by discussions as to whether we actually need those dependenci=
es
>>>>>>> for
>>>>>>> the hardware to behave correctly. Your patch spurred me to run ar=
ound
>>>>>>> the office and nag people a bit, and it seems we really do need t=
o
>>>>>>> care
>>>>>>> about the ordering.
>>>>>>
>>>>>> OK.
>>>>>>
>>>>>>> Can you add the links back in for a V2 or I can properly send the=

>>>>>>> attached patch instead, I don't mind either way.
>>>>>>
>>>>>> Please move forward with your patch, you are the expert.
>>>>>> I prefer not to be blamed for any breakage ;-)
>>>>>
>>>>> Has there been any progress on fixing this kernel crash ?
>>>>>
>>>>> There are already two proposed solutions, but no fix is upstream.
>>>>
>>>> Yes and no. Our patch to use dev_pm_domain_attach_list() has landed =
in
>>>> drm-misc-next as commit e19cc5ab347e3 ("drm/imagination: Use
>>>> dev_pm_domain_attach_list()"), but this does not fix the underlying
>>>> issue of missing synchronization in the PM core[1] is still unresolv=
ed
>>>> as far as I'm aware.
>>>
>>> OK, but the pvr driver can currently easily crash the kernel on boot =
if
>>> firmware is missing, so that should be fixed soon, right ?
>>
>> Well, drm-misc-next afaik means that the above mentioned fix would onl=
y
>> be merged in 7.1, which is ~4 months away, which is not really "soon"
>> I'd say. Or did I misjudge this?
>=20
> The above isn't really a "fix" per se, it's just an enhancement. The
> underlying crash can still happen. We could still pick it into
> drm-misc-fixes and have it in the next -rc plus backported to stable,
> but I'm not sure I see the value.
>=20
>>
>>> I added the regressions list onto CC, because this seems like a probl=
em
>>> worth tracking.
>>
>> Noticed that and wondered what change caused the regression. Did not
>> find a answer in a quick search on lore[1]. Because if it's a
>> regression, we maybe should just revert the culprit for now according =
to
>> Linus:
>> https://lore.kernel.org/lkml/CAHk-=3Dwi86AosXs66-yi54+mpQjPu0upxB8ZAfG=
+LsMyJmcuMSA@mail.gmail.com/=20
>=20
> From our side at least, I don't believe this is a regression at all. We=

> haven't been able to reproduce this issue on any of the platforms we
> have available (although we did stumble on a related bugfix[2] while
> trying).
>=20
> My current understanding of the situation is that the fix proposed by
> Marek in the Reneasas driver[3] works, but is not suitable since
> pm_runtime_barrier() should be inserted by the caller, not the power
> driver. But it seems that's not always possible (particularly when usin=
g
> devm), so I don't really understand where we go from here. I don't see
> anything we're doing substantially differently (before or after the
> commit I mentioned above) from anybody else.
>=20
> Cheers,
> Matt
>=20
> [2]: TBC
> [3]: https://lore.kernel.org/r/0e9f963b-00e0-43d1-b567-cb10b8f66df1@mai=
lbox.org/
>=20
>>
>> Ciao, Thorsten
>>
>> [1] I guess this was the initial report from Geert?
>> https://lore.kernel.org/all/CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgo=
Yi0i9_PDQ@mail.gmail.com/=20
>=20
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------dziar7a5yYZRTekdxfTKCGEo--

--------------VE4FfxC8FPSSFgTto23Dm4ob
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaZL4gAUDAAAAAAAKCRB5vBnz2d5qsPz5
AP0X9LD31AzyA09No8Cdqehomj3z8VnJbp4OvGG+pB22sQD/TvihkzJChewizE+/5rfwox0SDmwc
paw2NacBpW4x5QM=
=mYPf
-----END PGP SIGNATURE-----

--------------VE4FfxC8FPSSFgTto23Dm4ob--
