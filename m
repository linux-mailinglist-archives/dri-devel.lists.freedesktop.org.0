Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB18D08EE
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 18:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B3610E3F2;
	Mon, 27 May 2024 16:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="XfawWXAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3098 seconds by postgrey-1.36 at gabe;
 Mon, 27 May 2024 16:47:09 UTC
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9423B10E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 16:47:09 +0000 (UTC)
Received: from rly11b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly11b.srv.mailcontrol.com (MailControl) with ESMTP id 44RFtNCL184116;
 Mon, 27 May 2024 16:55:23 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly11b.srv.mailcontrol.com (MailControl) id 44RFtEMx182943;
 Mon, 27 May 2024 16:55:14 +0100
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by rly11b-eth0.srv.mailcontrol.com (envelope-sender ttayar@habana.ai)
 (MIMEDefang) with ESMTP id 44RFtD0w182758
 (TLS bits=256 verify=OK); Mon, 27 May 2024 16:55:14 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuPzsip9FUrq/zQ9QYuc227Wx23JHjg1cw0UCWX30o7Q/zD70stG2MIYYGOylMFtY4DZnDe+zwltQfxmmDomt22Ss1cnuO8/vV7Am93/AeeM5jhmAvFNq4/n7KCeYA4l3WyKiL8MGTpi/8kzXMr9yHTUM6uf0LHuvnJZbDmgiUecYLUMnH7YyxfGW0w5pOb8dgoyNN4x/i3cnfogACDrisZo5ION1Qizyvnvkda06XJFvUtSM/QR09IbG5SHb0B/0GU97qzMttGjZ6tDTLQ74Dhxf51ct5Qu7cvhPLeUGgfRcKltobAz3HFMEDzKEVX2aNQBwjBZ7UYWKwlQIRVMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucLutKEZ8xoWcFBnbSg5lxdOZPazlhS2AuaIZp+TQZc=;
 b=QovWjasi7/Uvawd6OEgxObCryuxUr4FXxgwyIZM0PxozKGjXaPRPwY2NvVct11dDVldRIMfmoGQX/yipzL2W6zcH2kcKRQf5Jvz/jRaySHE+IKWnMDht/hSFWrHvHcpOZ+udGRJxYJVw1p58Fuo3/syuVP+Q0T4NMQzMZ4O3Rdb0LMDcfcLIKAVmidzFP14dO1rcP4wRPlaMCtAdHAGWPFAz5sfLeDYQURXHelq2NgfufzCoQNpwZL/+olEaA/7ieTTUq8HxigPZMXVmUil+DB9q6LIoRTobwlWK3mzCBRUgFi9dSAG6ZWPx2Jt+xbMPh5vNUlqeuasv/OgpTpvbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucLutKEZ8xoWcFBnbSg5lxdOZPazlhS2AuaIZp+TQZc=;
 b=XfawWXAgNL5BOwumfHP+oyMtxJaXsR8/c1qS/I20jqnFnr0mCO/yqQOGBDnEWWnCsrnlXertYyIiMdj8LY82V6T4KOk/U5uWmLXhpZt9lrHlLR8EMO186IUuRpsH0lo0X29um+M35hAqWBwqbaV/9FZGgXMZJAiUR4KpehzG6sImLFF+rNy942d9r3eTIADiAkAzsC0Hh6fk8L2dBaR3qHExoWQc/KtT9GVjj0CLdpnYe6aCnv6ibjScZszHWA254ytWuFfhkRpaKOyK6NDjafwgY77cE7moEvXiwhljBnWPwl32X30O0O/fbVJQ4EKKumBL933XXJhTOXKo7Z+rCw==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by DU0PR02MB9395.eurprd02.prod.outlook.com (2603:10a6:10:41a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 15:55:10 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::7e0f:390b:1dd5:b288]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::7e0f:390b:1dd5:b288%7]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 15:55:10 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Ofir Bitton <obitton@habana.ai>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/8] accel/habanalabs: remove timestamp registration debug
 prints
Thread-Topic: [PATCH 5/8] accel/habanalabs: remove timestamp registration
 debug prints
Thread-Index: AQHasEbvlNyVaXso8keGSg8wzaNdC7GrO/KA
Date: Mon, 27 May 2024 15:55:10 +0000
Message-ID: <76bd12fb-ec05-4da9-bc3d-6266522a749a@habana.ai>
References: <20240527150224.1953969-1-obitton@habana.ai>
 <20240527150224.1953969-5-obitton@habana.ai>
In-Reply-To: <20240527150224.1953969-5-obitton@habana.ai>
Accept-Language: en-IL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|DU0PR02MB9395:EE_
x-ms-office365-filtering-correlation-id: 247940b1-24d8-4893-bfe4-08dc7e656335
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?bzVCMFlEbHIvMUJhUkphZzBtKzVoejJIY0FPRlVHMW5ocjZoU0ttWUdsY2xa?=
 =?utf-8?B?dzh3bUQyNERtd2NoQ0xpWWZqUzVYZXI1a1FmbkdVb21VUDduaWVmSThNa3Iz?=
 =?utf-8?B?T1BuaHFYcGtKOWRwNTVkMGpkRVR0bGswT3lpOHJxWTl1RnNUSDk2ZmdLeXlx?=
 =?utf-8?B?Mll4N29aSWZWSzBLOXNtQlo1WkJ4aXBsMVVjbU15cmZwZTk1QnM5Y2t5KzhD?=
 =?utf-8?B?bEhQTjRkNGJaWUhGTkhwS0UwMFRnUVU1Tmgwb01MOU1oYkxLUmNVK1BITGlI?=
 =?utf-8?B?TVoyVkpiRlBPeUV2RkMzWEdGbk9RYTVZU0FHbjY1bkM0Tmkwc3N1RzAxV2Zj?=
 =?utf-8?B?WjdWNXM0OHFxUXdwVVhMdVZxWUEzTDVBZUJENGtvd1dJN2l1eXgvUEQ4OWZF?=
 =?utf-8?B?VzFzQXUzUUtNR0lJS2RsbUFOMlRTOEhFUGNLWUV2QnpIeUVOOWhzSUZlYzFH?=
 =?utf-8?B?ZWhzVUZTKzQ1Q0RZdDlkcVU1UHgwZzVBZm9PQTVSYkJXNlNoRzQyR0c0Y1BB?=
 =?utf-8?B?VC9mVFhUZVlpRDBoVExwc01IS2JET3VNY0plMTdhamc4YXNxcnRwMWFFMmNh?=
 =?utf-8?B?S1hHOVFQWkh5TzJHMEg4MDJZci9FZUZLR3p0Tm5YRTU1Uy9ibEI3aXNKRVZi?=
 =?utf-8?B?VFBNSWh4RXJXSHBlS0ZXK3R0SnB3SmtuUCttYWpacVJaTzNrblA4YUVpQmd6?=
 =?utf-8?B?eEkxVjJDU0txc05hNVRaMDNSS011OFQxR2U3aWZXYWcvUDBmVHMvZ1lLN05O?=
 =?utf-8?B?dFozZEQwZS9iWWM2YjJWc3JYY1pXZERzWkVjR0dXUVRVeHE4ZzlKVERXMXZK?=
 =?utf-8?B?ZDFSekRMK3pLWTBkUStrWUJMZHdBbERZNjdxaW1WY093OVRLaW9pNGUyZkRB?=
 =?utf-8?B?R3JRQ1llT1ovVy9sNjFWeHBvSHR1c2RqQlRzNjhkcHllRnpTZWtuMVRpRWFq?=
 =?utf-8?B?eCt1MGRSZXBlTXhQOUpOdzB6aW5zQTdlbDJMcEpPRXhyL0MvUkRscE1HMkth?=
 =?utf-8?B?YjdWQk5aWWhmWVMrazN2RmtjcURvM1pZNEc3YnlvNEpFekVPQWF6TWRiU1ZQ?=
 =?utf-8?B?N2E1Y3FwdUNBQWxpN3FZejVOY2dhZ1BUYjBOakEwOXFMRnFlQjh3M1JicjVn?=
 =?utf-8?B?bXEzR2pmUEFYZGMreEdiemdLdTgrTXBDZmg3dVJNNmRadElYNEJxZm93L2c2?=
 =?utf-8?B?Ym96d1A2Y1NsbjY1RzRKM2RDa1dhN0dBYVNHVW4xMk4zcTgxZm9FSGdGRU5H?=
 =?utf-8?B?VFZyRWNFMldLdUZ1TDI5Mlpmb0puazdzQUV0b09naGJxT1M5UjVqM2k4Nk1a?=
 =?utf-8?B?b1Z5NWsxMVZWOHl5Q0lXb1N0ZHFybmZYZFV3SnRrWGxmWEtNV08wanQvSlE5?=
 =?utf-8?B?aGowRHZKTmxBbnV3T1Z4Q3cwa1ZCWDJGQ0pXbzgwZlZNUW5raExTZzladTI3?=
 =?utf-8?B?d3VNb0lNU1RTNFduUTljSk5uNDVvcEMxMjJaMXoxOTFzY1lzYUx4Mnp5N0Vz?=
 =?utf-8?B?dWtySmRseXh2bDRVT1JnQVl3eTcrTE4yZDJtQnB1Y0Q4MWxWNTBkKzA5NTB3?=
 =?utf-8?B?dkovWGk4VVpYOGZkem5GOHJxME5adzkzSmlKS3JBeVEwN05wRXlQUXBWSFg5?=
 =?utf-8?B?bmliQXVOcVdSbTJEMzZRQWl4Mnl3NjNBd20wMlRnNGtucHBwTHppVVo4cnFy?=
 =?utf-8?B?bncwN2dkbTBJOFZUUjVKOW1ieWhRUGkxaTlVR055dmthVUVNVWd4RFVPb3Uz?=
 =?utf-8?B?QW52ZEdYN2tqUlc3WXlrZGxpSlB3MFpBMElsemFtOUgrZWZIWE51M2hCNXgy?=
 =?utf-8?B?YWhwcytHTTlheWJpVm91Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXR3SDhCeFQ3RWlqL3haTVYweThBcVIzOUZBaEV1TjVSRW9XUm5ucmV4Slp1?=
 =?utf-8?B?TlRMNmgxOUpzVGUySnBwVHZiVDloSzVIOVlINDNObklyTTlHMEJuM2pZLzVV?=
 =?utf-8?B?Qnd3OGFlaXdhYTFSeFR3RWM1MG1iS25kQm9xUEdRekF1R3RFSDQ4bXJNNm5F?=
 =?utf-8?B?NXg4MXNucmNyd2k2djJEZjlLT3h5N05QbFc5QWhhN292SW8xN0lhNTdTNXR6?=
 =?utf-8?B?VEVPS1EzZU1NNWhjeER3NW52TFl4aG5yMFZ0c0t2V3dVaEtPTndDMHVvcmo4?=
 =?utf-8?B?OUdkLzlOQkZFWjgvUXpLZU9oYmdYa0g1T0dLbW1yQ3EwT0loRENLWk85VTNt?=
 =?utf-8?B?MmkxYXgzcXM5b3owU0lldkxtY0ZHNGY3TkFxUHBMR0hqYWV6S1RHQy9VS0hD?=
 =?utf-8?B?K3o1dllnYk82RkZ6eVM2b3pUa1MrbzBFcFZadzZqQm0rY0lyUzBrTENZU2JO?=
 =?utf-8?B?K0YyTTVtblE0cWJvclZVVmgxV1hoVE1GSDh4TVBOTXNBTXRuUytVQVU0aXBC?=
 =?utf-8?B?QkhVZ3F3WUZrS0VoQ3l6MnNGR2RMajJpQ1FGWTcwcVpnWlNhNmZ4eHBnZW40?=
 =?utf-8?B?YUpIcVdkNVJzWXRWL0ZONEtwaFVOMEplczJ6TEk4ZnhzMThNaWVZZVI3WlZz?=
 =?utf-8?B?NmpucU5Rc24wZDFIZGNwVW90TG0yM3hXaVJpQXYzTVl2L3lRcWdENnI2VHFm?=
 =?utf-8?B?dGV6aGJzUDJxdEhxWFdaS2JobjUyRysxUUFySnQ1VVQxUVZEa0swWDRoNWJy?=
 =?utf-8?B?YTZkbVVUSXZNVktXd1pUMXpLVS9mNU01aEpuazlmMFlRT0Q4UWFOYkJkOFNl?=
 =?utf-8?B?RCtWbFBPWGtLWVNsbm9VOGEwamtjQU9pOWVabzZXL3JkdXdNTDlFRW15NVM1?=
 =?utf-8?B?NGp4cU55V1gwaEVleUdHWTR4MlJuMVNUbDVucHZzekQ1bkVaUFdCUlg5bG4r?=
 =?utf-8?B?YUdCeEl6QWtxeHBBdENCQm4rRUZjeFBBR0ZTQzl6MFNqOVh1cFplYUluT2Uy?=
 =?utf-8?B?NHA2UWkxbGdZSk1wVmRueWk1TXJuTEVjVU9BVXZYODJSb1RBRkNqNGFZNTdQ?=
 =?utf-8?B?UXkrNzVZUXhyeXZQNXAxQ2RvYzkrdlNTZmtnd3lKbFh6b2NhU3NraHh5SnVV?=
 =?utf-8?B?TE8xUU5VMVBMZXIzU3RWZ0VnZUFMOWVrSTBLL3FXSXk5LzhmaUVKdGo1YXg1?=
 =?utf-8?B?cEx1bjZSdEtJMTYxcmY5ZnhmdCtjK0lld2pOR0Z2OTJkVFdmN2tGYktsdy9W?=
 =?utf-8?B?MkVTbHN4WlVYamtpUlp2TjdJSndxQmFaeGw3TlluSS9TK1c3K3BjVWphRjBB?=
 =?utf-8?B?SEExcmU4SnR5cHZ6ajV2T3ZGWFJPalBFeVBuUi9kTTlBSnplc1U2b2F5MFFi?=
 =?utf-8?B?aXR2NWNHaERCSzNOS0ZkdmxRUlQ2ZU96M2w1eEdWRFNSMEF0ZmNFR1k4QTZP?=
 =?utf-8?B?WklMaXlJRFBva2UxMHozSlJ3MkxSYmVKQ2FIWmVpRDNPVTh0Vjh1bE1JVWJZ?=
 =?utf-8?B?aHZUdnpjR2RSMU1IWmFsOG1IL3BoTkQ3blJDblZpbldUTGdOSGZVeUVSVU0z?=
 =?utf-8?B?ck50VS9ta2M2Q000amp4WmQ5UW5ITmZhK0J2YnBwNXhJdWNwZnNGVkw0cEE5?=
 =?utf-8?B?eTBld1ZGdFN2VW5vT3Y1bUJMNGdlQXJhZnErZjVFMk9XdHVNOHVuQ3N2Vncx?=
 =?utf-8?B?MitIZWhlL2lzL0s0bnBvOTlrbHFQSTVsQS94RTJmakdDdDhmRHRZNHdyRFow?=
 =?utf-8?B?UWVWMVc1SkF1TUo2K1hVZWZKd2lKZDdzaU1iVmJva0tTbGJJN3Y4amgyOFRV?=
 =?utf-8?B?VnpCMFBIT3lUb1d0ZHU2d2hlQVljSjhXa3BaclVZMzk3K0ZkSlQyeHZJaS9T?=
 =?utf-8?B?b1E2a0pLTVMvdHltRHpnVGtjeEEyNC9YSCswOWs1QS8yRU1NM25RT3FMeU9j?=
 =?utf-8?B?V0o4cWxER2ltYVBWVzBzd3RxVjkva0J1YmttWUhQS2NtMmdoaDhaeEkya3NC?=
 =?utf-8?B?eUVYRFdmaFZPOFBzN1BxeWlHbmNVU0ovY2RNUXdiZ2tJQlo1MGtzQTFPT0hU?=
 =?utf-8?B?WnR0UmUzL2wrMHAzbHE2enBFSzY4RjJlYnRqdHRoSGx6eGMzWlpYeG9QV0sz?=
 =?utf-8?Q?zPGw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <490AF5B09CEBC7449D411B69F2E7FAE2@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xOMnj8soprQyzowIVOQuMGTqq+BCojaeAWojzTimB9pqTtCKS6mORAfK52JHeQFSVO7soyilctHSDV27eU1y/8vSWF26I6nryyHoOWAi+mmopDddMrYjGlFFFFtiE4IjDLe548SPoHcPQEts56BaP88T4umZhjf8psaGbiwTLbf5pTtZhtScaJilvyH6bCbEeca/vCcDX4HN5oNB4b2mgLssJozu7I5LsfS9uNNij6+KodM/e1bNRse3x8U3f1Guvn6mqVaZKN+shXK0iZJ2P+9UMRkc0Tk3tcegxmf26MC9inLvgNPLL5m2y0Om+Gzmt62lPhHoTGXhO785KOdDG6ViJkizTx4yebpLu4p0fNX2MJ1M/Ym7+K3gM3tMGYmnZfSf6LWAAODJcuzFgEVvrb4up+qsU3+nKMKV2eICaeBLT/XwSwxco5D5jzXCKinjH52/1J3jxksCv1RO9IRBPLFdXasjYGGSatUB8X2lyFaMH5rBeNh7gVbw8FhpVp0mWdIth13hBXd5+oGP/P/4oWvAWiVX3GEL3do4fby9gJU6qMfEAnn1n6yDRS2UlK8RFSWhdWXIfhJNoAuZ6k8tqdW3X4XfxW3mDDmFDFvnFoYx0VcqX/ttvZlRYRFBml7c
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247940b1-24d8-4893-bfe4-08dc7e656335
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 15:55:10.0878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5CpeQneUfl9XDVwc9uliB/G3hMtd84/qQ0EoRi8Ny0KEnZJK2w4s/aTo3mxC4n7OiQigMPR6/bNoR8B4IqWRpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9395
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxNjgyNTMyMzpGUEtleTEucHJpdjpq15vult0X+vozmoDyEn7WOTgz5wqADMeYZtnVdVoknmD3woRTr4eQuu09Egtr7zjNdmb87NeM8IB/Bdn4jZWNpwrBYXxy11ySvePLV23FFp+qbj6ydlvfReFqhVqNjifVrsgzeEqZzfLb9K27BF4CaF9cK//NsQ/iXAEd/vfQxKL+Ps4CoeTzQkcqTedrEu8as3sZ1gvX+dIbDnfIj2SxNprQMCNovqgGxB+l3j1K44Bjnl7Bcmq0OlCpz7YsVSObCZ1BgBjLnZFSmK+JdcFtIPqDd1FiTVU97z7jVbs9JvXTiDsZQIASzAhwJAYylGq9p1id+z/xyJbCDZkgnBuk
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 10.66.1.121
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

T24gMjcvMDUvMjAyNCAxODowMiwgT2ZpciBCaXR0b24gd3JvdGU6DQo+IFRoZXJlIGFyZSBzZXZl
cmFsIHRpbWVzdGFtcCByZWdpc3RyYXRpb24gZGVidWcgcHJpbnRzIHdoaWNoDQo+IHNwYW1zIHRo
ZSBrZXJuZWwgbG9nIHdoZW5ldmVyIGR5biBkZWJ1ZyBpcyBlbmFibGVkLg0KPiBSZW1vdmUgdGhv
c2UgcHJpbnRzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBPZmlyIEJpdHRvbiA8b2JpdHRvbkBoYWJh
bmEuYWk+DQoNClJldmlld2VkLWJ5OiBUb21lciBUYXlhciA8dHRheWFyQGhhYmFuYS5haT4NCg0K
PiAtLS0NCj4gICAuLi4vYWNjZWwvaGFiYW5hbGFicy9jb21tb24vY29tbWFuZF9zdWJtaXNzaW9u
LmMgICAgfCAxMyAtLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGRlbGV0aW9u
cygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2NvbW1vbi9j
b21tYW5kX3N1Ym1pc3Npb24uYyBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vY29t
bWFuZF9zdWJtaXNzaW9uLmMNCj4gaW5kZXggMzllMjNkNjI1YTNjLi41OTgyM2UzYzNiZjcgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vY29tbWFuZF9zdWJt
aXNzaW9uLmMNCj4gKysrIGIvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2NvbW1vbi9jb21tYW5k
X3N1Ym1pc3Npb24uYw0KPiBAQCAtMzI4NCwxMiArMzI4NCw2IEBAIHN0YXRpYyBpbnQgdHNfZ2V0
X2FuZF9oYW5kbGVfa2VybmVsX3JlY29yZChzdHJ1Y3QgaGxfZGV2aWNlICpoZGV2LCBzdHJ1Y3Qg
aGxfY3R4DQo+ICAgDQo+ICAgCS8qIEluIGNhc2UgdGhlIG5vZGUgYWxyZWFkeSByZWdpc3RlcmVk
LCBuZWVkIHRvIHVucmVnaXN0ZXIgZmlyc3QgdGhlbiByZS11c2UgKi8NCj4gICAJaWYgKHJlcV9v
ZmZzZXRfcmVjb3JkLT50c19yZWdfaW5mby5pbl91c2UpIHsNCj4gLQkJZGV2X2RiZyhkYXRhLT5i
dWYtPm1tZy0+ZGV2LA0KPiAtCQkJCSJSZXF1ZXN0ZWQgcmVjb3JkICVwIGlzIGluIHVzZSBvbiBp
cnE6ICV1IHRzIGFkZHI6ICVwLCB1bnJlZ2lzdGVyIGZpcnN0IHRoZW4gcHV0IG9uIGlycTogJXVc
biIsDQo+IC0JCQkJcmVxX29mZnNldF9yZWNvcmQsDQo+IC0JCQkJcmVxX29mZnNldF9yZWNvcmQt
PnRzX3JlZ19pbmZvLmludGVycnVwdC0+aW50ZXJydXB0X2lkLA0KPiAtCQkJCXJlcV9vZmZzZXRf
cmVjb3JkLT50c19yZWdfaW5mby50aW1lc3RhbXBfa2VybmVsX2FkZHIsDQo+IC0JCQkJZGF0YS0+
aW50ZXJydXB0LT5pbnRlcnJ1cHRfaWQpOw0KPiAgIAkJLyoNCj4gICAJCSAqIFNpbmNlIGludGVy
cnVwdCBoZXJlIGNhbiBiZSBkaWZmZXJlbnQgdGhhbiB0aGUgb25lIHRoZSBub2RlIGN1cnJlbnRs
eSByZWdpc3RlcmVkDQo+ICAgCQkgKiBvbiwgYW5kIHdlIGRvbid0IHdhbnQgdG8gbG9jayB0d28g
bGlzdHMgd2hpbGUgd2UncmUgZG9pbmcgdW5yZWdpc3Rlciwgc28NCj4gQEAgLTMzNDUsMTAgKzMz
MzksNiBAQCBzdGF0aWMgaW50IF9obF9pbnRlcnJ1cHRfdHNfcmVnX2lvY3RsKHN0cnVjdCBobF9k
ZXZpY2UgKmhkZXYsIHN0cnVjdCBobF9jdHggKmN0eA0KPiAgIAkJZ290byBwdXRfY3FfY2I7DQo+
ICAgCX0NCj4gICANCj4gLQlkZXZfZGJnKGhkZXYtPmRldiwgIlRpbWVzdGFtcCByZWdpc3RyYXRp
b246IGludGVycnVwdCBpZDogJXUsIGhhbmRsZTogMHglbGx4LCB0cyBvZmZzZXQ6ICVsbHUsIGNx
X29mZnNldDogJWxsdVxuIiwNCj4gLQkJCQkJZGF0YS0+aW50ZXJydXB0LT5pbnRlcnJ1cHRfaWQs
IGRhdGEtPnRzX2hhbmRsZSwNCj4gLQkJCQkJZGF0YS0+dHNfb2Zmc2V0LCBkYXRhLT5jcV9vZmZz
ZXQpOw0KPiAtDQo+ICAgCWRhdGEtPmJ1ZiA9IGhsX21tYXBfbWVtX2J1Zl9nZXQoZGF0YS0+bW1n
LCBkYXRhLT50c19oYW5kbGUpOw0KPiAgIAlpZiAoIWRhdGEtPmJ1Zikgew0KPiAgIAkJcmMgPSAt
RUlOVkFMOw0KPiBAQCAtMzM3MCw5ICszMzYwLDYgQEAgc3RhdGljIGludCBfaGxfaW50ZXJydXB0
X3RzX3JlZ19pb2N0bChzdHJ1Y3QgaGxfZGV2aWNlICpoZGV2LCBzdHJ1Y3QgaGxfY3R4ICpjdHgN
Cj4gICAJaWYgKCpwZW5kLT5jcV9rZXJuZWxfYWRkciA+PSBkYXRhLT50YXJnZXRfdmFsdWUpIHsN
Cj4gICAJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRhdGEtPmludGVycnVwdC0+dHNfbGlzdF9s
b2NrLCBmbGFncyk7DQo+ICAgDQo+IC0JCWRldl9kYmcoaGRldi0+ZGV2LCAiVGFyZ2V0IHZhbHVl
IGFscmVhZHkgcmVhY2hlZCByZWxlYXNlIHRzIHJlY29yZDogcGVuZDogJXAsIG9mZnNldDogJWxs
dSwgaW50ZXJydXB0OiAldVxuIiwNCj4gLQkJCQlwZW5kLCBkYXRhLT50c19vZmZzZXQsIGRhdGEt
PmludGVycnVwdC0+aW50ZXJydXB0X2lkKTsNCj4gLQ0KPiAgIAkJcGVuZC0+dHNfcmVnX2luZm8u
aW5fdXNlID0gMDsNCj4gICAJCSpzdGF0dXMgPSBITF9XQUlUX0NTX1NUQVRVU19DT01QTEVURUQ7
DQo+ICAgCQkqcGVuZC0+dHNfcmVnX2luZm8udGltZXN0YW1wX2tlcm5lbF9hZGRyID0ga3RpbWVf
Z2V0X25zKCk7DQoNCg0K
