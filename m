Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAugCxArr2mzOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:18:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC63240C68
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A12610E598;
	Mon,  9 Mar 2026 20:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DU/6AcH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011038.outbound.protection.outlook.com [52.101.57.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF1910E598;
 Mon,  9 Mar 2026 20:18:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/O1w9DlO6V0FEZYtTW3KLokQRjLAVK+Ok24FpJPovt03Q7VIf6AmFnER8GwtJI83VPpAjCygWsXjBRoznyGQkaJrzwmS/mnRwGReAx59VC5G5gtRcdL7xsgMlylVk907HfVJmRSt6xkZvohrGbYMZKiAzKlV8ebhN/9gL6t49rcgWUd6CSLKtjjpf7GWrRUpGrzoaTjYcb5t28/wAUKiAy3/SrOuXeG8avKH43j9qKtrIQsvJHQCB7hjAd+IusZbWddnpV93/QkRHdF8J5MFkGCLhlDIFG57V7PnHvuWUMDxr8TKLEyh0Zjd52PI5BrmN6jv/BSjTWkjjuO/q0E6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YwDFS7s4LnYzENGU6ejo81g4HBQodskUVHGmpdjyWI=;
 b=P4Vhdqz7O4JLRpSdJeyh8dQ08uP2h+zT56kaF3HmnMEspCoREmuACfTUQcttVmvWThFpB89oYCKaCzo2bVnrNGjtuCJmvilgECo6tvsVDM6X/bEXYrp0fmoLIBawjJz+L15THfpri9qLzT3Cmx8Hb1G9zLGu8uEOM/ed2Qf7+HRZkLoEZe4xKjs/W2IDrQHDZGDJm0+g8njl/unM3J1jARrh+fPtf1PF5FnEjXI6pd/VNyx+hSy+P2pBgJk9JPy7UyVpe6aWnKZVUusebKbAS0VcDf0105oJgooG03D5VhL7hGlN9wsSqfPWIPBIf4QnruNMndYxiECBTuNMljfggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YwDFS7s4LnYzENGU6ejo81g4HBQodskUVHGmpdjyWI=;
 b=DU/6AcH0GnH5vi4XgAANQfkBQfYvxbsdGAjBELR8xxTvDX2HblglOBT1i3KQ7xg0OFZPeK6JsLAsJ2UEQ2lv0dAHohzIbiDgcR+olLClr0eIm2RHuTO+9BX9icS1BKUbfDMQyqUGDL168ROzJfExOkqGEgMcG+Tw+yW7djTxprYunB+DFUa2vwfIhSgkE9kFelbjLfBXQ0/0lbfgwHesgAWXyQ+PVbKtXAT8T7urcktaxQtVZxSmv7ICjumg4nhy20WDWErbhfkOB1oPbhQWuOhWkgWd3P+Goz2Fzr25YSqFkmwfhDIH4oAOzEM38lYWs9CBt7iGAj/+8Xgtq8tA6A==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by PH7PR12MB7988.namprd12.prod.outlook.com (2603:10b6:510:26a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 20:18:13 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 20:18:13 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ewan.chorynski@ik.me" <ewan.chorynski@ik.me>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, John Hubbard <jhubbard@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>
CC: Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v11 00/12] gpu: nova-core: add Turing support
Thread-Index: AQHcrSUU5EX/S9sMckG758uYAhOBAbWmoSaAgAAEZACAAAPgAA==
Date: Mon, 9 Mar 2026 20:18:13 +0000
Message-ID: <864ab8a502db872468d7b01e0adfff386d2187cc.camel@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
 <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
In-Reply-To: <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|PH7PR12MB7988:EE_
x-ms-office365-filtering-correlation-id: 13bec65c-4558-4392-5348-08de7e18fdb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: YsC/nC1wGVxVvwnVEmoSEZdFjxll5ik/ezS0yfshepEQag4+XaZPHBV6Twhi2eyc3KZj4Wsy/iBe6bODJnkamNEjN6L9yMSVfp3wJjVq0O1FZgwzpVVKVpBaz5ong+sunnAztuRpBZI8vWKBQlS2j2ggifzJJxKsQWqYLLVPvIFg2tKmq2AP27eudmnN/zu1HitvK2XbWW5WL0EUpgS9wG6XL7ojuVIERvII0PzreDjPwL+686oa9aSHxM1177lXvahquM3CLMAh3Hy6SUzRAxjkBzo2fyBxU+aTALabducxbHgCpYDm+qwLbJB6Ch3d7wRsWpkbzRC+nM5KHmy9ANsVZC7LKq0mxantSRqVdXXOyQuBbBrR/rVjgFGLn8AQgGVJiur6qOggFMAVSgjR1W1XyQMf54I6Lf5d2JFNJXZdlDYw4achzJEUvGlKJQN4zBqENeGU8tdDixUQUbWnunHFmPu07ELX48dQyfIMlu/INTbzAFsV+gWz8zTmTLCaTVpS1XecqLlEF62g1r4E0d5bbiOsMFd4r7pXN9S2rkVzqYHbH3kLXYk72tbnyP2AVIAo1msVs6A2VBqiApB2pHCqw45ly7+bgzKMGk3jECeBvw3KpS7cKwJYFeVjTN4UCBYbMWN6Nr1ClQ64eEIF6dR4hwLvDGEa+iffe8lsIBkDz8h93oid5bMOvIcXqDLfEJ4Q543c/VDExV23ajYExT/AMuHkk/pE0fu1kUD+GnjXPOkYA+L7M8IN34gz7YY3DFMeb2WnYQH8iD2U4ui75W8y1hrfTYTFF5OQqPjQNoE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR12MB9815.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUUrS205M2lCMC9IaHgwZDBtSm1pd0xuMjNLbDJxbFg2bCtFQ3YzVGdyTzkw?=
 =?utf-8?B?NzFzL3h1UWZoM1k4OU42ZHNxQVRBaitGQk01ejc4eFhpVzI4THVkVXRUY01N?=
 =?utf-8?B?TVVmYmIraEx1eUVRTWFrY2F5RGM1ZThQY2lKRWhiRkpqTGFaaVlWOHFCYWkv?=
 =?utf-8?B?TFA4bGtpSEQ2V00vTlJqWGU0QUZzUjVINnJWYmRId0RZeWtTek9pYmxLRmxv?=
 =?utf-8?B?Mi9EVlF5UTRZL1NTcGpiQzJqTWtOUFk4RkNvQ21EYmcweVZyNmhRSUNRU1Fr?=
 =?utf-8?B?b2oyVzFRaG42OXhsTnc2SFlqSmhJOUp6MjMwRTJVajJoT3kzQVNHb0tsWS9O?=
 =?utf-8?B?ZzFZbmFSUWVLUm8wU2lqM0NFb011Z1FZaGhGVkdsczM5R1U4N1FKRnVnQ2Ru?=
 =?utf-8?B?cWpYY04reGRSR0llYWQzcTN2M3AxbGVXU3FyRjR1MW5Cd1RObHNGdG5JS1Zw?=
 =?utf-8?B?Y0RyeHg2NVFJVE04Nkw0eElrRk1uT0dCbWZjZWk5MDk3ZDBqYVRtMjlwNUpo?=
 =?utf-8?B?b2xmYjMzcHlFWGhwRGppMDRzeGM2M3docmlkWjRCenNHeUlyc2hESnhDazJx?=
 =?utf-8?B?T2I1UlNNSXk0dVpBekU0d1VFek1vQzZyRHBqZjlIeEdxcG13OG5mZ0RUN3Zw?=
 =?utf-8?B?ZWdlVUdhQWJRQlRBbFFSVFFSZ2htc3djSjBZbklwTHRubnYycUNiTUtzRWtZ?=
 =?utf-8?B?U2NGT0lIaXJIYzFteTN0amVYcWM5d0w5Q3NYcm9ZcFV6R1J5NTA1L0pJTldy?=
 =?utf-8?B?NFZDSDNJSkY1ODZ4QTR5dE8zK1dPbWxUSncrU2V6MzF6T0FWbm1NSmQyK05k?=
 =?utf-8?B?OTFDSHBmSVhKUjhuTkVMT1Z1bFZrRlJOQ213cjJQbEpLK1VsY2lwbzdaN0Er?=
 =?utf-8?B?aGFGci9CS0tVdWY4L0E4cHVMcmhPK3oxMC9hL2gzcnJ3VU4yeGVOQXpTZzJ1?=
 =?utf-8?B?VHpJMkxmYzQxaUJyRGNvT1pLYVNKTm80VTF3ZHUwQURJM3NrYktUVkxkck95?=
 =?utf-8?B?ZXhTTlZTazBGdzZSa1lYamxXcnl3KzI3SDVxblN1Q29VNFJPRFRTNUI4c0FT?=
 =?utf-8?B?eVlXZjBwMVhKMERuZDUxbWZ5b0RSUjhDZmF5dWNkcDArK3ZnSE5yenFRMjlV?=
 =?utf-8?B?emRSUWJacm1UUmZyODk3czBGRWVtamtQZ0YrYmVOR1VVQ3FzTXcvdzkvTjVr?=
 =?utf-8?B?RitnN2lBaThkeUtUWnZQa2VDeXlGUzJYSWxxeE9XaFhpbnpDaG11SlRoLzBB?=
 =?utf-8?B?SENZT25XYWoxTFMxRlJoODJ6L0szT2lVV0oxYXBmbytSSGFOUmJSSjQvKzJm?=
 =?utf-8?B?cUlSSEkrL09SaGV4YkNCWnlQN0xyRkx2U1lVWExCVldkWURNakM0NFRUeU5R?=
 =?utf-8?B?Szk2TFQ0a0VESXp5enlabEVGUzh6aEVHRzVOTHFYZnRLdXcyd2N0MzdLK0p3?=
 =?utf-8?B?UkJMc05CWG9teDVQOUxEd2xBN0RkQWZORWVsUk01VXJSVzVUQktBNjV0S21U?=
 =?utf-8?B?dGh5ODJIaFBuWVdWWTdzdTJrM1F2a01uWmhwNllVY1JaVUJGTk1xNzZJeFhU?=
 =?utf-8?B?Mk5wWXpmMzhUYVhZSGk0WEhKQUFQVjlPN2c5cEJJbFh1RlpUZWhUcXI1MmdZ?=
 =?utf-8?B?bThCQ0M2WHh4U1JWMmlNWmlvWFErTXRnWDJtRE5wMHowdlZTMU5FTXRVeDZt?=
 =?utf-8?B?ZjluOFI0OGlMbndETERONlhBUmdkTC9pWm1KUjZYb2dSVTcyZzlEVDB6U2Q0?=
 =?utf-8?B?WXhiR2w1RTRvR21CQ1phNmFFZzJiTGtmQUxGS0h2b1RZY01UemwyT0VMb0tj?=
 =?utf-8?B?VGtuZlNvMlB1bmp2b0lTeElhdFZKWWV2ZzZrNnM4UlhUL3ZEWUJ5dEVOS1I4?=
 =?utf-8?B?THVxQktEVHdTeHhaUFk0d3YvTHFiZGpNZ1Y1U3FEK0xjZ0RMWDBMUGw4MGkv?=
 =?utf-8?B?blpPTlRJck4zemJnVHp3NjY0cWJ6MEtRbVRJbzRiTjV0UGdVYmdPMkZqcFlW?=
 =?utf-8?B?aTU1bmZ4bGwwazl1NEl2UTloZmxqNko1QW5CUTFCWUkrRnZGZ2djU3RZcWpP?=
 =?utf-8?B?amtPVFM2Nnlkemo2WUJOL2k4eUZoQXc0T3ZPWHNMSzd4ajBXVllza2RjRGMy?=
 =?utf-8?B?Q3ZWT1NnZ0ppVnNNaXNZbDFSNHdVRGtKakQwcmFFVytmSjUrSy9ib09CRDE5?=
 =?utf-8?B?S2dhYmpPUCtZSDUzL1prN3FQeUJ4WER2MDFjUjFWbldaQ2dYY3FYZFhWS1pZ?=
 =?utf-8?B?WGJBY1RVM2xjckkwQlZ5REFGRHg5N2VmelVZOGs3MGdiV25KVzRHelQ4RFky?=
 =?utf-8?B?QkdvVXBHNHNsSGcydXVFT0k1K1ZBQTRkTjl0VXlDRE11cGxmV0dCdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <694F1DEDBD720D47A26876FAC086FFD5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bec65c-4558-4392-5348-08de7e18fdb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 20:18:13.3481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ca825hj5NIxm+twfcfF3ILOn2C2c3Pn87aPtZ2uTyluugk0rh6HYbwe6wUnf52fq+5vJ5IBtQAlxAwrSwiOMow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7988
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
X-Rspamd-Queue-Id: 8CC63240C68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[ik.me,nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ttabi@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Action: no action

T24gTW9uLCAyMDI2LTAzLTA5IGF0IDEzOjA0IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IA0KPiBJIGhhdmUgdGhhdCBleGFjdCBjYXJkIGF2YWlsYWJsZSwgc28gSSdsbCBnaXZlIHRoaXMg
YSBxdWljayB0ZXN0IGFuZCBzZWUNCj4gd2hhdCdzIG1pc3Npbmcgb3Igd3JvbmcsIG5vdyB0aGF0
IEFsZXggaGFzIHB1c2hlZCB0aGUgZW50aXJlIFR1cmluZyBzdXBwb3J0DQo+IHNldCB1cCB0byBk
cm0tcnVzdC1uZXh0Lg0KDQpUaGUgVFUxMTcgaXMgdGVjaG5pY2FsbHkgYSBtb2JpbGUgY2hpcCwg
YW5kIGl0cyBWQklPUyBpcyBkaWZmZXJlbnQuICBNeSBpbml0aWFsIHZlcnNpb24gb2YgdGhlDQpU
dXJpbmcgcGF0Y2hlcyB3b3VsZCAiaWdub3JlIiB0aGUgcHJvYmxlbWF0aWMgVkJJT1Mgc2VjdGlv
bnMsIHNvIHBlcmhhcHMgdGhpcyBjaGFuZ2VkLg0KDQo+IA0KPiA+IA0KPiA+IEhvd2V2ZXIgbm91
dmVhdSBkb2VzIG5vdCBwcm9iZSBlaXRoZXIgd2l0aCB0aGlzIGZpcm13YXJlIHNvIHRoYXQncyBu
b3QNCj4gPiByZWFsbHkgdGhpcyBwYXRjaHNldCBmYXVsdC4NCg0KTm93ICp0aGF0KiBpcyBpbnRl
cmVzdGluZy4gIE5vdXZlYXUgZG9lcyBnZW5lcmFsbHkgd29yayBvbiBUVTExN3MuDQoNCg==
