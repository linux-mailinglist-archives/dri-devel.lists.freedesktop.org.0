Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC0ABE5484
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4221F10EA80;
	Thu, 16 Oct 2025 19:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ukaNpYzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBEC10EA80;
 Thu, 16 Oct 2025 19:49:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6RVScNJhs5DJvlvccgRQhXDOCHlH0/3x1HBcNrQxxIfwjNCRnmRQQe17w21+9O7bv0Ev4PGjtKAhvhPLp44kMNN4Bb8Ub3eFXl6vS2+nJauhWpUSs/O8TbX3+1+ojKo/jHaZOJKMwk/SR89Rdgn0fNDW+e0FNqXZCJUq+8EHVLLC/Wy3rwIVcymZczZqhkxd8eSlNGPWAV0E74G2MS0O5Wx4RO6U84X0oCn41XXhQBN2b0XekEWP75yz7hR73U4Oybjm+2xuSO2PuyMAINlxCPcsn35PA2HCrXDNESHTD+3lfPgP9pXZcKhZxdqcwO60KTT3wldnJTPE4jv3IpJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59zEpbsy2Ds9brG2Mt6M6spEsvhN1ud37QsMuNW0dlI=;
 b=Hp09adqBr50fP14XNgEjolaDK2b1EPYkZvi9+8+6KukNZ7Teo6Qec/v2216CZmehyaHYVEsxO37BbCR9bGWISHzTKZ3UGnq2cTmVvfmmtG9Alm5XFXIgOcacL21ZWg+moXmcl6kTagre4LGzdSECUcvJPWgPbh/uARTeBNnB9n2OpV3n7Neave2y0eeY+Kx1PyeNVwJk4RTzTq3kXH8tmaHfHkKuVWVuIzcTDpKGELCrJ18dX76ZpPoAIo3uaphMOc98m0pggT5/ja9VHFeUqHhAcbLy8Zm4W0rxMP5hNFnAv+szc9fw9nSRwIUbDBK026xZvy1hUXA3ofFE2sf0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59zEpbsy2Ds9brG2Mt6M6spEsvhN1ud37QsMuNW0dlI=;
 b=ukaNpYzszfPnMbQkNAYXugJKX1YYYzeRVHCmwsLl6Sr+5HoogA2Lt9m3GrQuQKtNWqnhhJ0fDHj8UJbCqX22GQkwdS1GgIG58AWwT5KW9+2XXftBZCKEGLn3f7YP437DLXuIyw1vrKxFUA8es1Bbyo6MQ4GAYRU3BGpq7tGdUuXV8q8GgVkKsbrixoIrIR9rIXzAhQuBpsO6mfkqd2dKHeTNRcw2RG6fvLzcSfiAMreaydKu4OSxgqSxD+viSi1bVuCr5d0Nl5CvTJAOv7GiwXQj5MCj+4rZh/pKhEB6CMyiSzvaIpoT6r7v8hzuCo5VgNu1vsGL8CeKbLNmOBGpyQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 19:49:43 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 19:49:43 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Yury Norov <yury.norov@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Alexandre Courbot <acourbot@nvidia.com>,
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
Thread-Index: AQHcPq9uIRJQMHT54kuQZ2/PdZxOLbTFDN2AgAAb/SCAAAGDAIAABEzR
Date: Thu, 16 Oct 2025 19:49:43 +0000
Message-ID: <EA9E9DCA-2223-4C74-810F-1CEDCFDA4088@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
 <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
In-Reply-To: <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DM4PR12MB7622:EE_
x-ms-office365-filtering-correlation-id: 76e82a5c-080a-477b-e8c9-08de0ced26c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dGZKenFRSHh3bTBUYzBPRFFiZ0hzdVJ3bDNpMnNZb0gvUWtPNndkdFF4TmdX?=
 =?utf-8?B?a3NxL21ITUdzajBlSVRPOUFwVkJpc1dhT2hxYlpFUjVGTGlHSytUekIveE5a?=
 =?utf-8?B?Q1ZEVUlLeEYvMTVid1RDTkJJZ0dIdC95b2pRTEcrUC90UHEzcnVySnlwUEhw?=
 =?utf-8?B?ekZIMWJNbmwxcHBpcGJQSXJOK2gzbk9wYlh3S2l2bm1nUXdVV2FwRHJiZllm?=
 =?utf-8?B?eElaT2pnNzFubTZZaFdCZGFTNElwcEhUeW54NTZWT0dMdUNwK1ZKZHpIOGY5?=
 =?utf-8?B?RWVXeEZHcWFrSEl1VWpRcHFQaDM2eW8walp3REJ3T3hRNEY2NnIrNGYrV1hT?=
 =?utf-8?B?ZkpKK0pBTW9PeVpvOTZwOGNIYStIdWRPZW1Lb0kwU1hJcUtMR0Fpb1h6TU9U?=
 =?utf-8?B?S2s4eFo2ZDdhNEt6dHd0NVNCcFhWUWtvM1F1S3N6MHhwL2I2TDFNaFVoL09m?=
 =?utf-8?B?K2FGRVFMaG9ncW5PMlhOaC9KSnJTcy80cHpVTWFQSVdDOUw3TSt2RU84REhl?=
 =?utf-8?B?aEJZWW1tS2trRmFkRTlxYkpydHlKQ0pCTFpkU1ZsKytxOWRaeWFDMEN1UmlZ?=
 =?utf-8?B?bWtxL3ZqWjVUVDJBcWFUUk5qUkNHWVRxZUw2TzlTVkJudzltRDdLLzMyUitx?=
 =?utf-8?B?LzBhVDRkc09nVHo1N3ByYUpIVklGUjNZQTYvRDBQakk3aFRuZWRtSkFCV0dI?=
 =?utf-8?B?K3poOVNqNTlkUlpsc2VraUdscWlPYnllUEFZMEJydGp0cU5aVVNxNTNRa0wx?=
 =?utf-8?B?ZXRhZ2RVczEwZ0RjeS9NOC82UVNlOG1idGc1YS9kWWJSZ0xFeWVEY2tqU2hx?=
 =?utf-8?B?SEczWk5Jd3h1MmdGaXZlSHpJOC9RMUJ1M3FETmtlcVNZQXRqR0N5REl4NzBr?=
 =?utf-8?B?OEYzajFpOGVHVTh2Y1lzOTJmbFVIREZyOFlraUFiSXFLS1ZSb3Myc0RGTnZG?=
 =?utf-8?B?RFVZN3Zna3hnL29vbG1WTU44QnNTaGpiR05tNG12M1FFUXFoRXhJWEt3V2xP?=
 =?utf-8?B?WUY0dGo3NEgrajJkNEFYMnlaK2hDV3R4amVtUllKMUQ2empTZmtGY0JXaEo1?=
 =?utf-8?B?Y1F6MndtVTF5NnJ0c0I4RzVaUmh3N0Y0eWM1bUZUOForNGd3c3hKU1l6ODdT?=
 =?utf-8?B?M0Q3UHFCZktsS2kwU2xnZVZMMDgxZWFiMzE0dFE3MjV3M3lHOXJOcUowTHV1?=
 =?utf-8?B?Y2MzSVppN0MzNk0xRTM0VU9Hd2ZocXNZSkE3NVA2eGgrbFVZUUNNeWp2Z241?=
 =?utf-8?B?dWowek5pRFRQUHV4NWJTc3NQM2dhaFdGUUMvd0dURGp2LzR1QUdrNEF0Qk5l?=
 =?utf-8?B?dFBEazE1SDA1TjB5Ni82WDBuUjQ4by9FelAyMVNoZnppaWZpTHAxYkRkSk5O?=
 =?utf-8?B?QTVkRWxmRVZuMW84cHI0RnErVFQ5cTJIU2VPejFkVmxsZEZ4ODF1VUN5ZWV1?=
 =?utf-8?B?UWpReGxUN2ZSQ1lrTmJhSGUwNHg3cE5GTnptS1FOQzREWWJDbGdxTVl6RUxt?=
 =?utf-8?B?bldERXFiaXFKdnp3azN6dFdFaGkvR3RPVVhwcTdXemI2N3RjMlE1alV3SE9M?=
 =?utf-8?B?c2RITThFTWFmbFpMdGkyd2xuOUVqWml1UlRqcUkwWTczV0dkdldFUkI5ODQv?=
 =?utf-8?B?YlFrY3NZMDlPVDladzRFRHAvUms5VTBvTjRvMFJDSW5aT012QmRiRzhVZmdt?=
 =?utf-8?B?azFiRTN6UmJjbjQ3THN3SEtYSVg4dE9rSWtJNTZmNEZ0OGNFU0dqR1NSck9a?=
 =?utf-8?B?eFJsTWpFc094Z2I5VW5aVk5RL0svR05zQ2U4R21FQ29qcHVqZ3ZIdXpvMEJE?=
 =?utf-8?B?ZHE2enVza3FpZzhqa3Q2Q3JRa0dvQXJWQ2ltNkJ1cStkQUxMLzBVdlIzZmxF?=
 =?utf-8?B?M2oxZE9xTFErOENUSWppWmQxK0tCWThNbmY0TmQ4N0FsY214YndLTEJjdlNk?=
 =?utf-8?B?ckowTkQ2T1ZXZTM5RlJCUXBEcDU2Vncvd0Zucy8zcE5sb0xnWG50ZkpqSUp1?=
 =?utf-8?B?TXhkdjRaWUhtQWh5a0gxaE9oMk5Gb3RuUXBMR0ViVHJDd04yS2VBRGtwcmt6?=
 =?utf-8?Q?sYkOEO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVBqajczdE9wOFdBaW1PZjIxMVZKaVB0T1ZJR2pIZlljQ0k4U1BZWmMxZE1G?=
 =?utf-8?B?Sm5JNUFOSVlIVFpEclFVZytyUjBaRkNLQ0tST3A0ZDB2bUJFdjN2WHRHN0N0?=
 =?utf-8?B?eFplUjZpQVp2NkFxR1M4Mng3YTIzeFdPNVJSYXd4RkswVWd1eGhqQmUxTElD?=
 =?utf-8?B?cUNQOXBjSVBlYTRIWlV4MzZFNTVtNkEyTTNjTjRoVFpSZElCOHV3WCtCbWI2?=
 =?utf-8?B?UHhEdVdMYUZMMWR1cW1zczE5SzBuSnh2TmF0ZGkwcVpReUdmTFpWOFUrVHZR?=
 =?utf-8?B?QStNUEY4N0pPQm1qRVhvTDlDb2YxV3N3OExwbFZod2hTYkpCV3NGSnZpQ1BL?=
 =?utf-8?B?aXFGNm5qVWo1ZVMrQThmSC95K0N5dDZwd2ZhNmtLbzZqaCtYcXRzS1hyLzF3?=
 =?utf-8?B?eDVmMWRvdWJUVE1TR2RlalV2OXBUL05uSUwrSDV6SGE5UGRGNE5PUFZocHN1?=
 =?utf-8?B?eHIxblRJUlc5WFdmZXZxS29maE5VOWtDRGxuMVJmbEtDWk5BMCtVa1pxc2lQ?=
 =?utf-8?B?TUhwT0tmeFdRUnNDblpLSFVaWFpReWlENDRLMUFZRHpWbHN2ZWlJVDExeXR6?=
 =?utf-8?B?WkQyUFFCV0FJNDZWUjJaWFVlbWY1QmsrbU83MXc3L1dIcTJ3YmdHSEIxdThr?=
 =?utf-8?B?ZlcwMG90WGErVnN4NnV0UWhoSXFpQXdjalJVTU05dDVhUmFPTGNCSVJLZER3?=
 =?utf-8?B?WUFkSThKMmVkaktLb0Ryb2doR3lLVyt0aDJLU3BvalB5RDErTlNxNVFRR0ww?=
 =?utf-8?B?ZnFYSlZwR2Y2SmcwQ1RHT1dHYkNDUWhFM0tEbW8rNURjdnIzVjNxMmdCQTZZ?=
 =?utf-8?B?dlEwUWJLbnJOZ2xRSWZQV0VHb2w0MERTbDFac0IxdDZXM0FYQ3ZxMnFiRE11?=
 =?utf-8?B?RyszYnBHMDNNb2V1N1ZkWUt2ejUrWCsxTUpZVHY5Yms2aDR2emlJN3RSL2FF?=
 =?utf-8?B?Z29PSVdYc1pDUWRtYkNyUDNDRXVrVFhRT2NHNlVNRkEzaUdhUExJSmk0TlVr?=
 =?utf-8?B?RzhVQmlyMTgwRGk5aWN1bFVJcXIwTWc0QXQ5eVZxUUpNSWprczdGMGFTcmIz?=
 =?utf-8?B?ck41OFIwK3prenhpRTdMd3czeExHL1dySExpcTYxQUFUM0FGMGIwYmRRNzZU?=
 =?utf-8?B?Z2lIb0RWK2dVeGI2NHREZHpDMTM1MXRER2l6M29iSlhoVDBFYnhrbUhlc0ZS?=
 =?utf-8?B?L0tSbjd0clZyNU5jM2ZmdjdsNXFidlozcnFFZnpBc3pvL0hidDZMeWdPQjJR?=
 =?utf-8?B?NUFQZzB6aDRDNkRBMGFJNlZzdlJlSGo2RjNpOFlzQ2F3T1RMU0poUnI1Ni83?=
 =?utf-8?B?Rk0wUy9VZUFVSzRLWnREMFYzMGdsUGJOMVh0ekdIY2RlZjJOejEwMG9MQmJh?=
 =?utf-8?B?N1lqeWZpLy85aDhyNFRNc1QySFo0YkNIUUNrNlVWdXRjMExBTlo2Wm5ZclBB?=
 =?utf-8?B?bmVFcnhnWXZLRjlybVNGSmZwcDBDRS9xM1VSTi83eGJuNGlERXVya2xmTG0r?=
 =?utf-8?B?NitHWEVXVWN4R1VONStlQitpWVFTL0J4T1RwcTF5ZXVUcy9OUWJBalQ4aTZ1?=
 =?utf-8?B?SktOQWh1TEdmaG9XVGpmMnZ6Ti9tUDJVL0tRODFXb21ybDFOV1FiaHAxc1dZ?=
 =?utf-8?B?NjdLd2twajVrSWE2amlCVnNHbzZoWmJXbnF3L3JaSFdwSkpoaitEMFd3TzV1?=
 =?utf-8?B?YXBWbzEySDFQZTlWcUFlQUphU0FVaXRnVEdvOTE1ZkpwOW0yaXR5c3RWcTMw?=
 =?utf-8?B?VnlIRCtQRWhUL2NMODFTMmJCQm9xeDExWWxFeFRTWGxKMzh3WjZVbnZmRHFi?=
 =?utf-8?B?UVc0ZWZmaHFZcXU0RnFuUnhNYTNLNnExbDNDU2lsOXNUT1JjblhDNGdsc1lI?=
 =?utf-8?B?S2RVam1obURrN21wV08yek9FTnlmdlFBUEhJdkhLcmdXM3BtcHd6dUg2YWNG?=
 =?utf-8?B?cVdzV3F3dHNpb0Z2M212Z21GWTZuSDRoMGdwa2tjMllWemlKdkMzVzRNalVW?=
 =?utf-8?B?Y3JiNVlDdkh3dk1nUm55UnErdDdqc2RCR2FZNTM2WW1FNFgxNGlFcGNRYW5q?=
 =?utf-8?B?M1QzeXRJQW42Tmg0YUhhaXp1bmFTcWFMSmYwNmdReHBDSHZtTzViRVhMUzIr?=
 =?utf-8?Q?Bc6de4Bw467DLSOGWWhdR4BO7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e82a5c-080a-477b-e8c9-08de0ced26c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 19:49:43.0596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pOXh4KjwDiN7beTvLxIihCqu9cfVK54rsMfGl7BrqIoY+HxcbqT07To9sspE5xMR7xehRKAd+cvqQXYqumIfkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622
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

DQoNCj4gT24gT2N0IDE2LCAyMDI1LCBhdCAzOjM04oCvUE0sIERhbmlsbyBLcnVtbXJpY2ggPGRh
a3JAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiDvu79PbiBUaHUgT2N0IDE2LCAyMDI1IGF0IDk6
MjggUE0gQ0VTVCwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6DQo+Pj4+IE9uIE9jdCAxNiwgMjAyNSwg
YXQgMTo0OOKAr1BNLCBZdXJ5IE5vcm92IDx5dXJ5Lm5vcm92QGdtYWlsLmNvbT4gd3JvdGU6DQo+
Pj4g77u/T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgMTE6MTM6MjFBTSAtMDQwMCwgSm9lbCBGZXJu
YW5kZXMgd3JvdGU6DQo+Pj4+ICsvLy8NCj4+Pj4gKy8vLyBiaXRmaWVsZCEgew0KPj4+PiArLy8v
ICAgICBzdHJ1Y3QgQ29udHJvbFJlZyB7DQo+Pj4+ICsvLy8gICAgICAgICAzOjAgbW9kZSBhcyB1
OCA/PT4gTW9kZTsNCj4+Pj4gKy8vLyAgICAgICAgIDc6NyBzdGF0ZSBhcyBib29sID0+IFN0YXRl
Ow0KPj4+PiArLy8vICAgICB9DQo+Pj4+ICsvLy8gfQ0KPj4+IA0KPj4+IFRoaXMgbm90YXRpb24g
aXMgcmVhbGx5IHVud2VsY29tZSB0aGlzIGRheXMuIEl0IG1heSBiZSBPSyBmb3IgYSByYW5kb20N
Cj4+PiBtYWNybyBpbiBzb21lIGxvY2FsIGRyaXZlciwgYnV0IGRvZXNuJ3QgcmVhbGx5IHdvcmsg
Zm9yIGEgZ2xvYmFsIGJhc2ljDQo+Pj4gZGF0YSB0eXBlOg0KPj4+IA0KPj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC9DQUhrLT13aG9PVXNxUEtiN09Rd2hRZjlIXzM9NXNYR1BKckRiZlFm
d0xCM0JpMTN0Y1FAbWFpbC5nbWFpbC5jb20vDQo+Pj4gDQo+Pj4gSSd2ZSBhbHJlYWR5IHNoYXJl
ZCB0aGlzIGxpbmsgd2l0aCB5b3UsIGFuZCBzaGFyZWQgbXkgY29uY2Vybi4NCj4+PiANCj4+PiBJ
IHJlYWxpemUgdGhhdCBydXN0L2JpdGZpZWxkIGRlcml2ZXMgdGhlIEdFTk1BU0soaGksIGxvKSBu
b3RhdGlvbiBoZXJlLA0KPj4+IGFuZCBHRU5NQVNLKCkgZGVyaXZlcyB2ZXJpbG9nIG9yIGhhcmR3
YXJlIHNwZWNzIHBvcHVsYXIgbm90YXRpb25zLiBCdXQNCj4+PiBzb2Z0d2FyZSBwZW9wbGUgcHJl
ZmVyIGxvOmhpLiBJJ20gcHJvYmFibHkgT0sgaWYgeW91IGNob29zZSBDLXN0eWxlDQo+Pj4gc3Rh
cnQ6bmJpdHMsIGlmIHlvdSBwcmVmZXIuIEJ1dCBsZXQncyBzdG9wIHRoaXMgaGk6bG8gZWFybHks
IHBsZWFzZS4NCj4+PiANCj4+PiBMZXQgbWUgcXVvdGUgTGludXMgZnJvbSB0aGUgbGluayBhYm92
ZToNCj4+PiANCj4+PiBJdCBkb2VzICJoaWdoLCBsb3ciLCB3aGljaCBpcyBvZnRlbiB2ZXJ5IHVu
aW50dWl0aXZlLCBhbmQgaW4gZmFjdCB0aGUNCj4+PiB2ZXJ5IGNvbW1pdCB0aGF0IGludHJvZHVj
ZWQgdGhpcyB0aGluZyBmcm9tIGhlbGwgaGFkIHRvIGNvbnZlcnQgdGhlDQo+Pj4gc2FuZSAibG93
LGhpZ2giIGNhc2VzIHRvIHRoZSBvdGhlciB3YXkgYXJvdW5kLg0KPj4gDQo+PiBJIGFncmVlIHdp
dGggTGludXMgYnV0IEkgZGlzYWdyZWUgd2l0aCBjb21wYXJpbmcgaXQgd2l0aCB0aGVzZSBtYWNy
b3MuDQo+PiBJIGFncmVlIHdpdGggTGludXMgaXQgaXMgb2RkbHkgdW5yZWFkYWJsZSB3aGVuIHVz
ZWQgYXMgZnVuY3Rpb24gcGFyYW1ldGVycy4NCj4+IEJ1dCB0aGF0IGlzIGEgZGlmZmVyZW50IHN5
bnRheC4gT3ZlciBoZXJlIHdlIGFyZSB1c2luZyBjb2xvbnMgd2l0aCBzdWZmaWNpZW50IHdoaXRl
c3BhY2UgYXJvdW5kIGhpOmxvLg0KPiANCj4gSSBhZ3JlZSB3aXRoIEpvZWwgaGVyZS4NCj4gDQo+
IFdoaWxlIEknbSBub3Qgc3VwZXIgb3BpbmlvbmF0ZWQgZm9yIGdlbmVyYWwgYml0ZmllbGRzLCBm
b3IgdGhlIHJlZ2lzdGVyISgpDQo+IGluZnJhc3RydWN0dXJlIEkgdmVyeSBtdWNoIHByZWZlciB0
aGUgaGk6bG8gbm90YXRpb24sIGFzIHRoaXMgaXMgdGhlIGNvbW1vbg0KPiBub3RhdGlvbiBpbiBk
YXRhc2hlZXRzIGFuZCBUUk1zLg0KPiANCj4gSG93ZXZlciwgaWYgd2UgdXNlIGhpOmxvLCB3ZSBz
aG91bGQgdXNlIGl0IGRlY2VuZGluZywgaS5lLjoNCj4gDQo+ICAgIGJpdGZpZWxkISB7DQo+ICAg
ICAgICBzdHJ1Y3QgQ29udHJvbFJlZyB7DQo+ICAgICAgICAgICAgNzo1IHN0YXRlIGFzIHU4ID0+
IFN0YXRlOw0KPiAgICAgICAgICAgIDM6MCBtb2RlIGFzIHU4ID89PiBNb2RlOw0KPiAgICAgICAg
fQ0KPiAgICB9DQoNCk1ha2VzIHNlbnNlLiBUaGUgbWFjcm8gY3VycmVudGx5IHN1cHBvcnRzIGJv
dGguIEkgd2lsbCBmaXggdGhlIGV4YW1wbGUgZG9jcy4NCg0KdGhhbmtzLA0KDQogLSBKb2VsDQoN
Cg0KPiANCj4gLSBEYW5pbG8NCg==
