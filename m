Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFEBC505EB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 03:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D0D10E174;
	Wed, 12 Nov 2025 02:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LYifwIiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E71E10E174;
 Wed, 12 Nov 2025 02:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPj7/zs0wvjmWuXo7fbv3hO7EaOT8nTi/v5kBh8Sw2QsitamQX84QFXQ542hGW7rCXgSfqCDt9XDnrZrTZSpLxk0f/QThhlI5T83G4umGqDCqTA/EAG8mFVeVPwX7H7QIHHvUIIneJNDni61NTy4XKcbqb2MZxULkste/eLMu00PqLD1jidO7OtQ1/oLvhY4/i6K1QBSvyy92FCYeCjJVB0hV2G2WTrS3ZTzAisk0iMoe4zsH31sVTWcvaSz8J651aEol03SfaL2NeMw9nCVnJFqtHTWW4gTsd0AqujGadKg1W7YrxYaqk1HebyjnrHXLugdu3Oqa0Swx35QJ+fBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf3MwzIg+D/zTFO89ACS5/hU8L/VSj9esOhzPTD2Dzg=;
 b=YaP4u7JVio1msHG/yigJTdCy0Bh1T5zSEeEfXPkrF4KWVrwj1eOoOPuwy3JQV3/8uhh7uRioUcKMcyEwQk+gK5Uh2jxmAcZ3HHKrPRk+cpTPtk0H6qqUEWJISmzfUYoy4g2aiDFXNQeD4d27ExKEsM1jkHe9v34BlYLwYJkJl7Q7BF6jHejGThrjnhLZ19sHmoF5l6/VtLZTUHI9wqtTef4qEaYKyxBb207oLuQ6JGS92ftu6LIw9aFyRTs1e996r8lObNrPRu6WSWmNaf4IUCXocZkD/Mt0wTnU5akdfcBD5NKsUD7Mq9T18u4kS/nHEifv01zQmCIipc3YWx3+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf3MwzIg+D/zTFO89ACS5/hU8L/VSj9esOhzPTD2Dzg=;
 b=LYifwIiE6YwWO6kH6xuWXjZ3n0Rgnr1Al5J7MHjvNe+OSCqywRAf1FNdtOKcR7TbwJuy/5f7h5C13ffhDWFlL9jdMae0s/FbvLjx5JguAnEkFx68JfMByvQbkjFSl0ofqoT+vGKa4KYDsrTLipXdf9t81AYJd70hmVtPBYSM2jFk0IZB7wuVux6OJKM4sQ3lu/NZfvhfrvPP/sTe9oC6r8qKO94QuYrMRb/DundNY5WfWaXSV4Rg+PGB5lfDIhk/AhJReI+lAp7MNabp/L/m6/PGrM9atWCg0Zdet0gFwUSEe9aingQeWRIk4zFypXKpIYYZuefxPzpbS/yL9pP7HA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8319.namprd12.prod.outlook.com (2603:10b6:8:f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 02:53:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 02:53:34 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, "joel@joelfernandes.org"
 <joel@joelfernandes.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Nouveau
 <nouveau-bounces@lists.freedesktop.org>, Alexandre Courbot
 <acourbot@nvidia.com>
Subject: Re: [PATCH v2 06/12] nova-core: Add bindings required by GSP sequencer
Thread-Topic: [PATCH v2 06/12] nova-core: Add bindings required by GSP
 sequencer
Thread-Index: AQHcTFS+CMaAxtYBWkescD0aQKBa9LTr9hWAgAIgA4CAADPwAIAAHGAi
Date: Wed, 12 Nov 2025 02:53:34 +0000
Message-ID: <82DE7DC3-B8E3-4C64-B05B-74BD0A2A4B25@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-7-joelagnelf@nvidia.com>
 <DE521OFQRH29.ZNUPX2POGN1V@nvidia.com>
 <f7608a86-3842-439b-9d5c-b7039cd15d1f@nvidia.com>
 <DE6BESY0QHEZ.2DX2FQ6HF8BY6@nvidia.com>
In-Reply-To: <DE6BESY0QHEZ.2DX2FQ6HF8BY6@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DS0PR12MB8319:EE_
x-ms-office365-filtering-correlation-id: fecd1d22-22c5-4391-c5fe-08de2196abb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TVZLcFd1Nk1xTzkxdDkwSHBUMFZLVHpza1VWYWRXVUp0dml6enY0VE5mSnhJ?=
 =?utf-8?B?WHJMK2hkWmlXeHh1U1ltaWc1OWllMFY3b3VIcmJCWEU5NTd1S2lxZzU5RWZh?=
 =?utf-8?B?bS9CRzFFNE9XZFBycVhsc21CdGlkZi9QOUlPWG0wS0pjRnJvSERkSzNUWTJZ?=
 =?utf-8?B?RDhEWGR0R3BIcTJhdm4rZi9UcmhEQ1A1VStTM2IwZmtRUE1IeXpyQldFNGdV?=
 =?utf-8?B?T1QveXRWdUNDUjZXTzZEa1c4V0JzOWpWb0RFeVQ4ejBVSjdVVUFEMHp6NWN3?=
 =?utf-8?B?Z1VqaERBQWYrMlV5Ri9oYkFZZWUxRTlsRGN2UDVUeng3WWpLNjdEN0lDWGJQ?=
 =?utf-8?B?OWltanZzR1MvUjBER0ljMUYvN3lLMXdjMnBXK1RzMHpKUjhtS0x1YlVoTklr?=
 =?utf-8?B?azA3ZTE2V2FEM1cxcklrbTVhMUxnL1RpeEFGZmtRWlFrWjh0L2gxcldZRkVX?=
 =?utf-8?B?dFZVRFJrTG5saHlIekYzUE9hUDc3ZUNTR0V6RCtibk5UcDE4RTJESGJQT2p3?=
 =?utf-8?B?R29TdW9CbUw3ZkJuQXJ1K2lBRUtvVnhOZXpWblRXNjFLWnJIa0ZjekNoNTk0?=
 =?utf-8?B?WHJJVXVUMUd0dXRXaVZIdG1FTXBNdmRtUlE4TGNZdndkNTg5bmcwQTNIaGxE?=
 =?utf-8?B?d214SDd0bU9EZ2pNOGR2TWNQZUFDUXFTU1BBS2J5d2xwMnF0ZE9oOWRWUGFC?=
 =?utf-8?B?b0lIRlh0TFY5ZXNDUTJOTEE4MDN0ZitaWHZsUFFFdHgzekJETWlmTTZOUUxZ?=
 =?utf-8?B?WmpxdTZEVElHSDMxR095V2k4R0tSc0tHWWlEVWFyVEZSU2JDUGFaS1hNd080?=
 =?utf-8?B?T2gvWURCNVNhTHFKTnRIb2FXNFJOOVp1RmVvaWhTdnJEUDdPOUE3dUdSL21E?=
 =?utf-8?B?TE5ZemRjdzZiUitFSGZ1ZjBES3FhdDZJQUVTa092RWx4eGR4cWNhR241NjJz?=
 =?utf-8?B?V3R2Ykp3amRRSjI1ck5HMDVPY3czQXpIQmF4Z2M2VFYxWTRRTExMZXlISEF5?=
 =?utf-8?B?RjV5dVBuMTRnUDBUTU5zQkxJU0tHSkE1WDNQZ1FwdzJJTmtjbjJha0U1eG9p?=
 =?utf-8?B?UGppYzl5S1RMMG5HSEtuQktDeXY0R0xXUkR3MUpCT09BdDQxdTQwRmFlYWhQ?=
 =?utf-8?B?VDFLb1Y4TUQzVFRqbWpZZ0ljWk9wNXJsTjE1aHVIMGluTzlxcWlhY0xGUlFi?=
 =?utf-8?B?dlhTWGJVMXJjOHZaYTI2dTY1UWp2bDhjYnpuK0tXVm5pTnJTKzMvRjdUcFJn?=
 =?utf-8?B?NWUxMHcxdVAxK0FwNG50MHpFL2dzNWhRU0NQQ3BnUjNOMHFWVXVvam43SlhZ?=
 =?utf-8?B?akVSWkdmczFGbjZsRWdKZTVuK0VpSTZxQ3NJTjgycWNiWVlBNkhBV1lxUG1N?=
 =?utf-8?B?QWV6Znh5YS9oVGFhMS9HL3ZrUzUrK1FlZWF1Vm1tdGFjYkE2TGdyaENKV0RQ?=
 =?utf-8?B?eURvWlQ0b21Jc0krUlpjbUllR0hYQy9ibFRGZ0c1VFJyQU94QXowQnkzb3p3?=
 =?utf-8?B?TjhZdE1nOUpmUHFNV3NPc3lMcWExbWpYSS9paUVEdkVFbTlLZG9xQkJSemp2?=
 =?utf-8?B?aVJIazdKTHF5R0luRGYrVWFCTjhmV1pBUVRxWU5ZSnhlblhOamhvRWR0M0M1?=
 =?utf-8?B?OXdIdkpZZEUydnZGT0Z1UkxtNXlTTU1lZHJVSU1admROQmdiaVlrRmp4ZnFi?=
 =?utf-8?B?dnJqZTFwUkFiQ3AvMjVqM015YjA0SDhTQWJkckdQNUtaejhma01hdU92T0xi?=
 =?utf-8?B?L2JXQW5ucS9kcDlxWGtDK1MzUVJ1cHUwZEM5a0xVa2pnTURJcmM4VGFEQnY0?=
 =?utf-8?B?UWw0Ui9KOFNQOEUzM2FFR3VVUmpyOUV1NDRCeGMrMmNvcjBJL1BlbkVQZGt0?=
 =?utf-8?B?aXM0d3RlQnAveUl5V0tLQS8wSmtocXQrUXNiMFRBTW1LTXhJZFZOMVNmU2Zk?=
 =?utf-8?B?dzR4YjZnbGJJNzkwSDd1Z3FFNzBEclVralJRbkJHTjZqSTBuTFAxc1YweUJ1?=
 =?utf-8?B?VHg5M3FBK3Vjcm1WUlI0NlVuU0N2L1hVR2loSEI2d2g2L2ljVzNWNExUNzIz?=
 =?utf-8?Q?DfWRh5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sy9icjFyNnFNN05DcVJPVzZmWm5LQUJueGxHTTFnanJ4RkV1U3VOSitsY2F0?=
 =?utf-8?B?WDlrMVJXenhBd2FiRE1kMVl0d0xITlVqdnVmbUNoNWQ3Sy9GVlVEVzRJRDZE?=
 =?utf-8?B?aXV6cWltbnNXa1c4VllnRW5BSnlBZ0VQVUx3VjlKTHU1ajJHT2tQcnVxRTVS?=
 =?utf-8?B?SXpCb3UvcWU0WitVaTNTTmxhNzJsR2Y1KzBIdS95a3l2MnE5REpNU1ErcXla?=
 =?utf-8?B?SnoyOFc2VnFMSDFuTUtpdFUzTlBMZGFxQnpWZllMQ1AvOUJONnNNVmZ2K29U?=
 =?utf-8?B?Z1hNUks1QjF4d0tLcFByTGJnRWxWd0x0SWU2QTRIS1dmWGt1ZUN4aVArYzJD?=
 =?utf-8?B?RHFnZkVPUkk5aUVLWFphTHFXaHB4MUNoeENGV3FNdmRWendQSHJSVXNZWFh5?=
 =?utf-8?B?Z3czUFdkQmVsd0ZycVpGYk1GdjR4YldoUWJuZFpMSGZ2QkxVNjRzL0FlcTZV?=
 =?utf-8?B?elpNTEVKa3JONEdtb3RwVTM5dzRWKy8rMzBBU2psNkJqNUVtU2VGYUpycDNu?=
 =?utf-8?B?MFNrejhjb0lNbkFST1NoNEpDNVMzd25ZUmFqWHNzbEZid3M5aVcrOUxyVFI5?=
 =?utf-8?B?dldyci82ZjlIa0FwWkVERnpRWTZYWExuajhhRUNldk1XeTgyU2RGYkpWQzlV?=
 =?utf-8?B?UXhQbWJML3gybG5tZllDMHdRRFZIU0hldWFPODBoaGwyZkwwSm05ajNFY1Fp?=
 =?utf-8?B?QmNEYm54VVE5eWYvRmwyYzJNWC93a0l1bUhua1pPMVc3YThoWWprZkk3eWZJ?=
 =?utf-8?B?bzRQR3RvL2VPTjc0QjdOSW5ES2NqdGZaS1MwQTllcE82emt3UTEyZ3JSMTdG?=
 =?utf-8?B?WmtzZGU1MVlsaTlGRFZPWVJIS29oajZPRzBvQ1lmY0JNZGIzLzB2d0Q5ZjlE?=
 =?utf-8?B?dXhxUHlwNWlLYVUwdmludDZaaHgvblVpS0NJRHJ6S0NFdDZBUExGVStRTGtN?=
 =?utf-8?B?b3FzU0pwM3dSM2xZUzcyYTF5c2pJUUtDNmFZd2hpY3VpUHp3MGdLK0hESmdQ?=
 =?utf-8?B?UHVnVld2eWZiWWMxZ0l3MDVjaXB0ZUgwUlFyaXJiWGkzcHMzN0FCRm9qTHNo?=
 =?utf-8?B?SGhaWDAwZ0NIS0QvTnVzR04yeGV3M21hTzRmNG1QQUV2QXdIdzRZL2w4eHFy?=
 =?utf-8?B?ZGwzQ1J4V1o4KzRIU2VGa3VuWTZaMkQ3bzIxQVF5RWRvZkx2YVBTYUdEZjRy?=
 =?utf-8?B?cENCdjlPcW9PS1U0SFF0enBWQlh6ZVRwUEFRRVlEMUpyZ2ZpM3BPV1ZaejNP?=
 =?utf-8?B?T1owZHo3bzdya0JML25jcVoraWUyRzhCWjgrUWJ2UFZsVXl5Z25ydkVxVWxL?=
 =?utf-8?B?T2Q3VEhRMUc1OW9yZzB3T3JNUkx2emJVVHpqYVpqMElGYktBMVBUVit3Z1Jx?=
 =?utf-8?B?NHlFN1FmZXVmR1pGclBZTEJlRFhzd3ZsRGpLUnpGcW92VjhrOTlTRks0dml1?=
 =?utf-8?B?VVk1SStLZ1FLMitOeGQ4cytDNTBsak1vWFJRRVEzYTJIbm95ZWk2U1cxM2Ex?=
 =?utf-8?B?SnpJa09UUTQ5N2c1NkllWkVlaXJ0Q1RqYVVVY2UzYU9rMlovdmcveWVIV2w5?=
 =?utf-8?B?RWFJVU41NlFWcHoyL2kyUnFqNDZOZUxqV2dPZjljUVBoWjMxUFROeFk5NHIr?=
 =?utf-8?B?S0ErL2tKR1lVckVKZU9HenIxY1gyeFhqcDdTemJpUkpoVkFpdFUrLzl2R2c1?=
 =?utf-8?B?OW03Tlo1UWNjNmpuUUNUbUxZc2FlY2pnb1dTMzY4YVZKTjVpN2JzNUdLUTl1?=
 =?utf-8?B?N3IvQVlSVHJnZmMrWDgzRmFMek9YNnY0aWtwOGNhODJNYmlLOTBOZnYrcjNi?=
 =?utf-8?B?ZlpDY0c3aW9qUkQvcG9jeGFQZ3UwL0srek5OUlUrZVJrZlRZSm1CNDFEK1Qx?=
 =?utf-8?B?QTJiUVFpb0tBaVdnU3VKZU4wNDVkR21KYzhyaW05TFhwcnFrMVF5elBmdEVj?=
 =?utf-8?B?WXpQdk52VVJtWG9IcDhXOSswUis1cU10ZUQ2VXQxN2ovWUpRNnNhNnFyT3lq?=
 =?utf-8?B?SUtCUnJ6Ynk1RFZHS2dEMjEvd1g2Z0FNNFJpRmQwMzNpZ0NXSHc2YWhBT3Ez?=
 =?utf-8?B?WncvakYvWHNMZGwyQUZyaGN3bmhhWGJkV3d5WGpCVzdvcEd5bG9keVdmcUlz?=
 =?utf-8?Q?Xp0jW2Xul0bK5zpr7Fj+1Ez6k?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fecd1d22-22c5-4391-c5fe-08de2196abb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 02:53:34.2712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8AakexwiWgqewnmi+HIWh15KTJOMti8MWu7nKoxAsDPZDZrrkrFJOUbazH1hfLGNp7R9fA397wwOX1X2mdQIaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8319
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

DQoNCj4gT24gTm92IDExLCAyMDI1LCBhdCA4OjEy4oCvUE0sIEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFdlZCBOb3YgMTIsIDIwMjUg
YXQgNzowNiBBTSBKU1QsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4gDQo+PiANCj4+IE9uIDEx
LzEwLzIwMjUgODozOSBBTSwgQWxleGFuZHJlIENvdXJib3Qgd3JvdGU6DQo+Pj4+ICsgICAgLy8g
R1NQIHNlcXVlbmNlciBkZWxheSBwYXlsb2FkIHN0cnVjdHVyZS4NCj4+Pj4gKyAgICBHU1BfU0VR
X0JVRl9QQVlMT0FEX0RFTEFZX1VTLA0KPj4+PiArDQo+Pj4+ICsgICAgLy8gR1NQIHNlcXVlbmNl
ciByZWdpc3RlciBwYXlsb2FkIHN0cnVjdHVyZXMuDQo+Pj4+ICsgICAgR1NQX1NFUV9CVUZfUEFZ
TE9BRF9SRUdfTU9ESUZZLA0KPj4+PiArICAgIEdTUF9TRVFfQlVGX1BBWUxPQURfUkVHX1BPTEws
DQo+Pj4+ICsgICAgR1NQX1NFUV9CVUZfUEFZTE9BRF9SRUdfU1RPUkUsDQo+Pj4+ICsgICAgR1NQ
X1NFUV9CVUZfUEFZTE9BRF9SRUdfV1JJVEUsIC8vDQo+Pj4+IFRoZXNlIG9uZXMgYXJlIGEgYml0
IHRyaWNraWVyIHRvIGFic3RyYWN0LiBTaW5jZSB0aGV5IGV2ZXIgb25seSB1c2UNCj4+PiBgYmFy
YCBmcm9tIHRoZSBzZXF1ZW5jZXIsIEkgZ3Vlc3Mgd2UgY2FuIGhhdmUgdGhlaXIgc2VtYW50aWNz
IGluIHRoZQ0KPj4+IGBmd2AgbW9kdWxlLCBleHBvc2VkIHRocm91Z2ggYSBtZXRob2QgdGhhdCBy
ZWNlaXZlcyB0aGUgYGJhcmA/IFRoYXQgd2F5DQo+Pj4gdGhlIHNlcXVlbmNlciB3b24ndCBoYXZl
IHRvIGFjY2VzcyB0aGVpciBtZW1iZXJzIHdoaWNoIGFyZSBwcml2YXRlIHRvDQo+Pj4gaXQuDQo+
PiANCj4+IFRoZSBzZXF1ZW5jZXIgZG9lcyBuZWVkIGFjY2VzcyB0byB0aGUgcHJpdmF0ZSBmaWVs
ZHMsIGJlY2F1c2UgdGhlIGxvZ2ljIG9mIHdoYXQNCj4+IHRvIHdyaXRlIHRvIHRoZSBiYXIgc2hv
dWxkIGJlIGluIHRoZSBzZXF1ZW5jZXIsIGFuZCB0aGF0IGxvZ2ljIGRlcGVuZHMgb24gdGhlDQo+
PiBmaWVsZHMuDQo+PiANCj4+IEV4YW1wbGU6DQo+PiANCj4+IGltcGwgR3NwU2VxQ21kUnVubmVy
IGZvciBmdzo6R1NQX1NFUV9CVUZfUEFZTE9BRF9SRUdfTU9ESUZZIHsNCj4+ICAgIGZuIHJ1bigm
c2VsZiwgc2VxdWVuY2VyOiAmR3NwU2VxdWVuY2VyPCdfPikgLT4gUmVzdWx0IHsNCj4+ICAgICAg
ICBsZXQgYWRkciA9IHNlbGYuYWRkciBhcyB1c2l6ZTsNCj4+ICAgICAgICBpZiBsZXQgT2sodGVt
cCkgPSBzZXF1ZW5jZXIuYmFyLnRyeV9yZWFkMzIoYWRkcikgew0KPj4gICAgICAgICAgICBsZXQg
XyA9IHNlcXVlbmNlcg0KPj4gICAgICAgICAgICAgICAgLmJhcg0KPj4gICAgICAgICAgICAgICAg
LnRyeV93cml0ZTMyKCh0ZW1wICYgIXNlbGYubWFzaykgfCBzZWxmLnZhbCwgYWRkcik7DQo+PiAg
ICAgICAgfQ0KPj4gICAgICAgIE9rKCgpKQ0KPj4gICAgfQ0KPj4gfQ0KPj4gDQo+PiBIZXJlLCB0
aGUgc2VxdWVuY2VyIG5lZWRzIGFjY2VzcyB0byBgLmFkZHJgLCBgLm1hc2tgIGFuZCBgLnZhbGAg
dG8gY3JhZnQgdGhlDQo+PiBhZGRyZXNzIGFuZCB0aGUgdmFsdWUgdG8gd3JpdGUuDQo+PiANCj4+
IEkgY291bGQgZXhwb3NlIGFjY2VzcyB0byB0aG9zZSBmaWVsZHMgYXMgZnVuY3Rpb25zLCBidXQg
SSB0aGluayB3ZSBzaG91bGQgbm90DQo+PiBtb3ZlIHNlcXVlbmNlciBsb2dpYyB0byBmdy5ycywg
dGhhdCBzaG91bGQgbGl2ZSBpbiB0aGUgc2VxdWVuY2VyLg0KPiANCj4gWWVhaCBhbHRob3VnaCBJ
IGZsb2F0ZWQgdGhlIGlkZWEgSSBoYXZlIHRvIGFkbWl0IEkgYW0gbm90IGEgYmlnIGZhbiBvZg0K
PiB0aGF0IGVpdGhlci4gU28gSSBndWVzcyB3ZSBjb3VsZCBoYXZlIGFjY2Vzc29yIGZ1bmN0aW9u
cyBmb3IgdGhlIGZpZWxkcywNCj4gc28gdGhlIGBHc3BTZXFDbWRSdW5uZXJgIGltcGxlbWVudGF0
aW9uIHN0YXlzIGluIHRoZSBzZXF1ZW5jZXI/DQo+IA0KPiBJdCB3aWxsIGF0IGxlYXN0IHByb3Zp
ZGUgdGhlIGxldmVsIG9mIGFic3RyYWN0aW9uIHdlIHJlcXVpcmUgYWdhaW5zdCB0aGUNCj4gZmly
bXdhcmUgdHlwZXMnIGludGVybmFsIHN0cnVjdHVyZS4NCg0KDQpZZXMsIEkgd2lsbCBwcm92aWRl
IGFjY2Vzc29ycyBmb3IgdGhlIGZpZWxkcyBmb3IgdjQuDQoNClRoYW5rcyENCg0KLSBKb2Vs
