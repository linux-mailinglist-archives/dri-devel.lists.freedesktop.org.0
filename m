Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEH0LEj4kmlx0gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:58:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DCF142945
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCA310E202;
	Mon, 16 Feb 2026 10:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="X1MSn5MA";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="aUTpXcIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7DA10E35C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 10:58:13 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61G710Uc3974293; Mon, 16 Feb 2026 10:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=u9mM4RTsh/CLGEcYrm5HEiKQ8
 rS7j3pCHxcp/98vdBg=; b=X1MSn5MAEvwSHptwdgikn8H72dxBH5NMga8V47G/u
 PYdsVUWpIEzbN9SJiPshLNrHcTTQvqSCx+8NqGljrHTcSSgSvvOujg+KUGMIMc1i
 ake4X+pBCD6f7oume+/vUuZhsiBsOKXBv79xR7o6rk/6kk6onkBEVZ7mMBHZoDkd
 OkrkhIRHZT74d5orp+8x6K0YW+5ntxTaCrdQQlf5xWpejyEHTeasBnGpnOPy/l03
 yWF++3DY7r/FM8Eo2jEuIZNfFgXM0uPVqUFcaAyoKZ2wYvHdEp1dnfQZ5xkn3Z2B
 NAgvGa1NW6jf3fmBIUnXFwoNCOz9FwWol3XzgJINh5J4A==
Received: from cwxp265cu010.outbound.protection.outlook.com
 (mail-ukwestazon11022126.outbound.protection.outlook.com [52.101.101.126])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4cbcqq8k74-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 16 Feb 2026 10:58:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQdQhrSgqjer+n4lzc2Beg8mFYkRMbga0TLvwWSnFMAFTeibage9mNT8VIU/BuOhm8kOHYOubAfL12HJoUIP1PtSN06bnzssM2Ymyt8DTK3EqtQ/W5Muz9QF5685909WWHHW0C+nA5H2MRVZGAreIONyqgrblNTO6qnzHPW78Yqcgb1FkoKqgfXavL/Np5LiuudIMwtNFBH0MdENzYcNuGcGYqkAlcmGCauCbq6FMWtjzYQxLCVBdst5qmM3occaYnrOMrmZkNCJNUJD/2R1D1w2teKTIXOIygDBfd+ggTfz7G9y2GOPLBxppzQ5a8KTNRH24n5JmU2isAC5SJl7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9mM4RTsh/CLGEcYrm5HEiKQ8rS7j3pCHxcp/98vdBg=;
 b=F25J2c87U+MQm6eyhYglfgtNmPGqetmXV0s6Uo5FnGFVBDSlljNnph8a6VEk97pIwjcmN2yCeftaLlf/HjJswtitvxH9UOXnXgPjsL9OTTrCQUu4pkIHWhUmqO72pYzbRyti2968ET5i14weUxw17Ap2PWwQA0DeKmgvv7QeVBYIngmudP9j9cGeB4rxs2I4IGDKEdAYZyCcIkjcNWZvZEW6accfJwFL0wrnVnhan2KIyzp5Jk3xqBnx4qH5tznP+v2OgEbQWTho7LOopg5nE0DiLrid3lbb4PhowJvVGmNN3EyDC2Ag9pCN/GOU7bCUj6GPX7J+ffv5tPnxUXvPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9mM4RTsh/CLGEcYrm5HEiKQ8rS7j3pCHxcp/98vdBg=;
 b=aUTpXcIoeHG2Dm3FBRzkVMCkGyzK2TAwSMCpjl+WVMQ85BlRPgQkM2MvXOTbPF0dWoxgjPOxatRhGAsRvxe9KChr67EWBgzoB8dGK3ttPOKX0XysShmpxehMB1i71rfKilbT9A/zcaVmCZ7Sg7kbrZfY2QitONjja73LfN+uPlo=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by LO0P265MB6502.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:58:01 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9611.012; Mon, 16 Feb 2026
 10:58:00 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Geert Uytterhoeven
 <geert@linux-m68k.org>
CC: Marek Vasut <marek.vasut@mailbox.org>, Frank Binns
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
Thread-Index: AQHcnzMd7maEYO4HxECwLbgo4z2VBA==
Date: Mon, 16 Feb 2026 10:58:00 +0000
Message-ID: <21b1fd77-252e-4fb3-aa65-1c26043c5412@imgtec.com>
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org>
 <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
 <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
 <1e8e416e-e474-4288-9686-1ba2b88e4946@leemhuis.info>
In-Reply-To: <1e8e416e-e474-4288-9686-1ba2b88e4946@leemhuis.info>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|LO0P265MB6502:EE_
x-ms-office365-filtering-correlation-id: 36a2ce3f-e634-442f-aba9-08de6d4a4058
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|6049299003|38070700021|4053099003;
x-microsoft-antispam-message-info: =?utf-8?B?aXJEZ1gydEFwN29zakZUUHMyVVZjdEFzaDNCckdVYWNlOTAzN0w4Nm9OSEFn?=
 =?utf-8?B?bTB1L3BOQ0pYTHNuaXZ2NHRBWWdCdlh0bmM0TU9iV09mZVBOY0FBelY1RXdG?=
 =?utf-8?B?UFJZWlZ2d0VDY0hsTTFTT2RhMVRJcVBQb3lvRnphNUJWTW5FMXNCQjd0dWFH?=
 =?utf-8?B?em5PMVIrQ1F2aHZpRnBQMDlBblM5VGQ1U3MxL2xhR1hSRFkrZnBpUWVTbVA5?=
 =?utf-8?B?TGo5WVo0QjBUOFdtTTlodk85M1VPUWF2MUxHMnZDVWlYdHFyd0xWUHJuamN0?=
 =?utf-8?B?L0lhenJYSFFORmFHODFIa0tKVTYzZ3liaWM5Ry8yMXdpNkkrcXE4ZU1FUU5Y?=
 =?utf-8?B?anM0MEM3QVF5UDMwZ0NRVXdGdFFVblIxMGErSUJvT2YyTU1hOTdNSmtCcmNs?=
 =?utf-8?B?QVBlVlo1VXZhbllpNFYrVXNUd2cwcXprMDAwZlBBcnJOWWhMKzlwV3JBMlpL?=
 =?utf-8?B?QjlST0s0T08vTzlpZWJhOTRyMHZqUDZEU21GSEZ2dzJYMlhQMk05b3BobXVY?=
 =?utf-8?B?M0hUZTE2YUJTY0NlZTNaaTZkQmhON2FrLzBFdWxNUkhYa2NoNERaejBHWG9U?=
 =?utf-8?B?bWFJVU92QnhnZjJSdlVZNXlRRVFvSXo1ZnFjMmdYdG92YmsvSmhSaUYwSXlq?=
 =?utf-8?B?QUxsTnVMUGFaV2RzTHlJSFBLbk5iSlZlVGtFOVQ1Q2Y0WmFnYzBjL1hVSGxK?=
 =?utf-8?B?TVdvMkFRdEhMSGh3MjM5YUdQZFNGTXI3azF0eTBrcjF6Zml3dXBtVUZJOGE3?=
 =?utf-8?B?THl4R3hZcDdkd2VvQUYrV1djaWpoMnUzZjhWSXQ4eCtpZlhiN3RiSWZxakRa?=
 =?utf-8?B?K3FjYUpRaDlhbUNsR092OUNsdTZYWUxROUNxU2dLK3grR1NCYmd0Mjg0Qmps?=
 =?utf-8?B?TnJDMEJVWDk5bEJGNThZVzZKbGRDUHhBalo1Wk9CQmVna3ZIdVBjdGRMSUMz?=
 =?utf-8?B?S2Jwc1c4QmlBU0FyeC9kUnRvQ3dVOVNVeDVMWDZ6dFpmY2U3aGp0V0drY0sy?=
 =?utf-8?B?cnhydW1MMkl0QlBxY1Qvd2NJM1d2aVlxL2tUQmhDSU9SaVZRZmdwTzNaR3Nn?=
 =?utf-8?B?R3FXRzRGdkVVbHg2bTFhM0lQNVVvQTROc0dOQUlLQ1pNK2NCekREbkJUNWcy?=
 =?utf-8?B?V1drOEJHZ1hHTXd5YnQ1d1ZVakpkWkw0ck5acjgrSDFLU0tKN2hSYnNtd1ZY?=
 =?utf-8?B?ZDh0OStpb1RxNVpLTDNJTXUyTXRxUiswQy9Rd3lRZlpyK052bFRiZXRTMnZO?=
 =?utf-8?B?Uys0RHE4VDcxQytJclorbWRPTWNieUhsMm1yeEpZQTNCKzUzU3h4b21qbVNh?=
 =?utf-8?B?dWNGOUVobzY3Zmk4T3diWEQ1cklOWGVUejBTcHJxczJXd0l5RTR3VHpkQ0Mx?=
 =?utf-8?B?RDhIRHhRbW5WaEtCNTBFMEs3SloxVjRUOGZlbWE1RDh6TGx5VmNOcFo3bVhV?=
 =?utf-8?B?Ry82YmZhMmxQZVBKWGlQQVZuem5XZUVIQjFlcEhwM2dYL3VXT1NNS2JTbThM?=
 =?utf-8?B?QnBGRDhIeEw2ZHJNdDh6czl4NUlWd0I3Z201ZnhaTmE2VW1BSUZiWWJoR2Yx?=
 =?utf-8?B?UkNpd0Z2VUNOWlpyU1A4SkxPemRVZjJJbEliNVZOUHB6MmNHZ3QwYURIZlVz?=
 =?utf-8?B?M0RycUVWZC9jQjAwTEt1RDhuOGUvU2Vibng2Vjd6QXB1bENBZXd3MFVkZlRW?=
 =?utf-8?B?UlB2SWRtaW5Qa0U1bjI0Z20zbHV3MUF6UTlERHNHZ0RYai8yeERPamROSXZT?=
 =?utf-8?B?WllqaERMT0xtQTRuWVpCSUhMUzU5MVRvUTg0S3l4TFdRSVQ1WFJDRHBvSmp0?=
 =?utf-8?B?VUxPNkR1M2VrQ2RweDU3RkV4eWlqWS9QZVdpT0ZBaGlrMk9PUE1Gd1hGT3Bj?=
 =?utf-8?B?eWZTM1hGR1VzVVkwUEgvYkpSZmsrTjlxU3RzRmE1aHVDN0NseG5RVkpLWFRk?=
 =?utf-8?B?N0dmbkpNYzc5QjJpa1dBQjltajQ3VDQyT1ZONWl5WU12Qlc4UVp5dGdkQVI4?=
 =?utf-8?B?LzhheDg4NVhWbGJYOG80bVdQN2xEUUxrZEpmRzZST0pzWENlMlVTUGt1L2Z1?=
 =?utf-8?B?bmttSDJiUE5oZ2U0RElhRXR2ZDJHYUVkck9KdU1jZGpoV0ZHRE4vWXMrU2t1?=
 =?utf-8?B?Rm1kZVhCaENlUWFFMDR1RnBjZnllbmhJWlNkUVNBVmVSNXJUcVI1T1lmZmho?=
 =?utf-8?Q?Mpxm1JiKBk0KVmxskcWhEQKIF0BGPp8e5EFGyddAQnKQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(6049299003)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YURwRFlYWWhMWkVFUHQwY2N3WWUyRUd1UTVnVnVMc0dQVUxKMmx6bWlGU2cy?=
 =?utf-8?B?a1kralRYS01LKzh3dzBUaVN3VUh1QTVKWHBPYTU1MklZN1AySURXSDdubytk?=
 =?utf-8?B?NnluUjRIZThnZDJGcXJtMHZRT3dDUjgzbFhLYlQ3RnZnN1FZUzJVM3Rvdm90?=
 =?utf-8?B?WVNXNys3QXRxc0Rwd1pZQnVpNW0zdzJ0ZktMcHRGUTVSbzBOekxRRVJMQS9n?=
 =?utf-8?B?Q3BwMGlDTFhVMkJoVU96djdOQUNQT0lLWFFTU09USWlpNUZNS3FXa0JZejA4?=
 =?utf-8?B?V2JuanZQdUVqVmN2MkRUQ3Q5TFVrNWg1SHpUazlvRldzZmh0MzFqcFhYcUVz?=
 =?utf-8?B?Wkllb09ZQlpLaDUzRjdocmtFMzZZUE5pb2o4bERvN3pGK2dtdUs5QmFCbTgz?=
 =?utf-8?B?RDYyWkZiQzlCY05pUWU2MEFQUHpTSG9acXl3S2YrRWpnNisvb1JlcldwZW9l?=
 =?utf-8?B?bFZjaHgxdDQ0eER0VHRWREFKRng3VVdkdGVkdUtVeTdVSGtoMWprUzdHMDZQ?=
 =?utf-8?B?VnpwaFcvRHNSMUtxN3RiSFFzOWFNZCtiSjJjbUtIRXlLZzZSd0QvQXRiZHVG?=
 =?utf-8?B?MVlSMnlrSi9pZXJ1T0RHMUU4Y1NyN0M4enZ0YzArVmllanJNdmZDK1luaW01?=
 =?utf-8?B?NHhONjRjRVFiNUtUZTVZQjg5bnlyVVMzUG9VNVQ2bDBDQlhDWU9STEJsdWZ4?=
 =?utf-8?B?aWFwKzVyRmNqK3J5aEJSMWduVUZocWNjcmYwWGEyR2RSeDJyNE1OekhIbmtU?=
 =?utf-8?B?MUhRUlRGd1BuM2JTUnJIU0R0SzgrcDd1Yis3YlZJTnBPdWcxbzBQcWdFOFpH?=
 =?utf-8?B?Yk5XUHBHUUpBcU9UZHEzZ2FkZC9yM0JURUdZVHZQSWJ2TlRTaFBxTkpUMExP?=
 =?utf-8?B?R0VmeUZNaHJPOVIxRFIrdk10T3ErUXZobzBERDZodzllSHNBbC9RSmRIUzFh?=
 =?utf-8?B?VU5PZUFmd0NlbU5NL21PbGR6dmFYZno2SFpFREN3VWhtK0JxQW1LamRPSFY2?=
 =?utf-8?B?ODg5SW40eFFzKyttd2JsRCtXMDFRdDhNMnRDVmZjNkc3Y1VBZFpRWHIzaUFa?=
 =?utf-8?B?UjNBcTNkeExTam5SRDhOUDV4YnZ1Z3BLNGlodm0rOHFFcVo0YmZWcXNFVTRH?=
 =?utf-8?B?V1MrUjhtSVc1YkFhSzd3Z2VEcnVuVC9vcmlJM3RhZEhsanZkWUtBUjlmbVA5?=
 =?utf-8?B?aGd6R2wyVHdnYmhXKytEN3FvS1UveFpFZlpublpXY1VQdUY3MWlaYTZuTjgr?=
 =?utf-8?B?bHVyRHRQeDl5VmpwaTRDanQ0MWp0NDFMbFFTaGJrTWZJSm4xeWdVUkxCem4w?=
 =?utf-8?B?akJacWJDT0dScFZBbkw2OXpBTDZYbW0vQjJwdW04WmxrRXA0VDdrUE9EdVRH?=
 =?utf-8?B?Zzc1Q2RtT0UxWmgrSmgwcHFqU3MwUmFSVU43UUM3NGQ4TWhld2l0OFRSM3NT?=
 =?utf-8?B?ZDRrNExjQnQ2Qkx0SGx2Z2RZWnpVRy9pZlJpdGtoemVWOGRaaEpiV1FxM21K?=
 =?utf-8?B?UmVteVVFZzgzTUJJazJXR0I2cmFCdVlNbkVEMFVGOCt2WGp6TzVaQ2RnWkpE?=
 =?utf-8?B?NFJNc3V4RW5UVUFibTY2YWdDMXF2NDM2SVdIbW41Zy8zWDdSVGRkWitJanNY?=
 =?utf-8?B?MmljVS8rRU43UmFiN05uenMzYW9BL3JrcThFNzZ3SlZ6MUEzYVltb0s3Tkhk?=
 =?utf-8?B?NitUVmVqQzZXdGlodENQR01MNVhaTkkwdVFpRzVZd0h3WDczS09Fd3pPeHlW?=
 =?utf-8?B?Y1RpbWo4cUp6UnlGU1VpdWZoRzcwaFljU2pZSEVSeDlPUXBTNTZ3dVh4S2VJ?=
 =?utf-8?B?TDNVVGNSVmhxVDIrclFmTjYzdzhINnVZcXVHYzE2VHkvalhYYnZPalczTi9l?=
 =?utf-8?B?cEdSVlBOQ204MzlXcEtYbWdycjhHeWhMUUx4TTh1QUZieGVLM0FsOExPNW5Z?=
 =?utf-8?B?b3d6eis1UVZIV1ZsajFNQ09JTmRqU0E0SjBxSVNua3dkQnladnQ5aHZLZnVi?=
 =?utf-8?B?ZnV0ZDNKWHhyT0VRUGc2QVpuYXZmQ3E0RUZzY2c3TEF5WUFZR0gwYlBrTnJW?=
 =?utf-8?B?TkxMcHd4UUlGOVhiN2FYOUlwOGN2bjBhTC9Zd3Zaa1Z1KzQrdFdtelg0dlFF?=
 =?utf-8?B?bWpxQ0FMeUkzWkRGMHpyOUVFZThxaDFtaVJDK3dNZzl5ZzRERUNiK09ZU2ZX?=
 =?utf-8?B?cDRGQWppaVhTS3dhYVF5TG1tN1lFVEMwOWpUV0RkeGxNOUUyaDlPMURpcVFj?=
 =?utf-8?B?Nng4ZDh5R0RkelRMclR3SUJZeE5qbi9iaUJnNU95ZzZIaVo3c0gvYzRvU0xi?=
 =?utf-8?B?Y0F1dGtkNUVEUjQzd3FlbDBPME5ubEFIb3BsOXc1dmpIZnBqNHJGYyswUk9Y?=
 =?utf-8?Q?LGvKPBIj+tCGEfkA=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gkUXU1dXCqFvVoRIFvyyfooV"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a2ce3f-e634-442f-aba9-08de6d4a4058
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 10:58:00.7152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGrF7viRfEp582VOMvTNiiUSoCnjPfwTyKYOJpFjYEEDCM1Csn+e8hg2USDl3xyw2rxuaER8eUkKS3T1ytnfLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6502
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MiBTYWx0ZWRfX4B79GmJu6jCI
 ZekEaiEAi5bLUB8fomzJLOBoZOH4dlNPPjkQJqCaNJ+3gF8+3XIQOVx45xhTEsgbSUYAdgQ70pl
 8px+8EekqChyny6OgONk9/2y9h+kO5WNaeWBOVIKfh9R8GLTLyEXc/Dk7bpkZoT8z/zbkNLaK8o
 d+/Gs0qrkuvwyFBTGAbadsojQZgCAO9B4CHLO8VN4NbhWqjYYfEglzqcp2IuSXgc1cGfxKMkMEE
 4igngO0qBInib41hF2HrqfZsrOUezJaU4JLJcMZcVG9/o66tay/V7G0MegOPrqcRRrT6C2AtW5y
 vCk94rY9d+tSv8JMavMAvvP3ve6YAyOKP23hb3zQGXAPnkAf/dCOVdUjsyukddbk24hQWB4hHKn
 1NLXF43725X/bdDzPkMhGZ3du9H5rT5qk0DWcAM+nGESXLXw1J2V5jpKGsLHqoCYKnp+yiqDMkd
 SfYgg8q8e+ac60oqBSA==
X-Authority-Analysis: v=2.4 cv=aepsXBot c=1 sm=1 tr=0 ts=6992f83b cx=c_pps
 a=68sIzm80yF4rXXtTcQvumg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=b3CbU_ItAAAA:8 a=lAgNKBcoAAAA:8
 a=r_1tXGB3AAAA:8 a=pGLkceISAAAA:8 a=F7Ew1mTMIhj7kP65DOYA:9 a=QEXdDO2ut3YA:10
 a=oMU28xtpuFFeHnx8mBIA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=drE6d5tx1tjNRBs8zHOc:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: FL0LGOnTwWPKZnRi54kItyn-J0nsO_O6
X-Proofpoint-ORIG-GUID: FL0LGOnTwWPKZnRi54kItyn-J0nsO_O6
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
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:geert@linux-m68k.org,m:marek.vasut@mailbox.org,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[mailbox.org,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[IMGTecCRM.onmicrosoft.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,leemhuis.info:email]
X-Rspamd-Queue-Id: 12DCF142945
X-Rspamd-Action: no action

--------------gkUXU1dXCqFvVoRIFvyyfooV
Content-Type: multipart/mixed; boundary="------------ohtLvVS09yN9tXHnlRpWPsbv";
 protected-headers="v1"
Message-ID: <21b1fd77-252e-4fb3-aa65-1c26043c5412@imgtec.com>
Date: Mon, 16 Feb 2026 10:58:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org>
 <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
 <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
 <1e8e416e-e474-4288-9686-1ba2b88e4946@leemhuis.info>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <1e8e416e-e474-4288-9686-1ba2b88e4946@leemhuis.info>

--------------ohtLvVS09yN9tXHnlRpWPsbv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16/02/2026 10:11, Thorsten Leemhuis wrote:
> [top-posting to make sure everybody is aware that involving Linus for a=

> judgement call is on the table]
>=20
> Geert: Many thx for the clarification. In that case:
>=20
> Geert or Marek: could one of you two please submit a revert for
> 330e76d3169721 ("drm/imagination: Add power domain control") [v6.16-rc1=
]?
>=20
> With a bit of luck the responsible drm maintainers will pick it up
> quickly -- or it might lead to a different solution for the problem. If=

> neither happens within a few days, I'll point Linus to this thread and
> the revert. Then he can make the judgement call if he wants to.

Hi all,

Apologies for not replying to this sooner, but please see some thoughts
below on various parts of this discussion.

We're currently trying to force this issue to reproduce on hardware we
have on hand; we'd like to see it fixed properly as much as anyone.

>=20
> Ciao, Thorsten
>=20
> On 2/16/26 10:00, Geert Uytterhoeven wrote:
>> On Sat, 14 Feb 2026 at 13:38, Thorsten Leemhuis
>> <regressions@leemhuis.info> wrote:
>>> On 2/13/26 23:52, Marek Vasut wrote:
>>>> On 2/12/26 4:56 PM, Thorsten Leemhuis wrote:
>>>>> On 2/12/26 15:38, Marek Vasut wrote:
>>>>>> On 2/12/26 10:00 AM, Matt Coster wrote:
>>>>>>> On 11/02/2026 19:17, Marek Vasut wrote:
>>>>>>>> On 1/23/26 2:50 PM, Geert Uytterhoeven wrote:
>>>>>>>>> On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.c=
om>
>>>>>>>>> wrote:
>>>>>>>>>> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
>>>>>>>>>>> Call the dev_pm_domain_attach_list() and
>>>>>>>>>>> dev_pm_domain_detach_list()
>>>>>>>>>>> helpers instead of open-coding multi PM Domain handling.
>>>>>>>>>>>
>>>>>>>>>>> This changes behavior slightly:
>>>>>>>>>>>      - The new handling is also applied in case of a single P=
M
>>>>>>>>>>> Domain,
>>>>>>>>>>>      - PM Domains are now referred to by index instead of by
>>>>>>>>>>> name, but
>>>>>>>>>>>        "make dtbs_check" enforces the actual naming and order=
ing
>>>>>>>>>>> anyway,
>>>>>>>>>>>      - There are no longer device links created between virtu=
al
>>>>>>>>>>> domain
>>>>>>>>>>>        devices, only between virtual devices and the parent d=
evice.
>>>>>>>>>>
>>>>>>>>>> We still need this guarantee, both at start and end of day. In=
 the
>>>>>>>>>> current implementation dev_pm_domain_attach_list() iterates
>>>>>>>>>> forwards,
>>>>>>>>>> but so does dev_pm_domain_detach_list(). Even if we changed th=
at,
>>>>>>>>>> I'd
>>>>>>>>>> prefer not to rely on the implementation details when we can
>>>>>>>>>> declare the
>>>>>>>>>> dependencies explicitly.
>>>>>>>>>
>>>>>>>>> Note that on R-Car, the PM Domains are nested (see e.g.
>>>>>>>>> r8a7795_areas[]),
>>>>>>>>> so they are always (un)powered in the correct order.  But that =
may
>>>>>>>>> not
>>>>>>>>> be the case in the integration on other SoCs.
>>>>>>>>>
>>>>>>>>>> We had/have a patch (attached) kicking around internally to us=
e the
>>>>>>>>>> *_list() functions but keep the inter-domain links in place; i=
t got
>>>>>>>>>> held
>>>>>>>>>> up by discussions as to whether we actually need those depende=
ncies
>>>>>>>>>> for
>>>>>>>>>> the hardware to behave correctly. Your patch spurred me to run=

>>>>>>>>>> around
>>>>>>>>>> the office and nag people a bit, and it seems we really do nee=
d to
>>>>>>>>>> care
>>>>>>>>>> about the ordering.
>>>>>>>>>
>>>>>>>>> OK.
>>>>>>>>>
>>>>>>>>>> Can you add the links back in for a V2 or I can properly send =
the
>>>>>>>>>> attached patch instead, I don't mind either way.
>>>>>>>>>
>>>>>>>>> Please move forward with your patch, you are the expert.
>>>>>>>>> I prefer not to be blamed for any breakage ;-)
>>>>>>>>
>>>>>>>> Has there been any progress on fixing this kernel crash ?
>>>>>>>>
>>>>>>>> There are already two proposed solutions, but no fix is upstream=
=2E
>>>>>>>
>>>>>>> Yes and no. Our patch to use dev_pm_domain_attach_list() has land=
ed in
>>>>>>> drm-misc-next as commit e19cc5ab347e3 ("drm/imagination: Use>>
>>>>>>> dev_pm_domain_attach_list()"), but this does not fix the underlyi=
ng
>>>>>>> issue of missing synchronization in the PM core[1] is still unres=
olved
>>>>>>> as far as I'm aware.
>>>>>>
>>>>>> OK, but the pvr driver can currently easily crash the kernel on bo=
ot if
>>>>>> firmware is missing, so that should be fixed soon, right ?
>>>>>
>>>>> Well, drm-misc-next afaik means that the above mentioned fix would =
only
>>>>> be merged in 7.1, which is ~4 months away, which is not really "soo=
n"
>>>>> I'd say. Or did I misjudge this?

The above isn't really a "fix" per se, it's just an enhancement. The
underlying crash can still happen. We could still pick it into
drm-misc-fixes and have it in the next -rc plus backported to stable,
but I'm not sure I see the value.

>>>>
>>>> The PM domain issue here crashes the kernel, so I think this would b=
e
>>>> material for drm-misc-fixes .
>>>
>>> Yeah, sounds a lot like it.
>>>
>>>>>> I added the regressions list onto CC, because this seems like a pr=
oblem
>>>>>> worth tracking.
>>>>>
>>>>> Noticed that and wondered what change caused the regression.

=46rom our side at least, I don't believe this is a regression at all. We=

haven't been able to reproduce this issue on any of the platforms we
have available (although we did stumble on a somewhat related bugfix
while trying).

>>>>
>>>> I think this one:
>>>>
>>>> 330e76d31697 ("drm/imagination: Add power domain control")

This commit added support for multiple power domains on Imagination GPUs
in essentially the same manner as other drivers (as mentioned by Geert
below). Nothing in there is specific to the Renesas platforms where this
bug can be produces and it is required to support other fully-functional
platforms such as TI AM68.

>>>
>>> Thx; FWIW, that was merged for v6.16-rc1.
>>>
>>>>> Did not
>>>>> find a answer in a quick search on lore[1]. Because if it's a
>>>>> regression, we maybe should just revert the culprit for now accordi=
ng to
>>>>> Linus:
>>>>> https://lore.kernel.org/lkml/CAHk-=3Dwi86AosXs66-=20
>>>>> yi54+mpQjPu0upxB8ZAfG+LsMyJmcuMSA@mail.gmail.com/
>>>>>
>>>>> [1] I guess this was the initial report from Geert?
>>>>> https://lore.kernel.org/all/=20
>>>>> CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com/=

>>>>
>>>> It is.
>>>>
>>>> I think there are other SoCs which depend on the power domain commit=
, so
>>>> revert is not so clear cut anymore.
>>>
>>> Well, it's a judgement call. 330e76d31697 was merged less then a year=

>>> ago, so I'd not be surprised at all if Linus would revert it in a cas=
e
>>> like this. But it seems it doesn't revert clearly anymore, which
>>> complicates things.

Reverting this change feels backwards, we're saying that Imagination's
support for multiple power domains is broken because one platform has
issues when we attempt to control its power domains. I fully agree that
we should be working towards resolving this issue, but I don't agree
that ripping out this handling (that, again, is essentially the same as
handling in other GPU drivers) is a reasonable solution (even in the
short term).

As it currently stands, we're only declaring two GPUs as "fully
supported": AXE-1-16M and BXS-4-64 as made explicit in commit
1c21f240fbc1e ("drm/imagination: Warn or error on unsupported
hardware"). In order to reach the stage where that check occurs, the GPU
must be powered on so registers containing the GPU ID can be read.
However, the original error report happens long after this and would now
require the exp_hw_support module parameter to be set for this point to
be reached (as the driver would not attempt to initialise an
"unsupported" device without this explicit opt-in).

It's not currently clear to me whether the crash can be reproduced on
the affected Renesas platform without this opt-in; it's feasable that
this is the case but we know it occurs during an error unwind after
device firmware fails to initialise and the exp_hw_support check happens
much earlier than this.

Either way, we should consider adding additional "supported" checks
based on compatibile strings earlier during initialization to prevent
fundamental issues like this one from even being possible on unsupported
and/or unvalidated hardware.

All that being said, ripping out power domain handling will completely
break one of the only two platforms we currently fully support: BXS-4-64
which also has two power domains and is present in several TI SoCs (and
their DTs).

>>>
>>>> But SoCs which have hierarchical
>>>> power domains and which manage to probe this driver without having a=

>>>> firmware available for the GPU will simply end with crashed kernel,
>>>> which is really not good.
>>>
>>> Does the patch Matt mentioned fix the crash? His "this does not fix t=
he
>>> underlying issue [...]" (see quote earlier) makes it sound like the
>>> crash or some other problem (theoretical or practical? regression or
>>> not?) remains. If that's the case and no quick fix in sight I guess i=
t
>>> would be best if someone affected could post a revert and then we can=

>>> ask Linus if he wants to pick it up.

The patch I posted (and applied) is somewhat orthogonal to the issue at
hand. Geert originally suggested using the _attach_list() helper as a
way to mitigate the issue, and we agree that it's a reasonable cleanup
effort to make use of it, but I believe the "fix" in the originally
proposed patch came from removing the device links that are required on
our platform to ensure the GPU power domains come up (and down) in the
correct sequence.

>>
>> I don't think that patch would fix the crash.  The Adreno and Panfrost=

>> GPU drivers do similar things (explicit multi-PM Domain handling),
>> so I am wondering if the issue can be triggered with them too (e.g. on=

>> unbind).

My current understanding of the situation is that the fix proposed by
Marek in the Reneasas driver[2] works, but is not suitable since
pm_runtime_barrier() should be inserted by the caller, not the power
driver. But it seems that's not always possible (particularly when using
devm), so I don't really understand where we go from here. I still don't
see anything we're doing substantially differently (before or after the
commit I mentioned above) from anybody else.

Cheers,
Matt

[2]: https://lore.kernel.org/r/0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailb=
ox.org/

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------ohtLvVS09yN9tXHnlRpWPsbv--

--------------gkUXU1dXCqFvVoRIFvyyfooV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaZL4OAUDAAAAAAAKCRB5vBnz2d5qsNRL
AQCzxJv1LD5EbWhjEL4YTL+HAzmY/MZAMJOkr384DWUVUwD+P6uX9C0kEXDE8zkS3gF6chNjrUqf
8KKNLZKEsG4Kww4=
=sACb
-----END PGP SIGNATURE-----

--------------gkUXU1dXCqFvVoRIFvyyfooV--
