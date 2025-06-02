Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068A9ACB66D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 17:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BA310E54A;
	Mon,  2 Jun 2025 15:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R4L9Stnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3C610E54A;
 Mon,  2 Jun 2025 15:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZAoENySW451Eq6QJH1C9xjTeNEE72d5RtsyuVU1aBQ2XM2lAQGLbkgshy6wqpbjFQPvqsEPio/J22YCYJMF2h/mqEhl7e/bV3BUOvnfKO9h1+rgAJ9BFlFmfs4h6hsD0gJoBTjp/7WNwOGhlSIHj0T5i67RR/tyFNEz47Yz9DGZmHxBBZEP1TrDB4hFI4RXbZamlQSoxfxEl+bBA+BJokr6dLuJkJNrRnsSGxClvbCxVgPjsa3HYuxOSVNs4qbPH43Z9TdARle2gw7r8RqcyNQ3W0s0lAISBlt+t47lE6cf3xea9/8/nafqGPYy6P56ZNgKt+iYuo3r2lFO9DkKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLkrTnCSzD5XvWunlLmJT6i7VNKRMdnPexqx2IoJURY=;
 b=xbh7LtQ737J94UYnCk13JNwB8oZjsFdRy4LbJERwjtUmLmnXYQhPCRWOqjUP2iZKI777hwER6lmHG1aOTwjFr6oUDC+HZxwzOMnoqQZ/CPH8yxAVgOnIVDgTRBsOam6n1rhPFuVqyWSyAw2SrumFu6iGZBrwrvkNdA76w8NQv6ITOgXkIQY62HW+y3nFqKT8MxL+zoxbK7g2VhHfZYWJ10a6a3kqhpOsNYym0718r2X1poXYA+WjpCkca3e30EZrfUi237z+Yix3VTIaYD6NW8MJYRyIGpvspHwY2gFpo3N4XRyqS1XtixAxPBRRI00p5FCQ183DDBMoU3kRyEra5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLkrTnCSzD5XvWunlLmJT6i7VNKRMdnPexqx2IoJURY=;
 b=R4L9StnlESWrWv/QQHKLqNBBNMTg3y33eX9XwOr+D3s1kd+rWZy3ut7Prg+HYBDS3eEbpHuvERbr/1RZws4Y2zKyTFyoJJ8l13pQODM0C4msyhjMutgfqDbiWy+LHAvIMF9UrEUokFoC1fMp3vr5GTPrFCW6AXBGGD07dBCgoFQ=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 15:17:45 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%3]) with mapi id 15.20.8792.033; Mon, 2 Jun 2025
 15:17:44 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>, "Wu, Ray"
 <Ray.Wu@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Linux regressions
 mailing list <regressions@lists.linux.dev>
Subject: Re: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
Thread-Topic: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
Thread-Index: AQHbyWsAkgfutsQ0E0KUJ0vtS3bUP7PbnpGWgAAVZ4CAAZdLAIAACLstgANiR4CABILlUYAFjc0AgAB4Y8GAAGh9gIAAAuXlgAM9MwCAASdN2g==
Date: Mon, 2 Jun 2025 15:17:44 +0000
Message-ID: <CH0PR12MB5284056783850371B48BC9A88B62A@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <CABXGCsPLAs+rCktbM_ao3bP3VZuaLqXSMpXZt1m-B9nqf91EQw@mail.gmail.com>
 <CH0PR12MB52845B90BB3D7B94473B6FDA8B9FA@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsNmsQgvNZL0_pHxnHLKNZS=k_yzmMNoGgfGQqsimTWucQ@mail.gmail.com>
 <CABXGCsMgEnrtHjJvPPmrXDFkmMkU5TN57bU_396PuF_D02oQSQ@mail.gmail.com>
 <CH0PR12MB52841D545358B55A0546A06C8B9EA@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsNkBCjh_jSJ+tT=xPiSSby-XM6qsnGfCFq4pPPZ8jspGA@mail.gmail.com>
 <CH0PR12MB52846C4987E9D16B19ABEF138B65A@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsN5uR+t76b-fHkEw9+G-uHOkOunznZOHh5R-HFJP=9Zgw@mail.gmail.com>
 <CH0PR12MB5284E08D45715F67C6B5BBD78B61A@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsOWaLwyFL1FzRxzzCN7A1987MH-L_W0bs0=1-d=aPrmCw@mail.gmail.com>
 <CH0PR12MB5284F821A0CE773EB5A78A508B61A@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsMZfXb-U2sHtpEehpfFsAqm9xMajBSnQfRNidm-=Fx1Qw@mail.gmail.com>
In-Reply-To: <CABXGCsMZfXb-U2sHtpEehpfFsAqm9xMajBSnQfRNidm-=Fx1Qw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Alexander.Deucher@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-02T15:17:43.860Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|BL3PR12MB6547:EE_
x-ms-office365-filtering-correlation-id: 184ea41e-5ad7-468e-444c-08dda1e8a002
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NVZvYjFxVjdnci9YZU9YYnFRYkFLVjNCbkZYZFRvbWJldmNGZjEybzR5K0tZ?=
 =?utf-8?B?VHRsWmdLMkdjVnMwdXNwYitud1dMTEFZNVJZU1dlSk1ONmN0UlJ0ZVE0b0dG?=
 =?utf-8?B?LzN0bVJiUW1lano4ZEVLRXZaNkliUGNaRURnSFpwVDAxZWwwd3lHcSt2dVNl?=
 =?utf-8?B?VW5sSlhaY0RDbE9oWVBoelBFUzY3akR1Mk9nNEx2TDlkNkw1NkxDVmxZQlly?=
 =?utf-8?B?TW1BRDdxWlZEWVNiblRDREdGSEdIOGl6MmkxZGpLNSs3SUx2WkRPd0t6QW9V?=
 =?utf-8?B?Tkx5UVp3eFJvRWM1R1JndjZuR1kySjl5S3RycTkwcHZ0cTVIakx2cURJeXc1?=
 =?utf-8?B?NUpEUDlnWkd4dThlTnFaRm92WWtHQ3lPbUFhRDVwSWp6cUNvRXhhMXRWdmw1?=
 =?utf-8?B?Z1EvS1JaZVFmR2k1UTJjdkhMbjBhVVZlNDdyQWlwNWI5MENmcVhWMjdIcHAw?=
 =?utf-8?B?RzRyemlBUzdOaTJFQ3d4NXphU09vbWQxZ2FjV3BWWG5ncGg3SU16amZmRUVP?=
 =?utf-8?B?QUFSRG5ZVCtOa3JzRkYxd3dqTjM0ejVicmtUdXNuSEkwUXVJYk13eFh3Z01r?=
 =?utf-8?B?eHZkalFNYjdVRUh6WFdnSVhYT21wWEFlUTU1eEp6enE1WGliUUtLNStaWVhD?=
 =?utf-8?B?Mlh3ajZ5aGlObmovdW9JVlI5Y1BKSEozOE9uL3J5dGtuWXRtOHRnUkJPcFJu?=
 =?utf-8?B?a2lWU0dBSDdCR29qdnF4dDVER1FnbUN6WWk1ZHJjYW9QZjcvajFJbXhRNHZG?=
 =?utf-8?B?SDVkWUJ5bVFheWtBT0R3V1F1SDYrZ1VkS01nNjRKYXFrOW9BYjRZYXg0bXQ3?=
 =?utf-8?B?OE55TWd4b1FMbERyait1b3UyTC96Z2pYN0Y0Y2JwYlhwVmJ4SWNyeWdaN1BF?=
 =?utf-8?B?ejVmT1hDMTdGRU9TRDNFcDlZNzFuNXZiWGd5M2cxcUFSNjY0SEtYdlZuVG5H?=
 =?utf-8?B?QWlGdytTcVZBOG8yMitwOWlqMCtTcUIrY3VuYW9mcVk5UzlXakVnWlVkTitE?=
 =?utf-8?B?YUtLcjAzNzFWbFgzZUg1QkxRckFhZ2lrcmcvU2pRSi83TlZRTHZOQituYXlL?=
 =?utf-8?B?UDFuUlh3Z003aVR1TnJsZ0V1OTliNUY5d2cxd3BhdUtlTC9SS3VTdjIyTmxD?=
 =?utf-8?B?ZUpwWlUyN1pndjlXWlBqMEo5T0Q0dXl4N0UvTWhpRVI1NFBsb2x2QnRhTHJy?=
 =?utf-8?B?VWlDZlhkcGFDQ1I5L2QrM1o5Qm5ySHNCb2lQSldTVjZVWEJrVXRwSXB0M0xa?=
 =?utf-8?B?QkRrWTZ0SFcvTWdBRDFrL3Nadi9UTnUwdjVnZ3UwRzAzSWp2R3VtbkhSdlZB?=
 =?utf-8?B?aUI1N094Z0JoTXd3bEcwVzJMelllSWp5N1NTeTZDcFFYd0hFWWdsTitwYjB6?=
 =?utf-8?B?aVkwRnkxaFpjQ0FWT2xnSHBDSWhpUSt4d1RBTlpXTmhOd1h1Uy9naXFkV0NQ?=
 =?utf-8?B?ak9FK1hMZjdYSGJIdEtsM1NjR3BMSUxkVlcwTXY1a1M1aXUyOG9ROGJpY1Rh?=
 =?utf-8?B?QU1OYVlBcjcxanAzQUVqTGxMMUdvMGdqVW1xRllYcW1FUWtPNGFvUTBLTVlh?=
 =?utf-8?B?NGtEK1VKeTRYdzVkdHdGZDM3ejRoQzNVTmZIZlQyTFpBZnRFakdmRm9TTXhw?=
 =?utf-8?B?Y3B0ZklTcVlxOGRqd1FtVjF0RXRiQk9NRkJFM3cyalljUGRrQU93dkZxZnY1?=
 =?utf-8?B?K1ZqNER6YkpQNVNuYnI5cEk4Y1Z1Ni9zazZtb29JNnlvaWV2Z3pBaVh3NGVY?=
 =?utf-8?B?R1h6ZURKTUFZN0JZV21mQjRZNVJ2NGFLM1kxR09sZXRlMlMzaFQ0R3lMb1BK?=
 =?utf-8?B?TWhCaTYyc0pKSVp3clJRa01sTzY0K2xJUDVONk5lMnhmVDErUFlxUVExUC9J?=
 =?utf-8?B?aVpVZ2FDY0tvbmpTSWR4R1E0aDhmYy9Fa1NjQVNva2xsUXZsTkY3V1RKY09M?=
 =?utf-8?B?ZWtnY3lEKytpWGNpR0F2SkpRRW9rcHIxZ0dXOGd1MEd4cVNEemd1a0c0amVM?=
 =?utf-8?B?RVZ2ZVp1d2tnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2lXcHJCSFk5RlRXb1BsUTRhZ00wNUlPalJ1SW1rVDFwU3ZWUHRxaHBFc2xJ?=
 =?utf-8?B?ZWxmdUQxL0hQM3BhZjlNQ0ROTVhOQlF1UDJEanlBQnduZHhpUk9HYUpmWU1C?=
 =?utf-8?B?WWdDaUxuVGhFaW13YlhRNXBNTXBuQlNZajE3QkJpL0dSM2p5VE5GMGtnOW1o?=
 =?utf-8?B?QVRpQWNsT3htb2tvcDVpQWhEM3FXOWd0QTJmeTJBS2g4VFY3MXZnVUJ3cjIz?=
 =?utf-8?B?MEhXR0ZGZEtKU3NEVi9QUE1CK3ROTzZXSlB6TEN0V3pEenVRMkhYZWIrQjhL?=
 =?utf-8?B?NDdjWHppUDh0WkpYM2tJcnNFUURJNTVBRVg4QlhOMFAyWCs0VVdsdGFtclNy?=
 =?utf-8?B?SkVtNGphWGxuaXFtUmRvQTR2aS9lejJEbGtZUmRIaXo2bkFUUnQ3aEhhNWI5?=
 =?utf-8?B?RlE5VXBOQnNRTE5FN1hxZWExMExneEJQY05CM3ovbzlBVlFuemNLSTd3eHRq?=
 =?utf-8?B?SGNDbHRtbjdzcWp0TlJXYzJjMEtCcEpGUnNvRFVuUGlNeFFxdDlkdDRTTTM4?=
 =?utf-8?B?Rnd1Z2F4NUtoUXB3a0c0ZmZ3SXhLNzZuWUtrRjFtVGdkRDJDREt5VWhDa3Zk?=
 =?utf-8?B?NWFVa2pINFMwM2haNHNJTzFCenE3N3hLNnhIa1M0K1F5MEVoQTR3SzFaWVVa?=
 =?utf-8?B?RXRwQS8xS1VSYzd4MGVlNFZKUFY2enM3K3dCb29vbDdFYmtJSGZlRkRzVEF3?=
 =?utf-8?B?Y25wakJMcmltWDlHVWhxMWxGR3VsQkxtZzRlVVlSVmtTUWN3MVZRaUZBRVB0?=
 =?utf-8?B?eGkvdWxzZUxNWVhYSjBzQk1meWV5cWFaOUQ4NFNOSVB3U2M1bkxyMml0YWV1?=
 =?utf-8?B?MHN3d0NJYVRWOHRBc3NGUE4vaitlZXJ2NXNKRitid1cySXpOK0hQYzBQakpJ?=
 =?utf-8?B?cmtpcnNRcUFZb09tM1JYaS8rV2c1STNldW9jRlE5SkJVNUszS3VEUFByS0gz?=
 =?utf-8?B?cXNldGFTQy9VMmhOSXhKbHpZTDk5STBPeWIxdGQ3N2lyTGJjMFJSeUlJOExQ?=
 =?utf-8?B?L0RsNjVlL08ySTM0OWVnQVJqZFNEVWZWV3A4aWxqV3VvdE5UNjdWbnZNcS9S?=
 =?utf-8?B?RHhsdzJqNUpFeW0xcmZPWnQxVE5oeGFoSnVmUUlyUnF0SGtvU2hWR3V3S1pX?=
 =?utf-8?B?Qk1hZ3UzUkRPS29DbjZidHFiLzBmSFFMMFAwOXF4SmNWN1JTNWdrQTJOM3Zw?=
 =?utf-8?B?ckF2MFlKRWRhclZLSGx0QlA5YUJvMjhac3NMY29pZHNxMDBicndNc2dTa1Jy?=
 =?utf-8?B?cDFtaUFiaWljdDNNVHJLV05OZW81K3FHdlRFZk50WW91RWFuOVUwMVZtSGlE?=
 =?utf-8?B?Nyt6NDNEdHFjVWZreTVzWUtERmNxMXVLdlYxM3FiTEdvUTlGb1JuVC9VT05i?=
 =?utf-8?B?aGtaRlVQVGV6MitlUENmNzhyeldsVEdiU1RWcitOVHZRbEdQTXc3UG1aZnhF?=
 =?utf-8?B?c1ZxZWlwZ3pNVy9DUVQxZTBRdXNmOTRGcEJldjV4ZU5SUGFJWW16MStvWGJP?=
 =?utf-8?B?cWNTU01wc3JyU3JGMUwvYUtPY1dveTZ2bG9NQXp6em5hTDhlZkZEUys3ZDdR?=
 =?utf-8?B?MEpKYkJtUmt2WHMyUXRMYnN3NzErQzlDaE1QeDJ4czVTeExlOGp3bkR0T3Rp?=
 =?utf-8?B?K2N3S0pDY1NLaGJQRWxndytkdUt4OWljNXA4YjVtVVZUSkdwaElMRGQyWVhH?=
 =?utf-8?B?QzlKZlYwYXRJcElLUnJmOVhRd0s4M0p3RmRVaGk1WVlTQWREY3ZhUVlsaVhR?=
 =?utf-8?B?QmNDdGpzRjJRQjEwcyttVHJSaytlZ0lZVDB6UFovMEtPWUJxYzRPeExLRUIv?=
 =?utf-8?B?VU5VcXI4WnBON2d5M1gwY0sxZjVXV0h2L3A1bDJwdVR0YWFXUGd0c2o2R1RI?=
 =?utf-8?B?clRpZUhzSk1EY2RTY2FiSHVWR2ZScldkNkxmQllxOE9DbHFZdUdBOTlRNWVK?=
 =?utf-8?B?Nk5vTEpmcXhWNlNHY0FDeXE0SmM0aEkxTVRIMERVWGZoeldhdUFnMTYzTEo3?=
 =?utf-8?B?SFY2MHJPR082LzNkY2RoZTBLTHpHSDRKcDZZUlllN1dsMXpPczBqQm44RUFM?=
 =?utf-8?B?TkhRLytOWmFwODlnM1ZuZ2xGdUM2UldEYU5TSzRMZHpBczhhRmJoU0swZXI4?=
 =?utf-8?Q?EP2U=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB5284056783850371B48BC9A88B62ACH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184ea41e-5ad7-468e-444c-08dda1e8a002
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 15:17:44.5265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZEeKAlzRzUf9kTlywd+tWU9/1pwXuAtW3GO7GVlOuMxGuNs8C1r/BEQsG90UK9rpk3z+MHcvciZuXBs7tNNRbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
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

--_000_CH0PR12MB5284056783850371B48BC9A88B62ACH0PR12MB5284namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgTWlrZSwNCg0KVGhhbmtzIGZvciB0aGUgbG9ncy4gSSBjYW4gY29uZmlybSB0aGF0IHRo
ZXJlIGlzIGFuIFNNVSBoYW5nIGZyb20gd2l0aGluIERNQ1VCIGZpcm13YXJlLiBXZSdsbCBkZWJ1
ZyB0aGlzIGZ1cnRoZXIgd2l0aCBhbm90aGVyIHRlYW0gYW5kIGdldCBiYWNrIHRvIHlvdS4NCg0K
DQotLQ0KDQpSZWdhcmRzLA0KSmF5DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
RnJvbTogTWlraGFpbCBHYXZyaWxvdiA8bWlraGFpbC52LmdhdnJpbG92QGdtYWlsLmNvbT4NClNl
bnQ6IFN1bmRheSwgSnVuZSAxLCAyMDI1IDU6MzcgUE0NClRvOiBQaWxsYWksIEF1cmFiaW5kbyA8
QXVyYWJpbmRvLlBpbGxhaUBhbWQuY29tPg0KQ2M6IENodW5nLCBDaGlhSHN1YW4gKFRvbSkgPENo
aWFIc3Vhbi5DaHVuZ0BhbWQuY29tPjsgV3UsIFJheSA8UmF5Lld1QGFtZC5jb20+OyBXaGVlbGVy
LCBEYW5pZWwgPERhbmllbC5XaGVlbGVyQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFs
ZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBhbWQtZ2Z4IGxpc3QgPGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPjsgZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PjsgTGludXggTGlzdCBLZXJuZWwgTWFpbGluZyA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zz47IExpbnV4IHJlZ3Jlc3Npb25zIG1haWxpbmcgbGlzdCA8cmVncmVzc2lvbnNAbGlzdHMubGlu
dXguZGV2Pg0KU3ViamVjdDogUmU6IDYuMTUtcmM2L3JlZ3Jlc3Npb24vYmlzZWN0ZWQgLSBhZnRl
ciBjb21taXQgZjFjNmJlMzk5OWQyIGVycm9yIGFwcGVhcmVkOiAqRVJST1IqIGRjX2RtdWJfc3J2
X2xvZ19kaWFnbm9zdGljX2RhdGE6IERNQ1VCIGVycm9yDQoNCk9uIFNhdCwgTWF5IDMxLCAyMDI1
IGF0IDE6MTPigK9BTSBQaWxsYWksIEF1cmFiaW5kbw0KPEF1cmFiaW5kby5QaWxsYWlAYW1kLmNv
bT4gd3JvdGU6DQo+DQo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBBTUQgSW50ZXJuYWwgRGlz
dHJpYnV0aW9uIE9ubHldDQo+DQo+DQo+IEhpIE1pa2UsDQo+DQo+IFRoYW5rcyBmb3IgdGhlIGxv
Z3MuIEkndmUgcmV2ZXJ0ZWQgdGhlIHBhdGNoIGluIGFtZC1zdGFnaW5nLWRybS1uZXh0IGFuZCBh
bHNvIHNlbnQgdGhlIHBhdGNoIHRvIHRoZSBzdGFibGUgbGlzdC4NCj4NCj4gSWYgaXRzIHBvc3Np
YmxlLCBwbGVhc2UgYWxzbyBjb2xsZWN0IHRoZSBkbWN1YiB0cmFjZSBsb2cgKGNhdCAvc3lzL2tl
cm5lbC9kZWJ1Zy9kcmkvMC9hbWRncHVfZG1fZG11Yl90cmFjZWJ1ZmZlcikgYWZ0ZXIgdGhlIGhh
bmcuIEl0cyB1c3VhbGx5IGRyaS8wIG9yIGRyaS8xIGZvbGRlcg0KDQpIaSBBdXJhYmluZG8sDQoN
CknigJl2ZSBhdHRhY2hlZCB0aGUgYW1kZ3B1X2RtX2RtdWJfdHJhY2VidWZmZXIgYW5kIHRoZSBm
dWxsIGtlcm5lbCBsb2cNCmNhcHR1cmVkIGFmdGVyIHRoZSBoYW5nIG9uIHRoZSA2OTAwWFQuDQoN
CkxldCBtZSBrbm93IGlmIHlvdSBuZWVkIGFueSBhZGRpdGlvbmFsIGRhdGEgb3IgdGVzdGluZy4N
Cg0KLS0NCkJlc3QgUmVnYXJkcywNCk1pa2UgR2F2cmlsb3YuDQo=

--_000_CH0PR12MB5284056783850371B48BC9A88B62ACH0PR12MB5284namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxwIHN0eWxlPSJmb250LWZhbWlseTpDYWxp
YnJpO2ZvbnQtc2l6ZToxMHB0O2NvbG9yOiMwMDAwRkY7bWFyZ2luOjVwdDtmb250LXN0eWxlOm5v
cm1hbDtmb250LXdlaWdodDpub3JtYWw7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IiBhbGlnbj0iTGVm
dCI+DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBP
bmx5XTxicj4NCjwvcD4NCjxicj4NCjxkaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIg
c3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0Zv
bnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJw
dDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KSGkgTWlrZSw8L2Rpdj4NCjxkaXYgY2xhc3M9ImVs
ZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZv
bnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsg
Zm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxk
aXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRv
c19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpUaGFu
a3MgZm9yIHRoZSBsb2dzLiBJIGNhbiBjb25maXJtIHRoYXQgdGhlcmUgaXMgYW4gU01VIGhhbmcg
ZnJvbSB3aXRoaW4gRE1DVUIgZmlybXdhcmUuIFdlJ2xsIGRlYnVnIHRoaXMgZnVydGhlciB3aXRo
IGFub3RoZXIgdGVhbSBhbmQgZ2V0IGJhY2sgdG8geW91LjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxl
bWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9u
dCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBm
b250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRp
diBpZD0iU2lnbmF0dXJlIiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KPGRpdiBjbGFzcz0iZWxl
bWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9u
dCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBm
b250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRp
diBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJp
YWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAs
IDAsIDApOyI+DQotLTwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJm
b250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1z
aXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgY2xh
c3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiPg0KUmVnYXJkcyw8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0i
Zm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KSmF5PGJyPg0KPC9kaXY+DQo8L2Rp
dj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6aW5s
aW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4NCjxkaXYgaWQ9ImRpdlJwbHlGd2RN
c2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9u
dC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gTWlraGFpbCBHYXZyaWxv
diAmbHQ7bWlraGFpbC52LmdhdnJpbG92QGdtYWlsLmNvbSZndDs8YnI+DQo8Yj5TZW50OjwvYj4g
U3VuZGF5LCBKdW5lIDEsIDIwMjUgNTozNyBQTTxicj4NCjxiPlRvOjwvYj4gUGlsbGFpLCBBdXJh
YmluZG8gJmx0O0F1cmFiaW5kby5QaWxsYWlAYW1kLmNvbSZndDs8YnI+DQo8Yj5DYzo8L2I+IENo
dW5nLCBDaGlhSHN1YW4gKFRvbSkgJmx0O0NoaWFIc3Vhbi5DaHVuZ0BhbWQuY29tJmd0OzsgV3Us
IFJheSAmbHQ7UmF5Lld1QGFtZC5jb20mZ3Q7OyBXaGVlbGVyLCBEYW5pZWwgJmx0O0RhbmllbC5X
aGVlbGVyQGFtZC5jb20mZ3Q7OyBEZXVjaGVyLCBBbGV4YW5kZXIgJmx0O0FsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20mZ3Q7OyBhbWQtZ2Z4IGxpc3QgJmx0O2FtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnJmd0OzsgZHJpLWRldmVsICZsdDtkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Jmd0OzsNCiBMaW51eCBMaXN0IEtlcm5lbCBNYWlsaW5nICZsdDtsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnJmd0OzsgTGludXggcmVncmVzc2lvbnMgbWFpbGluZyBsaXN0ICZsdDtyZWdyZXNz
aW9uc0BsaXN0cy5saW51eC5kZXYmZ3Q7PGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiA2LjE1LXJj
Ni9yZWdyZXNzaW9uL2Jpc2VjdGVkIC0gYWZ0ZXIgY29tbWl0IGYxYzZiZTM5OTlkMiBlcnJvciBh
cHBlYXJlZDogKkVSUk9SKiBkY19kbXViX3Nydl9sb2dfZGlhZ25vc3RpY19kYXRhOiBETUNVQiBl
cnJvcjwvZm9udD4NCjxkaXY+Jm5ic3A7PC9kaXY+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IkJvZHlG
cmFnbWVudCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+DQo8
ZGl2IGNsYXNzPSJQbGFpblRleHQiPk9uIFNhdCwgTWF5IDMxLCAyMDI1IGF0IDE6MTPigK9BTSBQ
aWxsYWksIEF1cmFiaW5kbzxicj4NCiZsdDtBdXJhYmluZG8uUGlsbGFpQGFtZC5jb20mZ3Q7IHdy
b3RlOjxicj4NCiZndDs8YnI+DQomZ3Q7IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBBTUQgSW50
ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldPGJyPg0KJmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7IEhp
IE1pa2UsPGJyPg0KJmd0Ozxicj4NCiZndDsgVGhhbmtzIGZvciB0aGUgbG9ncy4gSSd2ZSByZXZl
cnRlZCB0aGUgcGF0Y2ggaW4gYW1kLXN0YWdpbmctZHJtLW5leHQgYW5kIGFsc28gc2VudCB0aGUg
cGF0Y2ggdG8gdGhlIHN0YWJsZSBsaXN0Ljxicj4NCiZndDs8YnI+DQomZ3Q7IElmIGl0cyBwb3Nz
aWJsZSwgcGxlYXNlIGFsc28gY29sbGVjdCB0aGUgZG1jdWIgdHJhY2UgbG9nIChjYXQgL3N5cy9r
ZXJuZWwvZGVidWcvZHJpLzAvYW1kZ3B1X2RtX2RtdWJfdHJhY2VidWZmZXIpIGFmdGVyIHRoZSBo
YW5nLiBJdHMgdXN1YWxseSBkcmkvMCBvciBkcmkvMSBmb2xkZXI8YnI+DQo8YnI+DQpIaSBBdXJh
YmluZG8sPGJyPg0KPGJyPg0KSeKAmXZlIGF0dGFjaGVkIHRoZSBhbWRncHVfZG1fZG11Yl90cmFj
ZWJ1ZmZlciBhbmQgdGhlIGZ1bGwga2VybmVsIGxvZzxicj4NCmNhcHR1cmVkIGFmdGVyIHRoZSBo
YW5nIG9uIHRoZSA2OTAwWFQuPGJyPg0KPGJyPg0KTGV0IG1lIGtub3cgaWYgeW91IG5lZWQgYW55
IGFkZGl0aW9uYWwgZGF0YSBvciB0ZXN0aW5nLjxicj4NCjxicj4NCi0tIDxicj4NCkJlc3QgUmVn
YXJkcyw8YnI+DQpNaWtlIEdhdnJpbG92Ljxicj4NCjwvZGl2Pg0KPC9zcGFuPjwvZm9udD48L2Rp
dj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_CH0PR12MB5284056783850371B48BC9A88B62ACH0PR12MB5284namp_--
