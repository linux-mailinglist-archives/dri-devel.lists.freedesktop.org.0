Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B3BE53C7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD4710EA72;
	Thu, 16 Oct 2025 19:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eJ3EeX8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792AA10EA6E;
 Thu, 16 Oct 2025 19:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmLGNQmTNpvHtQ2y0MvQRFSznT3Kl/16P41v4EgqRrxtYr0y7CIRArt0l4DXhZATo1uqlMsbFBrkeklY8nLCKYQgiiwQ2ig+NnMOWgBCX7DkYTMVrP53rkGC505lz3DORrGtjHMm84lGgYHAVKYF0iFVwfLo5tRKwd/lzc5336RCD9SIQCVvXA/AoLKFwZCoRIDAu+/+mAMmYUAR6WdNgJ5C2XOn/t9QmGbg630AH+p3JCwXeyKxQciZKazcKRgDapcksCmeSvSxdbM+O23rOyQUtj1voWxgw9bxOI1n4AWsLMCA1nw659DUykxVa5dDB4RVzRsMACYJ72Ywn7rTgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VY2RVI8EfT/NHlqb1ajrGTYycJTZPrjtM42wtlY77Q=;
 b=KDT04RPQOHn82ggguU+944Trl5+zyMo1biAUlmuJvPWfIVu/LpQV8vhS7mW7qq82tfpiXdE9hym7+DQxGHD0nywLkqty0xY/8PeATJVlGh6rwQb9QWXph7Uj6fsbMfmmP44qzM5IybSDBhwnM1FQjmXNkN+m4e3iyxgYHH+2es8A5hmBxbRtlNjO2imc6Z0gDooOHuuVFN7+qt0hd9r7OxV8mQSzFIFZfa3GTbSHWuoDaSnzEDg5l9JhLoHKfAB6ws1To25KYb39kS59YqeEC3mZ6DGtd2NNZhXLygTsezH0jyMb+/UmaEsJjPryStgaFdCZ+5qQGclgWY20wcix7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VY2RVI8EfT/NHlqb1ajrGTYycJTZPrjtM42wtlY77Q=;
 b=eJ3EeX8G/H1uhgPVPkwSFFYzz2pr6E+X7qa8uXYOTVcpDkqdG9M4MfQWqjmkKQKAMbl8DVR5rHYIV/NhDhQ4UuP27a1aRuGRiiCOaX9QaVbMsOktlgIypmxvIYRrU4QDladxiepZyHJbDWr6yu4sdHWybNLMCnWsFnxpApgPjgmqAdqucYh11cvuXXYiotxX3xk+T6RJjDaBcFTyyizRN7b7J0qKqgseS5WBGiUIkqW9lv9ifvs3C9gbeDE/ycXgaY/KcTfgxMgRBt8HG7FNr662eAHoESiQLIaYaR4GW3a1VVyRstI/h9T5oRItX4hvdfSA5a1u8c06YHuv0/bPsQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS5PPF5C0B6C3B6.namprd12.prod.outlook.com (2603:10b6:f:fc00::64e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 16 Oct
 2025 19:28:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 19:28:55 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard
 <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Edwin Peer
 <epeer@nvidia.com>
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move bitfield-specific
 code from register! into new macro
Thread-Topic: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move
 bitfield-specific code from register! into new macro
Thread-Index: AQHcPq9uIRJQMHT54kuQZ2/PdZxOLbTFDN2AgAAb/SA=
Date: Thu, 16 Oct 2025 19:28:55 +0000
Message-ID: <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
In-Reply-To: <aPEv_UO4vViOcOvN@yury>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DS5PPF5C0B6C3B6:EE_
x-ms-office365-filtering-correlation-id: 56d1fb0a-7a01-46b2-9c6b-08de0cea3f5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?d1NlTDh2UkdKTncrbnYzSmVoYmxwM3pPWWR3eVRpQXBCbExuUnYrQVV1a2tv?=
 =?utf-8?B?RFQxNnNCSHNsSEtrcTl6OGRwYjlmMS9tU0Q4bU84NzV2RXNBbjJrS2dmSjli?=
 =?utf-8?B?V3lqWU5XSUc4K3pGWHFCL0RhRmZpbmtrQkVGR2tDbGExU3pMR3FlM0MvejM4?=
 =?utf-8?B?RVltdmdrQmxEbWljRkRwdFFwdEJub1pJd3lsdlhRVVpqVUhaa0VuWmR2cm9D?=
 =?utf-8?B?NlpCSkppK3U5a0xQMzB2M1ZYL2tnWUxOMGxndzhQWDYzNlp1RW9VSnJIU0dB?=
 =?utf-8?B?aDFoNVRTQzNXY2tIR1dxYTVUR3JHaEJqN2RzVmdIOUVaZGtZT08yeWhZR1NE?=
 =?utf-8?B?clYrZ1lXNWV3VllTVGVTdk0yVFNqRlBRYW5kaElsbTlJWlNoQ0R6dWwzSnFD?=
 =?utf-8?B?QWFuVnh4cnVac3l5KzJ1aThEYXhkU2JuT0dUdUJDelJqNVFSN0pVSDkxTEVK?=
 =?utf-8?B?b21xVFpsbkxYVDdENXNNS2QxUmFtbS8wUTZVNWhGY2p3N25TUFB2aVI3ZEJo?=
 =?utf-8?B?dXBiZGIyOVlrMTZHMU1DOXdtZlN4NUFyZzBCaGtHNno5eDl6UDlTV00wSW9Y?=
 =?utf-8?B?WmMzYVZWc2lDbTlkRXBCRGR2TmI2bjdjazdEWU1xSlNDZkYzZWNmazVLYlU2?=
 =?utf-8?B?OHQzbDRtWXFhcENXc3RoSnNBbDVxeHJQMUVOZnNiZlUrMzBvQms3OFVraUJT?=
 =?utf-8?B?a3J0UElQSUNhZlZSU3RSZkNiM2tFVjU0YzNVdnlnS1dnaE1ueUppL1h2RGJC?=
 =?utf-8?B?TTRNMnNEMEFudmlsUXk3Zldhd3diQ0dZWUtlbTVmRmN5TSszRjBtc3h5OC96?=
 =?utf-8?B?K3BrU3UvTUlQLzZOc1VZK0xJc0N6dm85S1V1TEZyb1o0ckMyY2taMVYwRFBl?=
 =?utf-8?B?SkZ1cC9SeU84ZzV3SnFsRWFTbUI3Tmk1RWl1NS9BbzZSd2diNUtMMnZLL21T?=
 =?utf-8?B?c0k3cUZvb1g3RWV6bUxPUmVaMkkzcVlNWlExdi9ZY1VtZStCaEZPcjFVajY4?=
 =?utf-8?B?TjdwTDdjeUN3OHJSNmNVb3grWEJOaGVSL1pDUlF0L3luQzRKWkcrR3pyRWR0?=
 =?utf-8?B?ekUvNk95bHAyWThvTVN0d1FDUE0wa2piOU1PdzdWMjQ5TkxjSHVFM043cm1W?=
 =?utf-8?B?UmhwQ2RyaDVPdVBrVC80SEJEZXMzUnorYVZtM2RvVFJHWFdwSW4vZjNwTU1F?=
 =?utf-8?B?QUkreVZrQWJWTTFvcGcwSVkxeUtjQ1c2YlFOL0FwM1FtNld3UkhOYVEwejZT?=
 =?utf-8?B?SmRYcWRSOWJlN2daRkplYXEvRUljNHpIRUExcm1BWlJDSHI5Z2t1MjVmc1BG?=
 =?utf-8?B?cHZ4RnpOZTNBSEhsWmFFempKQWFPUzB2RVZKTXF5MUZTZHdlcFY5RTBwS0xS?=
 =?utf-8?B?Rk56UnZLdWZnNGJZNkd5a0tsemFnUHk3Ylg5ZHZoeEFzMnZSTkIvWTB6TFZZ?=
 =?utf-8?B?cDNJRm1USGxSb2lwdXl5NmQ3b3paY1A4MTZMNnNiSEpnUHFwQ2haa2hxNmVT?=
 =?utf-8?B?aDV3NUgweERYbzFKWUpOUFlwUWlwcUxlcUtwOFl1TUF1OXB6L3h2cS93ZVlz?=
 =?utf-8?B?by9LNHJBdS9uUkU1WjBvc0xQVFlGbEJFdjVLU09HeXNPRmVobmN5UjFxa1ZQ?=
 =?utf-8?B?YWhsMzIwczVHeWdxSGJqK1E3UWdnY0Q4US8yMzBHUUloR3RNaDUrUENtT0hw?=
 =?utf-8?B?STBYRGQxY2d4ZEdzT2VCK1V0c241bm1RamdyN29abnhNT0VDaE1CNTR1ZlRi?=
 =?utf-8?B?ODVuK0JxQVNYQXhYajZGZmQyTENvU2hKWlNKQjJrWUhqSXIzcUxqdEpNRlN2?=
 =?utf-8?B?T1Z5TjljZFN5bGFNeDVpL3RSTkk1Zk5NZE5VcTBsMDYrcWptdGE0Z0VsdU1X?=
 =?utf-8?B?Y21RcWkrWkNBUDROREdENlhvTmlnNng5dDdacVcyYnF3UzROTVVtYldTRllz?=
 =?utf-8?B?SEp5UENpcjRmMGxJQ1Rrb3p4UXhaazlac2dCOHdEUjNyUUJjclR6V29Zclox?=
 =?utf-8?B?UXB5VC9iUGVvcGJmaTBrbVhrMm9ic0hpK2JUaUIzNmpRd29IcjlqeDJSNTVE?=
 =?utf-8?Q?apPvtV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1Q4OW5uYjFSUlNuaElTTTRaSmNvbmMxZ3RISkRBdVJDMEIvREV5N0paZTlm?=
 =?utf-8?B?ZzliSS9kbGREaE56MW5xcTdzT1dWSlplbU9FZVpNVzhUS0p4Z2RmK0ExUDNK?=
 =?utf-8?B?Y1pveXNxNlVucm9xSGFKcll1OTZCOU9RdytnL1dEcXJIU0RRRnVYYXZhVEZF?=
 =?utf-8?B?aS9sWk93LzZNUFc2WUc2VVRCck92Ykk4V0VzbEN5SzQ2QUhOUW1oaDNXSkV1?=
 =?utf-8?B?dG9wckdEQnRBNXBIa0ZTZndZSUcyZ3ZjaWNGWmgzRFAwaGhKL1hLb0pTZ2VX?=
 =?utf-8?B?RWJGSndwMTdURkk4cEVRR1V1V2QrYjg4bjZ3WExaRzVwd05OZS85UWJDSE1t?=
 =?utf-8?B?eHRpQW9saCtMeHpPZzBhU2NSaStoWWVtNDBHd3k2K0wxandndktya1F2dW1k?=
 =?utf-8?B?VXpnY1dNNUJJeWZ6dmRVVnZKbGUxY3hvQ2VLNUdvOGNsekpETWRJVTlpeWRT?=
 =?utf-8?B?eGdTWmdwd01Pd0llc2VBMEZTSTQ3Uks3U0JLNnlsL2U4LzNvRHJxdnBEQmxw?=
 =?utf-8?B?NnZ1RlVtRERJenRYZm1ULytWdHRyS2FyQzloaDZNRzBPZnlsVlMyQ01ac3pl?=
 =?utf-8?B?cHV3SUFkZWp2Mytvckdxb3BxcVZWdzFpMm9HaUN4ZVMrZmRJR25aWC9tdllS?=
 =?utf-8?B?cmozY0h1eEJQSTd4VkhIUXpWNU9SWk1ueXR1eXdOZUFVMHpuNG5oVE5tbzRZ?=
 =?utf-8?B?NG1RMkpsaGs0dUtOdm13L3B2Z2NtTVdsOXhteTBoMk5jbXBlQ3czMmxCVVNw?=
 =?utf-8?B?a3lHU3NxNURGNEdBVjVEb1lyb0xIcDkrNWt4VzliOWNvYXE1QVNERUlYMmZZ?=
 =?utf-8?B?VGxRcWt4ek9FL3laWk9oUjlwaFNiREI5cXFWZDVFeEpzQWhWaGJtVlkwQk1o?=
 =?utf-8?B?NFE3dXg2SmYwMm1zMExFdnVEdFo2RlNiZ3RkTU10RUNLcUJjSjFwVVRmN3ZT?=
 =?utf-8?B?ZFpHa1VNYnNJY2kwbnFDWkdFblNmRkJzTzNDZG5BMC8vNHZZMFVrWmw0QVdS?=
 =?utf-8?B?T3RndGVWRXlxaGZxeHczT3JZSkpwVyt0TU5RM2F0Qms5QXhqaEVDbkVvaWVR?=
 =?utf-8?B?dTAybXMxRktXblFFR25wVE51blFKcXg5L2NBQkd3NlBnU0NVQ2RhTS8wTGxX?=
 =?utf-8?B?bjhUUGdUTnl1THdtaHdRRWk2UTA1N0xmNHdlcjE0azE4cWFZbDZQZUFrNG5h?=
 =?utf-8?B?UVI1RThqdXJ4OE8rMGNuaXF0alZSd0dHb3dtVlF3c3I5bGl6T0d4SjdoK1Fr?=
 =?utf-8?B?cm5iRTk1M3FTRkxsL1MveW1GMlluTzFTbWx2Wlcyb09Zc29nQytzbG9tV0Uz?=
 =?utf-8?B?VHZMYzR6dG5wYk9XY0NlYVdPeWtSenVTM0RKbzZlK3ZuWlI5UWhRZ3VOcXVJ?=
 =?utf-8?B?ODN1dzcrZTBibGE2NG10RnlvODZHb1hSc1FoU3grMDh4QW1kamNRZTZHNlZT?=
 =?utf-8?B?OWt4OVlVR3RZUGJreEZqNFN4YzVXSFljZnhvR3NBOG1qUjhzMHM1WFdlamZo?=
 =?utf-8?B?SFNMOFB5a1VkVC84L1FSNnRVTm1lOUlPWS9KdEpnSTcrVlZjNy84dWVEelBR?=
 =?utf-8?B?bXRodHlzZmpxV2RzNkw3UlFLRGJKN2N5RGx5S1BLQVZsbFc2RTc1dTBBMzFM?=
 =?utf-8?B?NTlJRG9wUVVxUGtsWkRLS1NuQklKakplZFhXT1NCK2NLbW5UM1FaNC85ZzJm?=
 =?utf-8?B?SEVRMHRPY29tejhzWmZKZktZYUcrbzY4eUE0RTdrT29mS0dPOVJ2Ukt4Rmcr?=
 =?utf-8?B?ZExVQUNFTHZFNUlsOEFYcEp5ckNRUU5MT3JPcWk4aDg2cnc2cUFYaU9oK0Rv?=
 =?utf-8?B?Z2lZcHJuMGhTbWt2NmRpK1A5WCtuOUFkTzA1ajlrMmovK0RQL2U4TmE3aXBy?=
 =?utf-8?B?d1JhV2l6YTNweTRKUTRsVExkdUovKzZ0MzRscllpbzZtRWlHVDNldEtmRmdB?=
 =?utf-8?B?L09UcjFHWFFQTW11VzZOVVE5Y0NxaVVYSXZsRnZIRlliT2lEK2ZqeEdPM1Zj?=
 =?utf-8?B?UGErUjU3ZGFjTFFWUWwzR3gwVDZqUE54QlNQNEVqNVRHMmQzUjBHeElJRDlr?=
 =?utf-8?B?NGRJcGt6NDQ4NTRXZE9yemsrclkrK3dudWJlRmJMTTZiQnp6MWFHNDFENm1W?=
 =?utf-8?Q?X9eX0JPowkXcXfc2rt92KNpM/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d1fb0a-7a01-46b2-9c6b-08de0cea3f5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 19:28:55.7735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DSuo22PlVCjZ7CU9A2/bFY3vSnZEK+gYXuM4c8FDQ2II0fMsYHHgSDBzdcN8GngnlDWHM9MYud4zwvO7AYzByg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5C0B6C3B6
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

DQoNCj4gT24gT2N0IDE2LCAyMDI1LCBhdCAxOjQ44oCvUE0sIFl1cnkgTm9yb3YgPHl1cnkubm9y
b3ZAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFRodSwgT2N0IDE2LCAyMDI1IGF0IDEx
OjEzOjIxQU0gLTA0MDAsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4gTW92ZSB0aGUgYml0Zmll
bGQtc3BlY2lmaWMgY29kZSBmcm9tIHRoZSByZWdpc3RlciBtYWNybyBpbnRvIGEgbmV3IG1hY3Jv
DQo+PiBjYWxsZWQgYml0ZmllbGQuIFRoaXMgd2lsbCBiZSB1c2VkIHRvIGRlZmluZSBzdHJ1Y3Rz
IHdpdGggYml0ZmllbGRzLA0KPj4gc2ltaWxhciB0byBDIGxhbmd1YWdlLg0KPiANCj4gQ2FuIHlv
dSBwbGVhc2UgZml4IGxpbmUgbGVuZ3RoIGlzc3VlcyBiZWZvcmUgdjg/DQo+IA0KPiAkIGF3ayAn
e3ByaW50IGxlbmd0aH0nIGRyaXZlcnMvZ3B1L25vdmEtY29yZS9iaXRmaWVsZC5ycyB8IHNvcnQg
LXJuIHwgdW5pcSAtYw0KPiAgICAgIDEgMTE4DQo+ICAgICAgMSAxMTYNCj4gICAgICAxIDExMw0K
PiAgICAgIDEgMTA5DQo+ICAgICAgMSAxMDUNCj4gICAgICAxIDEwMw0KDQpUaGF0IGlzIGludGVu
dGlvbmFsLiBJIHdpbGwgbG9vayBhZ2FpbiBidXQgbG9uZyBsaW5lcyBjYW4gYmUgYSBtYXR0ZXIg
b2Ygc3R5bGUNCmFuZCBpZiB3cmFwcGluZyBlZmZlY3RzIHJlYWRhYmlsaXR5IHRoZW4gd2UgZG8g
bm90IHdhbnQgdG8gZG8gdGhhdC4gVGhhdCBpcw0Kd2h5IGl0IGlzIGEgY2hlY2twYXRjaCB3YXJu
aW5nIG5vdCBhbiBlcnJvci4gV2UgaGF2ZSB0byBsb29rIGl0IGNhc2UgYnkgY2FzZS4NCg0KPiAg
ICAgIC4uLg0KPiANCj4+IFJldmlld2VkLWJ5OiBFbGxlIFJodW1zYWEgPGVsbGVAd2VhdGhlcmVk
LXN0ZWVsLmRldj4NCj4+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RA
bnZpZGlhLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBFZHdpbiBQZWVyIDxlcGVlckBudmlkaWEuY29t
Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9lbCBGZXJuYW5kZXMgPGpvZWxhZ25lbGZAbnZpZGlhLmNv
bT4NCj4+IC0tLQ0KPj4gZHJpdmVycy9ncHUvbm92YS1jb3JlL2JpdGZpZWxkLnJzICAgIHwgMzE5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gZHJpdmVycy9ncHUvbm92YS1jb3JlL25v
dmFfY29yZS5ycyAgIHwgICAzICsNCj4+IGRyaXZlcnMvZ3B1L25vdmEtY29yZS9yZWdzL21hY3Jv
cy5ycyB8IDI1OSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAzIGZpbGVzIGNoYW5nZWQsIDMz
MiBpbnNlcnRpb25zKCspLCAyNDkgZGVsZXRpb25zKC0pDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvbm92YS1jb3JlL2JpdGZpZWxkLnJzDQo+IA0KPiAuLi4NCj4gDQo+PiArLy8v
DQo+PiArLy8vIGJpdGZpZWxkISB7DQo+PiArLy8vICAgICBzdHJ1Y3QgQ29udHJvbFJlZyB7DQo+
PiArLy8vICAgICAgICAgMzowIG1vZGUgYXMgdTggPz0+IE1vZGU7DQo+PiArLy8vICAgICAgICAg
Nzo3IHN0YXRlIGFzIGJvb2wgPT4gU3RhdGU7DQo+PiArLy8vICAgICB9DQo+PiArLy8vIH0NCj4g
DQo+IFRoaXMgbm90YXRpb24gaXMgcmVhbGx5IHVud2VsY29tZSB0aGlzIGRheXMuIEl0IG1heSBi
ZSBPSyBmb3IgYSByYW5kb20NCj4gbWFjcm8gaW4gc29tZSBsb2NhbCBkcml2ZXIsIGJ1dCBkb2Vz
bid0IHJlYWxseSB3b3JrIGZvciBhIGdsb2JhbCBiYXNpYw0KPiBkYXRhIHR5cGU6DQo+IA0KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FIay09d2hvT1VzcVBLYjdPUXdoUWY5SF8zPTVz
WEdQSnJEYmZRZndMQjNCaTEzdGNRQG1haWwuZ21haWwuY29tLw0KPiANCj4gSSd2ZSBhbHJlYWR5
IHNoYXJlZCB0aGlzIGxpbmsgd2l0aCB5b3UsIGFuZCBzaGFyZWQgbXkgY29uY2Vybi4NCj4gDQo+
IEkgcmVhbGl6ZSB0aGF0IHJ1c3QvYml0ZmllbGQgZGVyaXZlcyB0aGUgR0VOTUFTSyhoaSwgbG8p
IG5vdGF0aW9uIGhlcmUsDQo+IGFuZCBHRU5NQVNLKCkgZGVyaXZlcyB2ZXJpbG9nIG9yIGhhcmR3
YXJlIHNwZWNzIHBvcHVsYXIgbm90YXRpb25zLiBCdXQNCj4gc29mdHdhcmUgcGVvcGxlIHByZWZl
ciBsbzpoaS4gSSdtIHByb2JhYmx5IE9LIGlmIHlvdSBjaG9vc2UgQy1zdHlsZQ0KPiBzdGFydDpu
Yml0cywgaWYgeW91IHByZWZlci4gQnV0IGxldCdzIHN0b3AgdGhpcyBoaTpsbyBlYXJseSwgcGxl
YXNlLg0KPiANCj4gTGV0IG1lIHF1b3RlIExpbnVzIGZyb20gdGhlIGxpbmsgYWJvdmU6DQo+IA0K
PiAgSXQgZG9lcyAiaGlnaCwgbG93Iiwgd2hpY2ggaXMgb2Z0ZW4gdmVyeSB1bmludHVpdGl2ZSwg
YW5kIGluIGZhY3QgdGhlDQo+ICB2ZXJ5IGNvbW1pdCB0aGF0IGludHJvZHVjZWQgdGhpcyB0aGlu
ZyBmcm9tIGhlbGwgaGFkIHRvIGNvbnZlcnQgdGhlDQo+ICBzYW5lICJsb3csaGlnaCIgY2FzZXMg
dG8gdGhlIG90aGVyIHdheSBhcm91bmQuDQoNCkkgYWdyZWUgd2l0aCBMaW51cyBidXQgSSBkaXNh
Z3JlZSB3aXRoIGNvbXBhcmluZyBpdCB3aXRoIHRoZXNlIG1hY3Jvcy4NCkkgYWdyZWUgd2l0aCBM
aW51cyBpdCBpcyBvZGRseSB1bnJlYWRhYmxlIHdoZW4gdXNlZCBhcyBmdW5jdGlvbiBwYXJhbWV0
ZXJzLg0KQnV0IHRoYXQgaXMgYSBkaWZmZXJlbnQgc3ludGF4LiBPdmVyIGhlcmUgd2UgYXJlIHVz
aW5nIGNvbG9ucyB3aXRoIHN1ZmZpY2llbnQgd2hpdGVzcGFjZSBhcm91bmQgaGk6bG8uDQoNCj4g
DQo+ICBTZWUgY29tbWl0IDEwZWY2YjBkZmZlNCAoImJpdG9wczogSW50cm9kdWNlIGEgbW9yZSBn
ZW5lcmljIEJJVE1BU0sNCj4gIG1hY3JvIiksIGFuZCBub3RpY2UgaG93IEFMTU9TVCBBTEwgdXNl
IGNhc2VzIHdlcmUgc3dpdGNoZWQgYXJvdW5kIHRvDQo+ICB0aGUgaWxsb2dpY2FsICJoaWdoLGxv
dyIgZm9ybWF0IGJ5IHRoYXQgaW50cm9kdWN0b3J5IHBoYXNlLg0KDQpBZ2FpbiB0aGlzIGlzIGRp
ZmZlcmVudCBzeW50YXggc28gYXNzdW1pbmcgdGhhdCBMaW51cyB3aWxsIG5vdCBiZSBvayB3aXRo
IGl0IGlzIGEgc3RyZXRjaCBJTU8uDQoNClRoZSBydXN0IG1hY3JvcyBoZXJlIGhhdmUgdGhlaXIg
b3duIHN5bnRheCBhbmQgYXJlIG5vdCBmdW5jdGlvbiBwYXJhbWV0ZXJzLg0KDQo+IA0KPiAgQW5k
IHllcywgSSB1bmRlcnN0YW5kIHdoeSB0aGF0IHBlcnNvbiBkaWQgaXQ6IG1hbnkgZGF0YXNoZWV0
cyBzaG93DQo+ICBiaXRzIGluIGEgcmVnaXN0ZXIgZ3JhcGhpY2FsbHksIGFuZCB0aGVuIHlvdSBz
ZWUgdGhhdCAiaGlnaCAuLiBsb3ciDQo+ICB0aGluZyBpbiBhIHJlY3RhbmdsZSB0aGF0IGRlc2Ny
aWJlcyB0aGUgcmVnaXN0ZXIsIGFuZCB0aGF0IG9yZGVyaW5nDQo+ICB0aGVtIG1ha2VzIDEwMCUg
c2Vuc2UgSU4gVEhBVCBDT05URVhULg0KPiANCj4gIEJ1dCBpdCBkYW1uIHdlbGwgZG9lcyBub3Qg
bWFrZSBzZW5zZSBpbiBtb3N0IG90aGVyIGNvbnRleHRzLg0KPiANCj4gIEluIGZhY3QsIGV2ZW4g
aW4gdGhlIGNvbnRleHQgb2YgZ2VuZXJhdGluZyBtYXNrICNkZWZpbmVzLCBpdCBhY3R1YWxseQ0K
PiAgcmVhZHMgb2RkbHksIGJlY2F1c2UgeW91IGVuZCB1cCBoYXZpbmcgdGhpbmdzIGxpa2UNCj4g
DQo+ICAgIC8qIFN0YXR1cyByZWdpc3RlciAoU1IpICovDQo+ICAgICNkZWZpbmUgSTJDX1NSX09Q
ICAgICAgICAgICAgICAgR0VOTUFTSygxLCAwKSAgIC8qIE9wZXJhdGlvbiAqLw0KPiAgICAjZGVm
aW5lIEkyQ19TUl9TVEFUVVMgICAgICAgICAgIEdFTk1BU0soMywgMikgICAvKiBjb250cm9sbGVy
IHN0YXR1cyAqLw0KPiAgICAjZGVmaW5lIEkyQ19TUl9DQVVTRSAgICAgICAgICAgIEdFTk1BU0so
NiwgNCkgICAvKiBBYm9ydCBjYXVzZSAqLw0KPiAgICAjZGVmaW5lIEkyQ19TUl9UWVBFICAgICAg
ICAgICAgIEdFTk1BU0soOCwgNykgICAvKiBSZWNlaXZlIHR5cGUgKi8NCj4gICAgI2RlZmluZSBJ
MkNfU1JfTEVOR1RIICAgICAgICAgICBHRU5NQVNLKDE5LCA5KSAgLyogVHJhbnNmZXIgbGVuZ3Ro
ICovDQoNClN1cmUgdGhpcyBpcyBzdXBlciBvZGQgaW5kZWVkLiBCdXQgYWdhaW4gbm90IGFwcGxl
cyB0byBhcHBsZXMgaGVyZS4NCg0KdGhhbmtzLA0KDQogLSBKb2VsDQoNCg0KPiANCj4gIC4uLg0K
PiANCj4gTm93IGNvbXBhcmUgaXQgdG8gd2hhdCB3ZSd2ZSBnb3QgaW4gbm92YSByaWdodCBub3c6
DQo+IA0KPiAgcmVnaXN0ZXIhKE5WX1BNQ19CT09UXzAgQCAweDAwMDAwMDAwLCAiQmFzaWMgcmV2
aXNpb24gaW5mb3JtYXRpb24gYWJvdXQgdGhlIEdQVSIgew0KPiAgICAgIDM6MCAgICAgbWlub3Jf
cmV2aXNpb24gYXMgdTgsICJNaW5vciByZXZpc2lvbiBvZiB0aGUgY2hpcCI7DQo+ICAgICAgNzo0
ICAgICBtYWpvcl9yZXZpc2lvbiBhcyB1OCwgIk1ham9yIHJldmlzaW9uIG9mIHRoZSBjaGlwIjsN
Cj4gICAgICA4OjggICAgIGFyY2hpdGVjdHVyZV8xIGFzIHU4LCAiTVNCIG9mIHRoZSBhcmNoaXRl
Y3R1cmUiOw0KPiAgICAgIDIzOjIwICAgaW1wbGVtZW50YXRpb24gYXMgdTgsICJJbXBsZW1lbnRh
dGlvbiB2ZXJzaW9uIG9mIHRoZSBhcmNoaXRlY3R1cmUiOw0KPiAgICAgIDI4OjI0ICAgYXJjaGl0
ZWN0dXJlXzAgYXMgdTgsICJMb3dlciBiaXRzIG9mIHRoZSBhcmNoaXRlY3R1cmUiOw0KPiAgfSk7
DQo+IA0KPiBUaGVyZSdzIHNvIGZhciAzNiB0aG91c2FuZHMgb2YgR0VOTUFTSygpcyBpbiB0aGUg
a2VybmVsLCBhbmQgb25seSA2Nw0KPiByZWdpc3RlciEoKXMuIEl0J3MgYSBzZXBhcmF0ZSB0b3Bp
YyB3aGF0IHRvIGRvIHdpdGggdGhlIEdFTk1BU0soKQ0KPiBjb2RlYmFzZS4gQnV0IG5vdyB0aGF0
IHlvdSBkbyB0aGlzIG1hc3NpdmUgcmVmYWN0b3JpbmcgZm9yIHRoZQ0KPiByZWdpc3RlciEoKSBt
YWNybywgbGV0J3MgY29udmVydCB0aG9zZSA2NyB1c2VycyB0byB0aGUgbG86aGkgbm90YXRpb24u
DQo+IA0KPiBBcyBhIHNpZGUgbm90ZSwgZm9yIEdFTk1BU0tzLCBJIHRyaWVkIHRoaXMgdHJpY2s6
DQo+IA0KPiAgICAgICAgI2RlZmluZSBHRU5NQVNLKGEsIGIpIFVOU0FGRV9HRU5NQVNLKE1JTihh
LCBiKSwgTUFYKGEsIGIpKQ0KPiANCj4gSXQgd29ya3MsIGJ1dCBibG9hdHMgZGVmY29uZmlnIGtl
cm5lbCBmb3IgYW5vdGhlciAxSy4gSSBkb24ndCB0aGluayBpdA0KPiB3b3VsZCBhZGQgdG8gcmVh
ZGFiaWxpdHkgb24gYm90aCBDIGFuZCBydXN0IHNpZGVzLg0KPiANCj4gVGhhbmtzLA0KPiBZdXJ5
DQo=
