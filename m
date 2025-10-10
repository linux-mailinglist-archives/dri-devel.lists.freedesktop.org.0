Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D0BCD8B6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FAF10EC29;
	Fri, 10 Oct 2025 14:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="e+5pTCqJ";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="efyHRD4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Fri, 10 Oct 2025 14:34:50 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E37010EC21;
 Fri, 10 Oct 2025 14:34:50 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59ABrcoW2848614; Fri, 10 Oct 2025 15:29:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Co1s1veFW2QPx5gFWTiJbOa1H
 7UXAt0P7YOKTXdTiyc=; b=e+5pTCqJ772ONFnYJ3m66NkyQB2zCZsa30uDTc6B3
 8O9kn7ZES5p0C91+hJrhMpiqomOj18jWrpb322/ulFAGNMi0qROt5yBspZxb8SVE
 eXC1DFg+EC5RXWFZUV+L58XMM7nGgsg09Xn2/vnMWcuJlBr/qDfVfpKAMpnkYrgu
 5Z+yMSJTPwsFvxzLmCdwCq+/Zc4EQcCbAgq3oXAgrIezBmDqeJuDt+HdPU1Lv1SC
 dIyzK4uKD97jmFfg+gSAWXE32vH92fYngV84A5BMzLzZOZ2V2mWSS3jlsEpHLCXL
 pJWI73WJBxnP2CaRDhkEG6VGIyCPCYioyi7EsY8U5cABQ==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020139.outbound.protection.outlook.com [52.101.196.139])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 49prgxrmgd-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 10 Oct 2025 15:29:23 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Caq91SznhezgawpkiPTg0M3B0sAI0SvQewjsPJZr5ChzR/3IBatjBbLMS7t0bJg22kD7H3FRDLU2b/W0+ybDt/i+MUXZwGczxUPYzE1/sfgKN2YJ2CsQyHTXsnxiRHms/AFCbRX9U21PPQC78K0UXfSCXNQN/Kqzlx/BQQx56wzl3tvpo3h2dGyJRLclfFn+dKCr1HHExxzuvblyH9rSVCSw26MYKrR23J8re4n/tX9HFke/IfAVFDoasLYo1ubDFkhTX/C5Z0KkgpsNMIP8bVksdzKftB3OKVUsyAL6cTqdUNIC319Aqdvx2SwTA3FWWLf34eOKffRVutKv4wQevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Co1s1veFW2QPx5gFWTiJbOa1H7UXAt0P7YOKTXdTiyc=;
 b=LI/GCr1TZyniCdkCcf/y6l8q8wlAlxzZVpqRSIDfiI7UKKR314Wm61uI7W0NftWOd8yd84wIcbYkllaXtwTE/DADl/HIwI3qoWdU71EmJsBefYURK7YL0r3BDVZh6LdMcYRdMJxGaA7U0JpeNfX6Blt/UOiQaeNsjFFSouDx3dsvU31qRbI9+S2nZ6P53DGnErUXQMoDDckrMsL/FOe6G+W0E9HfgOaRI0pm0cys5lOXPeoWnd6MqDNt2tEpHIW+hLEuWqfsL70pa64DH+K0IqlDtTNOapoTdFgu9gP918OvJuwr/fA3HYCfpYYdz5KvmhO6OmaMDibddoaNGsOurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co1s1veFW2QPx5gFWTiJbOa1H7UXAt0P7YOKTXdTiyc=;
 b=efyHRD4n0Iolv8eVyGaYtvmoz70ih4G3dLAd3jSErXFFN6Gaw6l592ko/yloJ3eccnSa4r9xNVucQdxfeWcvD9AuUCRshZuveweMQjqOoaZUE6DzdarMdWCQwF0zFBBhUNBBG6KcPkMaf5EsYwO5ET8EsdN494sIf/cja7iM6s8=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB6975.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fe::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.10; Fri, 10 Oct 2025 14:29:21 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 14:29:20 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Subject: Re: [PATCH 19/28] drm/imagination: Remove
 drm_sched_init_args->num_rqs usage
Thread-Topic: [PATCH 19/28] drm/imagination: Remove
 drm_sched_init_args->num_rqs usage
Thread-Index: AQHcOfJDmYMBIL4zyEugYwANQRdqTw==
Date: Fri, 10 Oct 2025 14:29:19 +0000
Message-ID: <f2ad6d80-d354-4fcc-9303-2b6c1c2588dc@imgtec.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-20-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251008085359.52404-20-tvrtko.ursulin@igalia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB6975:EE_
x-ms-office365-filtering-correlation-id: a5c651dc-9e5d-42c4-9d40-08de08096678
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?N2NJM2l6VU9CMHNkN1NXdmtWN1BsTmVFY2MybWpzaVdERVlBd0dobHluMFBq?=
 =?utf-8?B?ZTFIdkk3b1lwSm9wTm85NEpmZTJoeUc1ZC9JS3d1Rk9FMlg0QkI5cjI1eWRG?=
 =?utf-8?B?Y3BobmRnTGpBMzd6WmFYd3pueWFMdzYyYVNadHo1MkJyelQxMkhRM0ZRd2Yw?=
 =?utf-8?B?VEU3U0wvSE9JK0FCMDY4WWFWSXMvdEVXQWI4REV2eTRWVEdtSkluVDAvU1I2?=
 =?utf-8?B?WlQrTTlmWnlRYzBHMFBmeDViVUpGMmNzdUcrcnUrTktlek5sMloxcXBISjVY?=
 =?utf-8?B?anJhVGdJRXVMSExUUUZQeUdFeXl6cEVFVWxTVk8vZnlQcStMNEptaFU3WCtz?=
 =?utf-8?B?VUo5TjFBWDYwT25icVg2NnJtbjU5UUJ0ak1EMjdjTTl4ZGt4YXU1NDVRY1pm?=
 =?utf-8?B?a0JlWFI3K3NPUzloTnVlVkhKTVNVczNyRDVReGNEbEptRmQ0QkpxWFd5RGE2?=
 =?utf-8?B?aDBIZ3pLVVlNc0ozQkF0ZlpqUEphdmlWTmlVME11Wi9BUVZtVDdObWU1RTg1?=
 =?utf-8?B?T0VPZm9NQ0tJMVhGUUdKQUFyY00zdVpIL1p4Q2I0NzcxODFQVjVjYVp5bk1w?=
 =?utf-8?B?ODBuTlYwSGtsZ21GTUwxL2tWeHNvU24yNDBtZmlJZlBadjZMRUVBWnlrZmN1?=
 =?utf-8?B?aEZIdTNZQ05UaTdRaERxcnJCWEtJdTNXdEpMNlpGRTQzSGdwd1I3WXBQcEhG?=
 =?utf-8?B?R1FUQ21aSk5MbWdQTHNsNlBHOHZBdXk3N0VxUG12b1UvWU4rNjN1WE15Qmxn?=
 =?utf-8?B?STlZVHZ4Sm4xQk1BSGhvd2hweWZHdVBzU0tWYzlRQzBncWtzdVdsSmR2R2tR?=
 =?utf-8?B?dmhwbVZwYlkzRzJ0MUo4WmRBM3hmcS9pUGNaNDNZa3VLK2k5Q3BzODNmRDNl?=
 =?utf-8?B?WDBEUlNMUktUa3ZjcVhrdE5mWXFoVDlLaFBJdkVuY2FuYWZGMEcvRGhCRE1N?=
 =?utf-8?B?azhIeENHRm9PYzBTbDFzWExXL0hoUEFPQ0dLWjNPMEJ3UVpCaUVyOFloUGxI?=
 =?utf-8?B?TlU5YjFnQVNSNGxmU054M0NiNjY3dUhZSU5RZW5LWjJTUFBEUFI5dUJDRk4v?=
 =?utf-8?B?elJxUzBxNUFpSEZTOURoUm1OMlVWck5qQTJ2NVd3V2xXa09VWW0zNGVIZzNx?=
 =?utf-8?B?M2QzeW82RkVDaVNMcjFrVHhoV2s2UmR3UFNydzRxY1Yrd2dkYVdhRHZCbzht?=
 =?utf-8?B?bkduNjRHODZySnhqSk96R2xCZUY4UDVpREZDQTNMOGpGTnA1U2ZmOEF5cEIz?=
 =?utf-8?B?Tm91M1FqL3hjUjRvVXRFWFdPcnJJS1U3YUZwSjJVSFEwYWlRU3JoUWsyUTBK?=
 =?utf-8?B?cXIyd1N2SXpYcjZLeE5pdERVc3R4Rmo0bzdQRjY0S0YwZ09KYk9TQ1Mvd1FF?=
 =?utf-8?B?SU5ua1l4SDM0cVB4NFI4R2IrTjRkeW0yN1pKYnZrTWxXY2kzVkhDVDNYWVhC?=
 =?utf-8?B?bm5FaXNSSVpqWFVKQzlSTVVwYjBOSTJMQzZQV1hsejJLLzBqQTFpT0QzN09C?=
 =?utf-8?B?K21uOS9lRUJtNGhWSEpkU1RPTzFiaTZXc2paUG8xVHlaNVhGRUtXMFdad24v?=
 =?utf-8?B?ekcwdExsSTNhdmdGM3ByR0ZDbi84WVdlVVZPQTFVYURacXAzc2doNzZPMm11?=
 =?utf-8?B?STdQK0h3Q1JPRDZtUHNycHJtK3E2MVBPMHQxclhOdzdVTGVhRWpicHRBUk1w?=
 =?utf-8?B?RmRpZjZVYXpURFBGY1BKeGtCQU9mcEFxTnRJMDhVVTZuTks2OHpZS0NDcWtZ?=
 =?utf-8?B?Z0lDRFlhUHpkd3FqU0FDcGFZd2tiSXJ5MzFjdTNrVkdqSTdqVzIxNStYNG92?=
 =?utf-8?B?c0pDKzRqVmRsVXpubXhGUWs1aTZYZTFkei9rbUp0NkZ6MHFhR1ZkbE94eVNm?=
 =?utf-8?B?b1BmUzNudzFIcGh0dDcxa2VFSlJZcDNmS0tlTDNjUnVFOHFIVjlYRldqZkNO?=
 =?utf-8?B?OWg3aVhMSjRtUVBOSVhmYjhGTmZBRWoyUGx1NmxaeUJzQXJVOTdiNEliVTVY?=
 =?utf-8?B?bmRSNEdtcHdSSG9xN1YwTmJqNmFPUEtzOHZycDg0bzExOW9FemlSMkVkTk1I?=
 =?utf-8?Q?6OCnqJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4053099003)(38070700021); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTJaZmtUK3pzcUJsZnZEOTVYSGVoWWRUOGFyRkZQbXRSMjFYSzBzZFNSZ2ZF?=
 =?utf-8?B?VStSV2dqS0NMSzZ3aEROT1FmUmdzenMrTXJZSjFQai9xOU82SkdlUG9xS3Jy?=
 =?utf-8?B?eDhKOE5HdGNtWk5lY2xTWGloeitDR0dxdlVxMVhicTE4UEh6d00yc3BBbk84?=
 =?utf-8?B?VlBQZjlYRE40MHNBNEowdlBkV0VEQi9qL1Z0QWNMKzc4bFRkSUtYeGdGMkZu?=
 =?utf-8?B?emhGRHBybHhDUDk4dS9wVFlvbDR4QzJpQU01VGF3anY4Vk5aQmZmSEdHYWM4?=
 =?utf-8?B?S1lEaUEyY3hZWTdnU2F6MGZWdFBOK2xBcVByZmVnbnFMZExZM3M1ZDEwdnN4?=
 =?utf-8?B?dEhUckpscUhZRzBXajhTc05ZejRVNU9aaE43Vm1wNDYrUUI3WjdqbnhRVnJK?=
 =?utf-8?B?L2tjbU9zUUpVeGJBTXNmeXpON3NuYXBKZFJ2VXRDdWRnVjVHanAyYTZ2M3Z2?=
 =?utf-8?B?OFIrQnZmZUtDRFE3a0w5d0J6MitUVklNdHlDRWhWUjdUZXU1MUVjbmpub0ZE?=
 =?utf-8?B?MEJKZ1FFWThEK3VwOHl6WERiamcwbVlSZXEzbFlzYjlncVMweUxwRGRCWERi?=
 =?utf-8?B?VzRMZ1gwb3RZUFRnWkxubTlXQUF3RTQ2Um1SMTh0SnY3SEtIN3loK2hhSEdE?=
 =?utf-8?B?QXVxN2Q1K3F4d0lCR0dNVUpPaTFKTDMzMmplUFR1VjNEcldGMmpQT1dtTlRX?=
 =?utf-8?B?REU0a0ZDMzM4U3dDVjM3M2crUlkxYnlDeFB3SzFuYk5MeGFKU1Mxd0xwaVZi?=
 =?utf-8?B?Um9ZQXlJcCtsZ1puNFc3MnNMMkV1S3A0VkJXM2l2NDZ6eXBEQ1lWbUt4L3VU?=
 =?utf-8?B?dm9JYWdTczJUbno3N3lqa052VUtDWkhCMmpwR01PQ3V6ZVJtYTgzSngyWTJK?=
 =?utf-8?B?N25OQTN6L3B4dHI5YjBMeFluN1dTNUI4S0ZPZkxzRVhpMkpxMDVjUWRvRnU4?=
 =?utf-8?B?RCtpSm95alZ5elRCSEhCQ1NERWQ3YzYwdFF1N2c5b0NTOFBQeS8wMmQ0Y0RQ?=
 =?utf-8?B?NFNUWFNEa0V3d3BqMmtpdWczM1lpT3cvWTllUWpBSWlvVytqbGN3VVBJQ2J2?=
 =?utf-8?B?RktCZVZ2WGVuZGlTajFnLzBMbnZYMksvQmIrVHhYUkYxS3NvK2hwQUxlTUdu?=
 =?utf-8?B?b3MyZ0cxSFloWXhGRUEvM2VtbzFhMnV1YVZ3dDdNOSttZjFxRkZoQUYzbWpi?=
 =?utf-8?B?d1NoZUlzcXNzVDhCdlVkSTRZblFGTzNXdzZ0clppY05qM3BnejZtbUNvZEZh?=
 =?utf-8?B?WmpsU1dwaXpwYUl6cDNEYVY4dGFiMnN5Vnp2UThIR2oralpZdGdBcjExNlIy?=
 =?utf-8?B?eDBBdDg2djh6dTB2NUYxMFFtTkxCUEpXUHJ3ZDBrOENSTUVVUXBBam15ODdU?=
 =?utf-8?B?V2xRYnF3a3lCYVo3ZzJ2N0d0cjFaVWxRV0x3TmpXVFg0OGtWSDRNS1J3WW8y?=
 =?utf-8?B?Q0ZxWmg5WkM3WWxEa09YQUZmSFR6K1h2cG1janArZ0x3NFM2OTVUSG81end0?=
 =?utf-8?B?Q2tMUUdHMVBsUFVkbFNBTVMzbGtLbVJRS0VDcHlhOU9yajNoYXJ3bTR6Yll2?=
 =?utf-8?B?dkdVSFBrVGswLzZaNGtpSEVEOXIzdlRFZ1dwTEVRVG1OV2I5ZGl2N2p0RzFW?=
 =?utf-8?B?Z2hEc3o3T283cnI3WHcyelNSY09qZy9idjBaMXBFTnFyMGdxVFVqSHV6R3M2?=
 =?utf-8?B?UTFtWTl2OXhTNE53K3VvUEZBVkpHaGY0UHNDcmh5ejRoV25RMzUwT0tnVVhw?=
 =?utf-8?B?Y1ZnNmVZdTVhZUZUbHhpbXRKUk43OFU0SEQwcXJaSzBxTDdqSDlENnhHeHl5?=
 =?utf-8?B?Yk1iam04eXV5NzRhZjNPTWZvdTJYSXJnWVhsZVJ2Tk5sTEYzL0NGTGw5QVh5?=
 =?utf-8?B?VDNvaFlRZ2VQc3UxZitRZ3V2K2d0bkxDOGF0K0hpV3Z6L1ZVMElDbnNkcHVZ?=
 =?utf-8?B?a0M4d21WL09KRG5Za3lIVTN3QTdFbDhsSndFZXFWT2N1ajZLRW9lRi83cVYz?=
 =?utf-8?B?ZzI4WndsWFRXMWt4V0lQMkZyYVBoZi8rNEZmblBjNW9ESEY4OUJPR1JJMU1o?=
 =?utf-8?B?a2s1Y3NSRVUxVWFNb0piQmw4NXI0OVJXTHFmbWNNZ0xUTVA0Yy8xVHRqdUt4?=
 =?utf-8?B?R0ZRVzFPVFluRDByQnhOODZmZkVqbmVVdFNPTEwxcXBiNTEyOXV3VkZWNWZv?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ns30MTnsjPDglLaQrtv0IRke"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c651dc-9e5d-42c4-9d40-08de08096678
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 14:29:19.9981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RSxmvSRgPf62R8x7EIiUGnsi4chhi0biZoUUlYXaGigo5f+lsfsct3CAWv/gBSpF2zJEXWQSRDoqwv2SuLDKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6975
X-Proofpoint-ORIG-GUID: 3J-560nH1bHBRqQGShlzB2zcry8zSdja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA4MyBTYWx0ZWRfX4kqeja8AWIZ4
 KEykzSCb7Uqam4onrmaXy+vPQe4Q1WCR2nEpvcQEiO0hzPncSTHidoKwZHv0YwRMeTRjbFjkPh+
 Uk+0NdIpbT0FbAVeeJ6EnTzSGqZUi1n1qcHyF/shNiQedZ8//qR87KNW4p7jfFoc2GigkXXwgqf
 9NHyFVOzhCNvJoBfCSbgUQ3VSrAZ8iOUtChZjE3pp1rISXu8ksbPYxEXWNykrxXaWIUy5z8XEe3
 gM2gvgLqBH0iRvHaRJwguzZKwafWWcRr8scZVBMRF29zQM2x+CcAlIQN6nMAOkMKkJrgqtZDdSz
 F/OaPlsqVB3OIRXS7dTHLUTZ/YGiJmbRMcUx01izwT/RqrGl6luaGRUQVzfJlYidZ6/xXAU0One
 G3BX2c1t40cLn0HtUNAxy1dVHlBoxg==
X-Authority-Analysis: v=2.4 cv=Mt9fKmae c=1 sm=1 tr=0 ts=68e91844 cx=c_pps
 a=pyCVbHd75AK2UhgfA40c1A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=V2sgnzSHAAAA:8 a=r_1tXGB3AAAA:8 a=e5mUnYsNAAAA:8
 a=GL5UkZCs1YrL8B0k9vcA:9 a=QEXdDO2ut3YA:10 a=rdXANcWrkKZMVCIDP7MA:9
 a=FfaGCDsud1wA:10 a=Z31ocT7rh6aUJxSkT1EX:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 3J-560nH1bHBRqQGShlzB2zcry8zSdja
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

--------------Ns30MTnsjPDglLaQrtv0IRke
Content-Type: multipart/mixed; boundary="------------hVhdn69pPnfostoviCKjI0jk";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Message-ID: <f2ad6d80-d354-4fcc-9303-2b6c1c2588dc@imgtec.com>
Subject: Re: [PATCH 19/28] drm/imagination: Remove
 drm_sched_init_args->num_rqs usage
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-20-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251008085359.52404-20-tvrtko.ursulin@igalia.com>

--------------hVhdn69pPnfostoviCKjI0jk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/10/2025 09:53, Tvrtko Ursulin wrote:
> Remove member no longer used by the scheduler core.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

> ---
>  drivers/gpu/drm/imagination/pvr_queue.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/=
imagination/pvr_queue.c
> index fc415dd0d7a7..3509bea293bd 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -1228,7 +1228,6 @@ struct pvr_queue *pvr_queue_create(struct pvr_con=
text *ctx,
>  	const struct drm_sched_init_args sched_args =3D {
>  		.ops =3D &pvr_queue_sched_ops,
>  		.submit_wq =3D pvr_dev->sched_wq,
> -		.num_rqs =3D 1,
>  		.credit_limit =3D 64 * 1024,
>  		.hang_limit =3D 1,
>  		.timeout =3D msecs_to_jiffies(500),

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------hVhdn69pPnfostoviCKjI0jk--

--------------Ns30MTnsjPDglLaQrtv0IRke
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaOkYPwUDAAAAAAAKCRB5vBnz2d5qsGo3
AP4r66Q77LIm1sGaF/WceUwBononjw/tWn6mOv0+ftbn6wD/alL0Os+XTj00oB/8vNFb/8l+tFp5
0b9roR4zTT/5xQA=
=3xx4
-----END PGP SIGNATURE-----

--------------Ns30MTnsjPDglLaQrtv0IRke--
