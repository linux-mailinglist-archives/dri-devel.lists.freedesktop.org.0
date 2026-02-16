Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGBYLz/4kmlx0gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:58:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1443114293E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0572010E23A;
	Mon, 16 Feb 2026 10:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="QS6+Q31k";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="kul6RYJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D0010E329
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 10:58:02 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61G8OMck4122430; Mon, 16 Feb 2026 10:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=mRiJKwMpD/tvXwGEbuJEE3h2t
 Nup2Bvveya6MIudmBs=; b=QS6+Q31k9eCW/GyXRVLk7+OwU1dt6VpwSP+9qnYZv
 wWUBPW7jTb0LSy6zP88C9F56G8iBmZBmO1gNMF90asM9GBuPzHWXA+ffmdojkwc+
 kbnLO8+Upb+vRRDyX7jhMZ/9FXEBve4vDBd+ZZlDAEBUzSsxdYA93AImHepIo1gh
 yUoFBa42XoIbxVOQXUEVRN+j00o1mXjy4j3AjxSw6xRMAsbsDAAmRIsktj4dq2XG
 1bsEKpA2ZTQPFnoKOz6UupHBlDxM9hXt4CPYtN/cE2lv0g/NkHYAJS1fOjH1ov6W
 vkJVKYytbzwEnSgzVc3cuE4sCmKTCEWPcE9nzSCSWS8Jg==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022108.outbound.protection.outlook.com [52.101.96.108])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4cbcqq8k6x-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 16 Feb 2026 10:57:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9IjkT29yEyRyTxGZ7zuXBdg3jsI4YyJtGtjuzz5Fcr2TWA4qWJ9P3kkUkfo54IHpLfKr9ipuZjzwI5bg/FWDN9UCGnNPZSC5MSn1bGMZcw6nzXGoKr2eGJlISyahxxG/N+Cc7/ocp1nfdkd/Bj8xK3QHTnoffBQZ3/04ZaZlnw2ICpAL8sOC5AnuZc0QstfqlzBqTFOhcp5P6TSkJEgzoZsfK15MQ0O+I8LnVfZqcqXYOgrSZxSBmqZ6eCAW2ZHfjHZE5LC9rdQYQh6nUikY+emF5a0FZsgrL0fr24ykjLHkkb0ThV1imr7bTpYIs1ezaNT3DATXuAcRCP6khpgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRiJKwMpD/tvXwGEbuJEE3h2tNup2Bvveya6MIudmBs=;
 b=Iv1K3ee2lHVILkklAXIar+cf8UfqQKBEGA5rCpX6tPFYT30uN7d0hpdPqgbvyYg/B0FtgE51GQkbtWotQf7MAbN8c2qNIS9VcD8nOJRqKwRc180QTDs85cdS5QxCCjq0wOUvI7zajD5kp0Dq/dYDN56ScX+44U28TQwfqEhdrYdwLikvJbqJjxNae49p5S0lqjIrOsqPgUQ9o4ZGOUypUs70cZUD/nZhb/l/QcA9COErFGe4bdjXSCvaX/jFcW+7pmZ78ZXbtGo2fhCSI6OKGq2cTL2t2MHqzC4yGHRlTRrB/te3B5+paqFYq2IWQa4LeJNTSTiluFMGfS0PW34f6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRiJKwMpD/tvXwGEbuJEE3h2tNup2Bvveya6MIudmBs=;
 b=kul6RYJp9ivkAAxFEfqaRX3IYN5yIkp1oG0NsKZqp+BkjYQHnx54dc+2Ei26Zz6Be1tcGcUEAtZNwHiAHBw6MN3ZioVLboVgwHcBxb+Fy1QQeRJD7pwYFlVZG2mvwbWAaM4tVnOa4SnU5R/J8YSljxTiao2d3VfOu/jfd1Y4CoE=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by LO0P265MB6502.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:57:42 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9611.012; Mon, 16 Feb 2026
 10:57:42 +0000
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
Subject: Re: [EXTERNAL] Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Topic: [EXTERNAL] Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Index: AQHcm/3/AKo4xXXLv0uJMpBqoebXi7V/IpIAgAAVnYCABfX5gA==
Date: Mon, 16 Feb 2026 10:57:42 +0000
Message-ID: <47f95b5b-c240-48b1-a904-2285700a9d3f@imgtec.com>
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
In-Reply-To: <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|LO0P265MB6502:EE_
x-ms-office365-filtering-correlation-id: 4d94646b-713c-4b13-2140-08de6d4a353c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|6049299003|38070700021|4053099003;
x-microsoft-antispam-message-info: =?utf-8?B?anh5eHkvQ2JXelJZWWZCWG9UQ0pCOEtVQUlsdi9LM1VHaE5DbG5mWjBBbzJO?=
 =?utf-8?B?M1NPNmhNNnBpdjhlK01DK2owNXRyQmZjMjNCcXZTaFE2RkwzWDNqTnJ4cWJz?=
 =?utf-8?B?c1BOWURVaXZEbnYycXFmSjZqeHZLY0NBaUQxZVJNOUJ0d1kvU0ZicUZTMnps?=
 =?utf-8?B?ZWp4SzVreU84b1I0cVprUW9vSTN2MmpqZnhoYkU4N2JTcDFldCt5eGVtdjFT?=
 =?utf-8?B?SlUyNFFpYXlrOStnSDNkWGQrbFhLSWxsMlB0UE1FMWpYbCtBU09NMVl0blp1?=
 =?utf-8?B?c3Z3c21keDJwU0pnYWxzS0JQYmowODAxZlhRRmxRRTNrRkF2QVpGSDJyNTl5?=
 =?utf-8?B?VWRwVEt6U1NsVk9nZkxaYkcxWDEyd29PZWViazJ5SGY1TjZGSkVXYndDMm1X?=
 =?utf-8?B?TG5maFlLeGowcCtWNW1Tc2RiVGZ0bzdsRHJWQkNsVyszRTFwamc3K2RlTXhP?=
 =?utf-8?B?Q214OUQ1M01aWk1GUGE4b0RLcVorSHUwNmNYUGszSDJzWFY5QVNUcHV3ZThY?=
 =?utf-8?B?OUNYZXZTOHRzMzl4QVRXSXpML1pEa3ZwNnNJNlRBT2NKenJ4V0ZkYXZqTFV4?=
 =?utf-8?B?L3BjTzd3T3EyZzhtaURzOWNVSWRRYUc5SzhOQi9EOWQwNjJTS3huSUhDUzNq?=
 =?utf-8?B?d1hIU0E3MC9GaStRRDNrUmJJR1ZKUGQzZ2U1WHFOK1ZwODBlR2x6TDNiS2RM?=
 =?utf-8?B?MU15Nk4rNGx1Y01nZmV2UHpIQzZlWDdFZTJ0cjBKNmVZTld6MjZIR0hWSlNz?=
 =?utf-8?B?WUZxVUhPUUUyZmdra2FhZ1g1V2VSYndQTFU2SG1tY1h1aDl2anFDaC9PM2tX?=
 =?utf-8?B?MlV1bGt2ZDFvT21BNVFMVGh5V3pWdnMzNC9STlpjcVNNYTEzcHlaUUhETHZj?=
 =?utf-8?B?cWc0bFFZMkh1WkUzUGhaaU5MTVErQm9ZQ0pndGVpakdwK2xLMGZOMjBhOXJ5?=
 =?utf-8?B?Q243aHVSeTYweWNoUndQcWxXemV0cnVuaFBjRTF1ZEhDdEhnZEZsRDZCMnl4?=
 =?utf-8?B?NGFDOG0rV2FUTU9WYSs3Z2hSZGhFWDVkM3V2L2tqSndOUkZUNkRGczdjSjh3?=
 =?utf-8?B?TWxKMGJOMk5CN1BTUVBEY0wyL1FBZllwdXgxaGdIVHArbVdHMnlmcHIxOHNo?=
 =?utf-8?B?eXhqQ3NZSThVQkJKR3hSNGx0Nk9ERVdGa090d0F2aC9PNVQ1ekcyQUtsb2Jt?=
 =?utf-8?B?NkFLNzM2Y0s5ZG5tUXFzWFpvd1VUVkE1cUttQkVsNC9yejN1TTdsL0lGVWhP?=
 =?utf-8?B?cnFFMm9CRyszcXdUeGxjalVLdnNrVFJ1MHZPckdrTFpta3V4WWEvN2J3WHRQ?=
 =?utf-8?B?WkxvUjU4WWhzWUkrazNxRitta1N6Z3BTNW9oVnNJQXR3ZHRDYjZIQ3p4Ky8v?=
 =?utf-8?B?bWsra1l2cmhVdlR2UVpNUk16bzdLRXNna1drTjJZMVhrblVJOE4wUVgrRmVL?=
 =?utf-8?B?aXVsWWhQVVZKL0VqbTFJRmhYWlBKMjVVTGM4RmNmSFBpTlZ2UzY3SGRuUzhq?=
 =?utf-8?B?R0FPcjRhRHRMd3ptZFFtTk14b01KY3ZIZ0F0TTJyNUpsNTNmQndGME9JMVBZ?=
 =?utf-8?B?K0luY3VSTTMzY0ZjMzlLYzAxM3h1YmZQL251WVF6aTdsVXR1dVR2TStpa1h6?=
 =?utf-8?B?MncveWo3ajlELzl2bmFwTnVYNzcycCt3TWs1VlVmS0NYWm01L0tCOG5DUmRl?=
 =?utf-8?B?clJaV0xvSlFCU0JiOXNhck9hdHNQajdUZHUwK2VFeXZJVm92M29OY2pqbHdq?=
 =?utf-8?B?M3V5NzhnOEk3dHM2OTVzSXNTSTl2UUZWV21pQUNyUHhwZThmNnNqNElmWm5r?=
 =?utf-8?B?d25zQmhIa210dmNFZzl6U3V5SUFvV3JvbGlwZHA4VUlmbm81Vk0zZ2s5TSti?=
 =?utf-8?B?amF6V3h1Y2lFZWpJTUZMUEZyVGRMQ3VmN2VuS01nZ1g4ODNCbjgzQllDclJX?=
 =?utf-8?B?ek4rOHhQVDFVL2JZbTRRWDd4RTdKQkpKTVhTMERvQkxFYytudmlYeGZPQ3F1?=
 =?utf-8?B?NFYyZGJVL1ZCM2FRTmNUNHd2M1BOK3lac0Rwc3Q0ME9JcWxqSE9UV0IyRGYy?=
 =?utf-8?B?dmkycW0rY2VQaERZYXlrQ2VuSlVHZWdRbjlFRHlGOUFFTlB1SmUrcHFtT2lU?=
 =?utf-8?B?M2NvQ1VOTGR3aWhsTkJacmp2ZGk5d1UrOC80VnAvRlI4TkpIdUxUenV6b0JW?=
 =?utf-8?Q?FsdPOIH+S9vFT4t0Iah17MWV0JMIFYacaWQYr0bZ+yuQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(6049299003)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlViYmR3SExjQWl4ci8xaUd5VVdtalBWd2RiazJkdmdYeW9wVm5VU0FnYmJs?=
 =?utf-8?B?bEUzejNmQjUrMDRrQUpqcXhJQzM2K3RjaWdhOEl5MFBUM1h6eGwzMzAvd1dv?=
 =?utf-8?B?eWZvdzFiak0wNWt3U3JNUzg0N1IrNmhFbXFybC9IY0t4T2pWRzk5WGF1eE8x?=
 =?utf-8?B?bDNwejl4VzM3TXV1UDdTL2xzZ1cxMENMUzNxZXVJU2lEVzhHa054RmNNYWls?=
 =?utf-8?B?NjdzVi8rTnZ4OVRLa1NTZXlTREx0eTVQS0x0WFNmQlVEd3NMZHB0ekRxWEZw?=
 =?utf-8?B?OHlxa0pPQTFyZzdEUTlHMXlsNzRrK3FKK3JwSXdpR2pwMlZEUjBuY2QwNjdD?=
 =?utf-8?B?M3FEVDkrNXFVQ2VVY1ozZ0ZNWk1ZR3pzTkN2SzFtZWU1UEVCQjZMT1dLbnhz?=
 =?utf-8?B?WHB6dXZzOGlqSTRuRXljT1BVVWp0d3dYT3pNR2RtNWRvMFBYME8wdlpyd3dq?=
 =?utf-8?B?L1Nnd1V5UFBZS3dOYTFST2RwQTQxNWtDR1M0QTFGN1FISW43a0NsV2xlaFNW?=
 =?utf-8?B?NWxCZXBQemRlQm5zNkE0MWN6YUI1b2dBNGtIS2xkbHY0RisyLzFOUzhKUEVD?=
 =?utf-8?B?ekt4cG9IMnBGUWRkZnlKZExMWStFTGEyUExMNCtIYmFaQmVybFgwa0o1YTYw?=
 =?utf-8?B?WFN4UkEzWWZhdFVVd1NRM0doYVkzOXVaeGVkRnpFbTJyU0IweFhLU3dRanY4?=
 =?utf-8?B?VkltV0c4eDBUeXEvbnBRYXlXVFhLZDBRMGRiSGdlRzdONk5ONkJ0Z25uVEtO?=
 =?utf-8?B?d3FMdk15MU5ObDZtU0Rrd2xQWVQ0SHpDWGlmTkZ1WnlJb1N0V2d1c0tSUDZy?=
 =?utf-8?B?UXZ0d3lleUhDT2FlMTFTSjI4NzlzWWpURTlrRGtDWSt2Y3g4L3EzMW1VRUxE?=
 =?utf-8?B?aFdPY2JzRmFZSXZFbDZScEtIcW5yVVNDK0ZUUzVKcm1Tb2ZkSzJ4d2tHeVhj?=
 =?utf-8?B?ak1NdFV5R0VDNCt0a2VqaWdvTXdxSDdWbEFZU1NteXd2bWZ4ZDlSRmZGRGR3?=
 =?utf-8?B?cnUzbFg3RSswL0JBMFBuVjR5bC9RcWhOY0R3K0M1U3V3Q1ZpYUlCYmQwQjAv?=
 =?utf-8?B?cU9xUGh2U3pNVHM0UEdYR0lpK212eUF0eThmSWV0NVk4bDkxaWVyZlh0VERK?=
 =?utf-8?B?eHFCSTBYZWVkZE5sSnJhVGt1bHkyVW5RUDYwc083VlBCdEdESkJPSUphU0oz?=
 =?utf-8?B?bTlkM3hGRmxHUTU5TG5HeGFIbXI2Rlh3WE5VclhUaWhtUnd6VmVnS3JBaC90?=
 =?utf-8?B?cks3eFJuYlJEdzlGSWdBbWVNb0dPeWw4RmRoK0NrWVRlcjBFSk56Ry9LaTlr?=
 =?utf-8?B?ZEpsQVVLTk5iZmVpT0pVVk5ETUppcHptU0c5ZHdDRjg2UldwYitWV3ZHamlL?=
 =?utf-8?B?OFJFSGtYWE85QjZxaHVyOVlRZU03MS9JbTNHZWRacnZBakVsTUYxL1hVdWhz?=
 =?utf-8?B?TExuL3cwemhFTEJNazFxWXlrTElJTHdNV1RDOVBwN2pzYkw1dCtnbmlFazBu?=
 =?utf-8?B?NGlyVTV2RU5iRXJvK29KYU1zSHRvQVJCMEhicUQ1aDBjTEFyTDlySzRvci8w?=
 =?utf-8?B?Q3VDUTVHYzY4QTc3TWkzQ2pGdFRHNEpGN0hiZ3ZYeU15VVlhazZTVllPblU4?=
 =?utf-8?B?OUNvejdSTTFHbXBxVlk3MXFRcGN5aTVFWk95MUJlQmRNSW9JT0xUUmN6RFJP?=
 =?utf-8?B?Rm9rYkVMdGFQalR3bWZpTHprSUNoQVVFTElJcWFtSzBtbjlLdExUY3k0M3ZK?=
 =?utf-8?B?QmtxSlN3NFE2eW1qTkI5NkwzaWliSzVvanoyT0MwYjFJWmVOOU9sQU1ZbjJL?=
 =?utf-8?B?eWtQV0xnVENBcWFaQlFkSEF5UFRObVBvR0xYdWI5L3ZLTGk4UnpqbE9oZk5j?=
 =?utf-8?B?dVJIUms5L3lSNmh5cVJBYUk3aFFTNEMrT1MwTEZoVTVFQ1VrRTRraHhTU2x5?=
 =?utf-8?B?UzM5Mm9GZ25XWVVVV3N2NlV2Tzh2cFlQTmQ1V0drTXoyQm9DTGpud0s5NURo?=
 =?utf-8?B?clNKTUtDRHRVaVZ1U0p6Nk9oUnF6L2pjKzQ3eGhUWmZoUzY3c3gwVmpadysv?=
 =?utf-8?B?M3Q1L3c3cEpOYy9HaUxoU3E1Z01JbnhTT09DUW5aYVlrNkZKTlU2WWtoTGhl?=
 =?utf-8?B?UUVpMDdFVXVhMUd4aWZHSm12NkNkZHAvTDIzVlMyemx3WGJnQTJmN1ZKRGVx?=
 =?utf-8?B?UGIzSVhFWWl3dzlWemVJNU1OVjRFUEdVVTgxMm9EVmZzYXpNQ0JuTm1obENM?=
 =?utf-8?B?QW5Iam1iRjhHMXdIYUlXWEpMTkpWL3VHU1NvMzcxeTM4N005YnJOSkVBNVhq?=
 =?utf-8?B?TjNSdlhDM3o1NGx5Rm1JSER5NEdrTWxPV29lcXZiUzZUVSswMmxyUnNUNTRP?=
 =?utf-8?Q?Pd1C7/IGJQkUIDVo=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DTBxm2THU06aUIZwd48uPju0"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d94646b-713c-4b13-2140-08de6d4a353c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 10:57:42.1182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jkXLqzkjYF/p4ukmboK5Pe2h5/rLZJ/DmC5uXnwQ8cA+BakBXVSm5KCG+fTB4MvbKWZ3PuNauJ2klNSroHtJnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6502
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MiBTYWx0ZWRfX4mBgAK9zF4iH
 lJZmaoMfeE/kIhpg3dWq6mtMfv1WZccfn+g1LQd/KhJMtT3NKcsOmh9eKXet6ZRMgaUcXZAVwoZ
 M7gnQFdh+Am9WHkk/1Q+u7Rp00/6Icla74/+YwATCjxZmRyX5WmeZI4svxMxJA+jXOgKeUQcGui
 vBQUp54aJBbo4hoFKpyJIRF1PhWNZQbXYzJE4uZn3ncIv/zXQQQ53wTmfXtvQFKPTkGnY0tAlzU
 2gJnT5CARC8ZOSbsJM5WFoBz8h1yD6SzZXQa+Ary4M2g2EEs+2bLbmx5Qy30Xw1N6aBk4UxAOOL
 R8BcM8+YKvCa6O6BMWUHl9lUAQIqUJaGnNLSR26jaqV1Lb5CXIdVaai4QuQjDUCGlZtJcBCdRlR
 q8dfodvIiNxOYmK8GkbmberGYM2GCP+4X8vwHRi9gsqeVmHnEeRvWJXb7BX8xTc9B6tYqQzfMAP
 E+ZcOp1HBtZt0pjhyUw==
X-Authority-Analysis: v=2.4 cv=aepsXBot c=1 sm=1 tr=0 ts=6992f829 cx=c_pps
 a=7sQBZTvaMYqUtfyruXUKoA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8
 a=r_1tXGB3AAAA:8 a=e0gCvidVZrJ8NEA4EToA:9 a=QEXdDO2ut3YA:10
 a=4pCVkR8LWyhJIqw1j2AA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: tkQoDZqLAb_ULrujxr2SMrFxpcUcqr3N
X-Proofpoint-ORIG-GUID: tkQoDZqLAb_ULrujxr2SMrFxpcUcqr3N
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
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[linux-m68k.org,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ATTACHMENT(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[IMGTecCRM.onmicrosoft.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1443114293E
X-Rspamd-Action: no action

--------------DTBxm2THU06aUIZwd48uPju0
Content-Type: multipart/mixed; boundary="------------vHdFuJhlEIet0iLXESt2cX0p";
 protected-headers="v1"
Message-ID: <47f95b5b-c240-48b1-a904-2285700a9d3f@imgtec.com>
Date: Mon, 16 Feb 2026 10:57:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matt Coster <matt.coster@imgtec.com>
Subject: Re: [EXTERNAL] Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
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
Content-Language: en-GB
In-Reply-To: <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI

--------------vHdFuJhlEIet0iLXESt2cX0p
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/02/2026 15:56, Thorsten Leemhuis wrote:
> On 2/12/26 15:38, Marek Vasut wrote:
>> On 2/12/26 10:00 AM, Matt Coster wrote:
>>> On 11/02/2026 19:17, Marek Vasut wrote:
>>>> On 1/23/26 2:50 PM, Geert Uytterhoeven wrote:
>>>>> On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com>
>>>>> wrote:
>>>>>> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
>>>>>>> Call the dev_pm_domain_attach_list() and dev_pm_domain_detach_lis=
t()
>>>>>>> helpers instead of open-coding multi PM Domain handling.
>>>>>>>
>>>>>>> This changes behavior slightly:
>>>>>>>     - The new handling is also applied in case of a single PM Dom=
ain,
>>>>>>>     - PM Domains are now referred to by index instead of by name,=
 but
>>>>>>>       "make dtbs_check" enforces the actual naming and ordering
>>>>>>> anyway,
>>>>>>>     - There are no longer device links created between virtual do=
main
>>>>>>>       devices, only between virtual devices and the parent device=
=2E
>>>>>>
>>>>>> We still need this guarantee, both at start and end of day. In the=

>>>>>> current implementation dev_pm_domain_attach_list() iterates forwar=
ds,
>>>>>> but so does dev_pm_domain_detach_list(). Even if we changed that, =
I'd
>>>>>> prefer not to rely on the implementation details when we can
>>>>>> declare the
>>>>>> dependencies explicitly.
>>>>>
>>>>> Note that on R-Car, the PM Domains are nested (see e.g.
>>>>> r8a7795_areas[]),
>>>>> so they are always (un)powered in the correct order.  But that may =
not
>>>>> be the case in the integration on other SoCs.
>>>>>
>>>>>> We had/have a patch (attached) kicking around internally to use th=
e
>>>>>> *_list() functions but keep the inter-domain links in place; it go=
t
>>>>>> held
>>>>>> up by discussions as to whether we actually need those dependencie=
s
>>>>>> for
>>>>>> the hardware to behave correctly. Your patch spurred me to run aro=
und
>>>>>> the office and nag people a bit, and it seems we really do need to=

>>>>>> care
>>>>>> about the ordering.
>>>>>
>>>>> OK.
>>>>>
>>>>>> Can you add the links back in for a V2 or I can properly send the
>>>>>> attached patch instead, I don't mind either way.
>>>>>
>>>>> Please move forward with your patch, you are the expert.
>>>>> I prefer not to be blamed for any breakage ;-)
>>>>
>>>> Has there been any progress on fixing this kernel crash ?
>>>>
>>>> There are already two proposed solutions, but no fix is upstream.
>>>
>>> Yes and no. Our patch to use dev_pm_domain_attach_list() has landed i=
n
>>> drm-misc-next as commit e19cc5ab347e3 ("drm/imagination: Use
>>> dev_pm_domain_attach_list()"), but this does not fix the underlying
>>> issue of missing synchronization in the PM core[1] is still unresolve=
d
>>> as far as I'm aware.
>>
>> OK, but the pvr driver can currently easily crash the kernel on boot i=
f
>> firmware is missing, so that should be fixed soon, right ?
>=20
> Well, drm-misc-next afaik means that the above mentioned fix would only=

> be merged in 7.1, which is ~4 months away, which is not really "soon"
> I'd say. Or did I misjudge this?

The above isn't really a "fix" per se, it's just an enhancement. The
underlying crash can still happen. We could still pick it into
drm-misc-fixes and have it in the next -rc plus backported to stable,
but I'm not sure I see the value.

>=20
>> I added the regressions list onto CC, because this seems like a proble=
m
>> worth tracking.
>=20
> Noticed that and wondered what change caused the regression. Did not
> find a answer in a quick search on lore[1]. Because if it's a
> regression, we maybe should just revert the culprit for now according t=
o
> Linus:
> https://lore.kernel.org/lkml/CAHk-=3Dwi86AosXs66-yi54+mpQjPu0upxB8ZAfG+=
LsMyJmcuMSA@mail.gmail.com/=20

=46rom our side at least, I don't believe this is a regression at all. We=

haven't been able to reproduce this issue on any of the platforms we
have available (although we did stumble on a related bugfix[2] while
trying).

My current understanding of the situation is that the fix proposed by
Marek in the Reneasas driver[3] works, but is not suitable since
pm_runtime_barrier() should be inserted by the caller, not the power
driver. But it seems that's not always possible (particularly when using
devm), so I don't really understand where we go from here. I don't see
anything we're doing substantially differently (before or after the
commit I mentioned above) from anybody else.

Cheers,
Matt

[2]: TBC
[3]: https://lore.kernel.org/r/0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailb=
ox.org/

>=20
> Ciao, Thorsten
>=20
> [1] I guess this was the initial report from Geert?
> https://lore.kernel.org/all/CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoY=
i0i9_PDQ@mail.gmail.com/=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------vHdFuJhlEIet0iLXESt2cX0p--

--------------DTBxm2THU06aUIZwd48uPju0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaZL4JQUDAAAAAAAKCRB5vBnz2d5qsNlf
AQC4rDTEzo8L5YtZYxEjuenUe0YhBXTbgNfmUqxNPFwrWwEAqCME8O56lDk3do3d/yk0I+FmVzmt
/plezgJBwqxAEwg=
=gYSk
-----END PGP SIGNATURE-----

--------------DTBxm2THU06aUIZwd48uPju0--
