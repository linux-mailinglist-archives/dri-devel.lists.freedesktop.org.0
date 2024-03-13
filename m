Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946087BA21
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 10:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328E610EABC;
	Thu, 14 Mar 2024 09:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.b="SHW+ImA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2027 seconds by postgrey-1.36 at gabe;
 Wed, 13 Mar 2024 15:05:57 UTC
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com
 [67.231.148.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD50D10E77A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 15:05:57 +0000 (UTC)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42D9Wp12022169; Wed, 13 Mar 2024 07:31:45 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3wu9kvryrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 07:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqStDQ2YZsSI/d3yJEViJ2DcmzkNjq8qo94dmnYYgdwRXEgxGYKHE7nj+VeW08LM4T/TdouL6RzkRWqXzxlDKC9cNbt0k2CCAlrGaFWNytOx5lh8/jyMPbjPWVczSvx/9HGUwMmTI8RC7LMgg1YEA5+44I0jaGuwlUX1nj6/qLtSuhFcUpmkIqbB/4TcQqqaIqM7TUdGOMnxMhBG8WEmnOqd4FLcOn/tPcv3Ehv58lQdQCJllmS2uQLav9VwSMEPhMjMZB+CeDvt7c1sNz6Z0AwRaVdp5IOw81TOPSCdrBwvPKEK9aBNQ4Q/c9W2GG544pNm1Pi6wsruxPHO9+HdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAizzBOSK/PbJE5Exxlm82MvPCY5wY330AQu+xLS1/8=;
 b=AX128jQWnvN/D94SC0kxm3+nrMVQDxvljEQdzWaB7TdEoefDeVwD0SixlM5ZUlH9NZaQ3OfWh2ONLHEYbD0wZ8y9GgMK4nnyl59+zYyjKUraya/xVJbv7b+iqVONpwgVilKgShY0NM4VqvRzBOck0RjVGU30SucW4o4Uvf0zkjULx+xGm04FRCwq+MCt/JS9ei+upkVSyvLIWrU+83avHuO4agnslCG3495hPe9sqN+T+2/NlTX+S3ndubqneIcYRw5QaAKsYCL8HKCr86OCXBvX9iO407/78BhfOaXX/Qjo47S/56K/4YuJ1LiP/pvpzLMBKufqQTQNSDP6Fg8aLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAizzBOSK/PbJE5Exxlm82MvPCY5wY330AQu+xLS1/8=;
 b=SHW+ImA9itgXh8ZBevavPfC9rfvEkjmf0DfO+7shzAYp0SzH/HgotOwXVWktoU7qmM9IM7j0WUzLoweuR+hfXCQxhltHM78B83vrUxzEJ6XmTJnzBtkivSNiNcX8JAs//ZK3o7k89xM3rEtl9inBQkq9Z4IbRHsJUKMpLS85NXo=
Received: from MWHPR1801MB1918.namprd18.prod.outlook.com
 (2603:10b6:301:68::33) by CH0PR18MB5462.namprd18.prod.outlook.com
 (2603:10b6:610:18a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Wed, 13 Mar
 2024 14:31:40 +0000
Received: from MWHPR1801MB1918.namprd18.prod.outlook.com
 ([fe80::89ce:35b4:c4b0:c7ad]) by MWHPR1801MB1918.namprd18.prod.outlook.com
 ([fe80::89ce:35b4:c4b0:c7ad%7]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 14:31:40 +0000
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Julien Panis <jpanis@baylibre.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>
Subject: RE: [EXTERNAL] Re: [PATCH v4 0/3] Add minimal XDP support to TI AM65
 CPSW Ethernet driver
Thread-Topic: [EXTERNAL] Re: [PATCH v4 0/3] Add minimal XDP support to TI AM65
 CPSW Ethernet driver
Thread-Index: AQHadU9EQY6GfzAByE+v8oaSrvH1VrE1u2LA
Date: Wed, 13 Mar 2024 14:31:40 +0000
Message-ID: <MWHPR1801MB19184E6AFDEAF4062FB1C4B3D32A2@MWHPR1801MB1918.namprd18.prod.outlook.com>
References: <20240223-am65-cpsw-xdp-basic-v4-0-38361a63a48b@baylibre.com>
 <20240313134441.GA1263398@maili.marvell.com>
 <9016930f-d90b-4a7a-b6fb-80cf56a94bd8@baylibre.com>
In-Reply-To: <9016930f-d90b-4a7a-b6fb-80cf56a94bd8@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR1801MB1918:EE_|CH0PR18MB5462:EE_
x-ms-office365-filtering-correlation-id: 6c6935c3-dd3c-45cc-300e-08dc436a4c42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4OMfMy5GZYdjGzi7q1gkkFxdqwB+WGzMdDeg2am09Aux7RmjNMEFVyQk7p9kxZM/uv9rjnoySPQ4o6jR4CWIlkllQVsJYi1UJll0yUABpsWBrGxNpfDxtYt6I7vVqsvk9IBbFzOSIcZi7MbkqXtZW+oLKWfXSZZKYs+bSP+FEkIzAeBAPDtfzN0JYqNzrWMI7Zd0ngPWTF0Bh1w6u/PoeBvFm3tLb3fiaaUC/BRRa22O+ENa4wdRwxTicaosRhxYamYmKLAQMhF0Qn8lzyFzFjoaiWhHExC3Fl2ioqS+eWA2uA42bHIouicgxBRiKVk2zuT+zAH9w/YXbZ0cN9e6W6y72TcNf1bdGjVZW+piFGwZm3iu4pZ7cVu/kiJQtb/gkH+qfIidpUI59aeNsUTwR+0PR6RjzwO7GtGYt00GRLrx56U5cckVdsPfEc19kk+WapR7s0BlSnTqIBa9xyK+im1sWkdCCle3/4kU+KHhw1r9VZBgTIhGwqQxFcXvH1injeO8xz8xIY29SHlvV9texYY12lgZKos3Nz/++/GgyOC8Iae1hjPLeLc6TO2YMykQ08DRJ+RPgbiYmT3lfWR+/yVRc/5LcMiPUIWnnaVlclyk5y8wiz+o0EDmZahTo+H5n4xbZMO68d6x5HUfJmPFmsdP939q8iGRi4XkGb5pL1s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1801MB1918.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTRobE0rc2lCMU5nK0g1aG1kZ3dMZGdPcDNrYVlMZTNlOGtDQWtjS2VaRDlE?=
 =?utf-8?B?OTBUckt3UzI5WjJ6a2xHTkRxWVYvVkk2bjM2RkNhQ0E2TGJja1V4cnJnREFx?=
 =?utf-8?B?djJxSXpDaVZKVVNsdkJ3MVZjK1VvWXdPQVY1NVpCSkZLM0loOC9uU2c1VW1r?=
 =?utf-8?B?VXZ0REhCaEtaSDBOdlF4MFpSY0hOSTZkRGhBNlh2RGMvVm41dnlDMGZQdFhV?=
 =?utf-8?B?akRFYStlSUFiY2xjOWNpOVdHWmhlZWlubXFNZU0zSWtLWTVvcUpEY3B4WEIw?=
 =?utf-8?B?cHNQNklsc0F0MVB4eVQ1cjNkaFREUlB1cWM0d3I2WDJYSHpDRkx6U25YaXdk?=
 =?utf-8?B?cHQ5ZHpPZXZVNmtKVG9VczBlZ3BxZm9CVzJ4bXQ0QlZmanphdTRtQ1FJVUht?=
 =?utf-8?B?eXB4dnZKWTNTRk5WdVliNEJlYlQrSVRUdVExRXVITWR4NU15emY4VEZuQnVH?=
 =?utf-8?B?YXkvV0l1L2JGejJYViszVmpJM3FnNFJRRlpXNjg4OXlrMDNSUGNMaVc1Qjhv?=
 =?utf-8?B?M1Axb3Z4WVVVOGo2eCtJYXRFNjdrOUFNaEQvRXhFTFJ2QjZpZ2tOTGJFY21l?=
 =?utf-8?B?dmxRY0ZBUUswRm1uMGFaQXcyRVB4Q1pLUWtRODdkNklXWFV3NDdRZWxqUGV1?=
 =?utf-8?B?dHk3OUJzK3dURE5qQmxkeDI0ay8zWi8vdWJzNDRDS04wMVJqMyt5UFVRNkVt?=
 =?utf-8?B?L1pLY1pHM1R6SEJHTTlTb1BIUnR2dmp3WThiMHh3R1J2WTZubXBHL09GQTdy?=
 =?utf-8?B?d1hxSGwyczNHKzBVSWVrMzY1dVozNFQvckdhOU1mVDMycmEwWW84NmtmZEcz?=
 =?utf-8?B?bjRkZ0QzMVBmeHc3OWhyZDRmNVlQampuTnVmcGpPQUQvL0JPbXl3WXRwYVhs?=
 =?utf-8?B?cG13R010RUNwTmdsem5VR0xIdWZUc0lzZUY1b3FEZTZNdmxCTXFoSGtJYUd6?=
 =?utf-8?B?dG9OaytHNUREV29YRjFLQmhZL3RTcXdhTDhNYlAzMlhCenN5eXRXYVJUU3Fu?=
 =?utf-8?B?THpQdjJMa0pqZHg0NkVwRjJObmhJbXQ0cGdoajdnbVg3OS9aVFZFa2U0L214?=
 =?utf-8?B?aCtnTFlmZy9kNytra2NoOHhxa1FwQWFSUU1UZ2VMSGQ1SlV6MEovVXhSanc4?=
 =?utf-8?B?Y21MZTh6RHpYaitDdXZ0QTZJL2NZM2NOZi9mRHRlbDhEdmVzbUk2S1dFbE1m?=
 =?utf-8?B?V0l1UmhhSGI4b1JyQzkxcmlXYzlhdFpGeW5TZVROeE5TS3RIMXNoUFRhbWla?=
 =?utf-8?B?N1lQN2svMnc5N2JlSzBsMjVLY3NkRGYwcmxUeHhTQVhEdWZGS0JzUlQ4RGlF?=
 =?utf-8?B?WUxHZTU5aW9YNTBIWGpjaHNvSm9KZmxjbXlGNEE2MmN4UE5YRXpORXNzWTZG?=
 =?utf-8?B?alB4cFp2Y0ZacmZKOHdEQXNOUzNNRHplb0tJeVBJY3I1UTZ6dmY4REhhTmRo?=
 =?utf-8?B?b2tMRXN6bllQNEZkNzhJZEY4cTU0QVNtZzNqUkRyS2FwTnJKUm9Xd0lhV1Rn?=
 =?utf-8?B?Wjl5R1ZxOE9KT1FvTUp4aE1JRWNoc3dtS2l5dzZhR1hIRzJPVEY3OUFRbm1l?=
 =?utf-8?B?clFpVHphTXRuTkFyaFg5aklqZkM5eFkyR2FpaGNiYTVVVHRLU0VEY0czWU9v?=
 =?utf-8?B?OEJyWHA1c0FyWFduS0ZCZW1sTDMyVGJldXNUMDBodEg3aWxIV2NCamRrL3ky?=
 =?utf-8?B?Z0FBRWY1OGlnSEszZXp6QlVMWkZFcTdBSUQxL0J1b1ZTcG5kc1JEYnRoZmdK?=
 =?utf-8?B?SXNVd3JSckZlck9iNHVoVGhTbEkyQUg2eUgxZENHYXNpKzlleGo1bjdzRzhm?=
 =?utf-8?B?Wm9YRVArZTBwb1M2TE0vZXdLOTRGQ3BUR29oNnlBbUFmQ09QNlpXTy9Ub3lY?=
 =?utf-8?B?c1FsdTc4aUhXNzlobjh6eXczdjFOWG9uNXh5aVRYRFp2RTNuTi9jZi9ZaHRn?=
 =?utf-8?B?UFVWYXVHUnFSQk9OOFVUWEdzSHloRWVTYnV2WTg0LzZSRHFTM29idkMxdjF5?=
 =?utf-8?B?UlBZUzVsQnpjdFllMlJUSXVQVDU4bXVVQ0JQTHhDdExCMzFaRVNqbDNoV0t6?=
 =?utf-8?B?S01iSE9XMDRTT29XdldMbFdxUVd4SmFaSGFCRjRKWVJrdUlXRitwdXZFODhI?=
 =?utf-8?Q?qAY+CVARFZ5pVfAft0hfNcLtr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1801MB1918.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6935c3-dd3c-45cc-300e-08dc436a4c42
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 14:31:40.4515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKFEnSh+D/ZklC0CWrGvKVZ4UlFCPcTk2psIo4viS4gHhnfZm9T7r9IKx5Yp6dXuE4PBxpH415lSMKzFInapDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB5462
X-Proofpoint-GUID: 7ZxdJsZ2tODeqY2y9X2Iv0lWJIt2JRis
X-Proofpoint-ORIG-GUID: 7ZxdJsZ2tODeqY2y9X2Iv0lWJIt2JRis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_09,2024-03-12_01,2023-05-22_02
X-Mailman-Approved-At: Thu, 14 Mar 2024 09:14:26 +0000
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

PiBGcm9tOiBKdWxpZW4gUGFuaXMgPGpwYW5pc0BiYXlsaWJyZS5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTMsIDIwMjQgNzozNCBQTQ0KPiBPbiAzLzEzLzI0IDE0OjQ0LCBSYXRoZWVz
aCBLYW5ub3RoIHdyb3RlOg0KPiA+IE9uIDIwMjQtMDMtMTIgYXQgMTg6NTI6MzksIEp1bGllbiBQ
YW5pcyAoanBhbmlzQGJheWxpYnJlLmNvbSkgd3JvdGU6DQo+ID4+IFRoaXMgcGF0Y2ggYWRkcyBY
RFAgc3VwcG9ydCB0byBUSSBBTTY1IENQU1cgRXRoZXJuZXQgZHJpdmVyLg0KPiA+IGlzIHRoaXMg
YSBuZXQtbmV4dCBpdGVtID8NCj4gDQo+IEluaXRpYWxseSBJIHdvcmtlZCBvbiB0b3Agb2YgbWFp
bmxpbmUga2VybmVsIHY2LjgtcmMxLiBUaGVuLCBJIGFsc28gZW5zdXJlZCB0aGF0DQo+IHRoZSBz
ZXJpZXMgY291bGQgYmUgYXBwbGllZCBvbiB0b3Agb2YgbmV0LW5leHQvbWFpbi4NCj4gDQpQbGVh
c2UgcG9zdCB0byBuZXQtbmV4dCA7IG9uY2UgaXQgaXMgb3Blbg0KDQpodHRwczovL3BhdGNod29y
ay5ob3B0by5vcmcvbmV0LW5leHQuaHRtbA0K
