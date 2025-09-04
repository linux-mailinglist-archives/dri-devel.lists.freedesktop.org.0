Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F379B43A46
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752F010EA07;
	Thu,  4 Sep 2025 11:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VwXzKxYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49EB10EA07;
 Thu,  4 Sep 2025 11:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxH16BRJjwh9ApEA6hLGuRBkthU1yFBDpZYfwzrFpqv3WvFbQInfDZvQizA67rne03l6yXcNfuJJgiwiPxMkFjdlbBEPaDdT8GPecpxvSUPyl+JEYOQMjSG7SepmDr1X4wk704IU0/Y7YnS7myKy2bpeZN1SSyCqJuiHhqDm5bkRsxKtcBipaZHcwxeYmnEveQjqq2zracYPLef2fxSi/6sq46wgF6hKgp/6QT2NqmNVEviFItGx/6C+JbMJ21vwhVE3cqzYpuCGjoND9RLn0ieEHCkoogB7frQMrHTQUzXXokIyRqkPnb1ObjQXhGhjEA6F6K41vHLUn4xCUwTLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9E99DCQgpGYJKWAdQRY11M4yIwFG4Kv8Zx8nbhnWrI=;
 b=ZEMmEWWPwQtY90KDvfgOhQLnllvQiqUIfd4yrfz1CkzoWbCIRDs64C8q7dS9aUwqvb3EIbWHGdfdMhcPmD0iZb5Pqyah5nCQew/2xU+rQ/vTPN2n/3XSYdVYz63bQBXmT2GhBfk1/nVchEh1lS/Nvf7tPrLrZl+ZNoEPW85kT2SiA2M8C3ejgsjD0h7t9ohh6+BzBQR4BKfiMk112DS1BK2DbpD5mVM3YU+K8a8xHrV4N+9sh38PgptwEUu4gpvRlT/JXWuOBK1SZnOdiYcSRDI4tdPtHlmWWqFflwfR9T0UDxiXXGOsvMShf9VlBF+oozwt74lbzXcoZcS4rhcoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9E99DCQgpGYJKWAdQRY11M4yIwFG4Kv8Zx8nbhnWrI=;
 b=VwXzKxYyucv3prYqj7Z4/7zPOxGQdOQeXm1sbhceNb3XVyUBUsOdwiraBPYM5ZFnkuZFN/FX6KyJUuwdOwCWDQk4B/y3Ccm1bTpv6n8Czao/cQrrdkv8WkO0qnp/UL+dwGGrU9AAGMH+zWdLp6F03/iMESaHT8WCk6O0kzKorj2L0c8GYp190N44RdrwTJZZw6p3DIWZkmvv98RweYDLOexl4LuElkagnK7zm/1yygQ/iXMVazlxj2qrxM0tLwr+D1gDbTv4DRfjAvr+YLCU0iEFE3FUMylnkRPofrWZKnWpAZh7SDh7dtN9R8B8rzj+jmFIJg8nJJS+XIcgdWIY4w==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB7795.namprd12.prod.outlook.com (2603:10b6:510:278::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 11:33:53 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Thu, 4 Sep 2025
 11:33:53 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Alexandre Courbot <acourbot@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, Alistair
 Popple <apopple@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
Thread-Topic: [PATCH 1/2] nova-core: Add a library for bitfields in Rust
 structs
Thread-Index: AQHcFP9mydaUsviYL0KPJ5QjT1cfF7RzNsSAgA5qTACAAMmaAIAAQugAgABIBQY=
Date: Thu, 4 Sep 2025 11:33:53 +0000
Message-ID: <DEC556AB-8E6F-475B-AF9F-11973F7A92B1@nvidia.com>
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
 <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
 <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
 <DCJTY0OQFG83.1AX49CQARXCEX@kernel.org>
In-Reply-To: <DCJTY0OQFG83.1AX49CQARXCEX@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|PH7PR12MB7795:EE_
x-ms-office365-filtering-correlation-id: 652fde97-113e-43a6-a875-08ddeba6ed8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?U1JXOVJGR2dNbVlld3cxUWw0YW1icDVMSktpU3NyczFEMzNvYmFLK0tFT2NT?=
 =?utf-8?B?SmtWMlJ4TVdUK000NXIxK25CT2VGdVZybUNuUUtLRmY2dFQ0Q0t2ZVZ4VjJy?=
 =?utf-8?B?Z0dLQVRIdnFYOWliY3p5ejAvVXFkNmlYTnNtU2pGb1RXZjlRLzBvaGZSRnBm?=
 =?utf-8?B?VEIyaHV5eHIzbjAwSWg0bXhZZ2p0QURWZGNUQVEwSklXTXloVC9RRnVJZFNW?=
 =?utf-8?B?VmJpVzh2VEVVblNzdjV6WkZyNGdXK3QwV3pPZHI0VEFBcVdBR0RDc2dZM2NO?=
 =?utf-8?B?NWRWZFVWYnBKZkRWczIyMkNsVDFXZjhlMVlYM2l5bm53NWgrSFZ2ZEZHYmhu?=
 =?utf-8?B?bFhsU0pkd0ZjSUNHU3dPanhva0dRRUxxR0gyMmZ2TW5xakQxK2tMeGg0MDI5?=
 =?utf-8?B?UDh5V2FkWEE4aUVWcGRaT3JWUzA2ekVRYm15bFVqMHVwUzNnRXJKS0wrWC9M?=
 =?utf-8?B?dFpLbWlwb3ZWNnJMekk2K3U3WHFheGRqbmkzYmppMWFXSEU0YUY5bEdLRExS?=
 =?utf-8?B?RUpTalkrUGNKUys4cEtzTXVNUzZMQ2FGSFl5WGpvam5wQnJvWVRIUGloMjNO?=
 =?utf-8?B?bktLMk1NZzRQbXNjU1VjQjA5bmp4RTBPdHo0bGJ0eHJrMzdoNHVsckpML29w?=
 =?utf-8?B?Vy9HbDl4dnRTSXJPYVVrQUJ1R0NUNkRlcFNhVi94RzkyZ1lRWkFLajNWa24z?=
 =?utf-8?B?Y1R2VVRwYjdXQlBJanNxbWpzNjdTR1hjdHJaQmMwWFZaNldyRlFZdHg2Rk50?=
 =?utf-8?B?THppc2FGODFhcHFJVEpiUE1Ld05QdWhGd0t1N21PV3gxRzBFUnBUZFVHM2xo?=
 =?utf-8?B?dnd5cXVKR3h3T2pJdFpOQXl2V1ZrYjNheEV2d2JNUTVRM3dNa2I2RDlQNlpZ?=
 =?utf-8?B?SEJRS2p1QTdpN2ZEaURYekRCSnNtWDJ4NHZPcTFmanZtOVR4VW1KR0tEV3Ft?=
 =?utf-8?B?NEpQcWkya2ozTnE3aWk5d0lNc0U2NnFQaUt5bXJCU0xMdTUxZnNKV2xLRlVl?=
 =?utf-8?B?TlJ4bVlmQng0RXhSWU85TGdwQTBKY1AwdWtaTVZoM2xlL09aRU9uZjIrcTBP?=
 =?utf-8?B?R3JQRWU4eHRvWGx5ZXhQSGI4WXJNVU9RM1BzdG1zUXhWRGpiNUNCZWJxdkZS?=
 =?utf-8?B?d1piZ3pZT0JBMTVQQXFuTFVKYkdMc3k5cTBvRGkvYStrRTVTQ0ovcHVZejZC?=
 =?utf-8?B?a0o3WUNXR0U3aWt2dFltYUkzOFJOK3RRTEhnakZvbmc4V3lzNVNSRDBaTEg2?=
 =?utf-8?B?bHQ3dnNIUjg2N1RiMGUrcldHK0IwK2J1dTRveWtsenh6RFpTUURwRmVHSUxQ?=
 =?utf-8?B?eWpEV283dytjcklISEZET0FUQ0k0d0lNYUo4S0I3STRDQitqU0tQdEwrSUlm?=
 =?utf-8?B?djdQY29WVERoZk8zTTFBWTI0VUU2bWxvbWxiZFo0YjZHRy9QN082T3drTFB4?=
 =?utf-8?B?NVF4ZnppaEROVEM4RStJcy93ZDRZbjBaZzBXQm43K0JaVW1YaE8wSFExUW5K?=
 =?utf-8?B?NEM4TGFRZzhXUWw4RlVkMHRXOE1DNHpZTUw4R1QxR1JOMGhqNTY1bHYwcnhY?=
 =?utf-8?B?UDcwNU91dEgxb1Q4TFRrbHNhZ3RPZGpya0I1SWppaSt3dHVmVUlnWThIWENB?=
 =?utf-8?B?djB3VGR3c2g2bU4zeU9EOXpLeVVXTkFWNjdKbGZtT3hvVk1pTW5XQTEyVG93?=
 =?utf-8?B?YkJPUDYxZENPcGpwblJLWUtUblRkWWF5NGhBMDF4WjFncXhoZnlRTGtMODdk?=
 =?utf-8?B?UVhrOVViaEJMOHVsNnVkT2Y0ZHVlbXhhVWpkcmc4MFBmZVFPTWVNOUI5dmFY?=
 =?utf-8?B?aDdZYTY1S20wNHZJcGNBc0VUbTNUakVaSXhFU3p3ZHZXMzFxZTczQnBjdmVU?=
 =?utf-8?B?QVBrV0NMSURFaGlOWklWNTJmTm5uNzl4bzNJQjlnVU8wc284bU1VUzdCN3Nx?=
 =?utf-8?B?TTY2alZrNGdVV3M5WHNDV3RZVmdEQkFmWjBSQjdnN3hRM3U5ZUZKK0VndzM4?=
 =?utf-8?B?L0w1cDAvekxRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWFqL3JoNDVySHRlaDM0UlVwVWpRT3RjeVBobFZzK3U5WCtiZ2kyVVpqN2J1?=
 =?utf-8?B?ZnBVZTI3cjBzbXJVTDkrR2VEWW15UStpd1p6NjMvY0RTWFk4eFpVeENscDF6?=
 =?utf-8?B?NjlZTzJUbUpVRERDL2VxSWUzWHVtUUd0OWVrZ0VZUjlGaUZBNE5WakJVVUpa?=
 =?utf-8?B?dG9JVmZibnhyTHJETm1aOEpYYVl6N1JFc3BOakRGcTBUWjlnOGdNclIzTU1l?=
 =?utf-8?B?ZlhmMnhBcXZyREJSdVF0S3pKdWtJL0FzcFRWUGJGV1l0UC9zdDBUVUZFd1NS?=
 =?utf-8?B?bFIwZXMrT3YvY28rSU9ON3JZbDc0YlUvWFdSWFRybTlWaWRWM2pSNWg1SEdv?=
 =?utf-8?B?RzQzMmFpdVBDT1BHdEIrRFZpQnlnUkJ5R292K2h5Rzh1MjNBVzVabnpQeFNH?=
 =?utf-8?B?bmg3bDVJSW4zNEFWMXllaTM2a0NDUWxibXJHQTV4N0xtaHFDc2RhUXB4dnFX?=
 =?utf-8?B?a1BxdTg4Sy83czdRVXc4SkNUOSs0Z3U5alFDWWw3YVh0YkpwM2M3QnpVdmxn?=
 =?utf-8?B?Q2VxT3N2Qytrbm50MlNRdkFlNWlFcDhUS1lqTDYwZnR4ajk5d0E1YnM5SUZp?=
 =?utf-8?B?RTVuUlVFSnM4cENvQUZ3L3lNYjNJOU4wM1dRblFrZWwyY1BKRUEra3puYjFN?=
 =?utf-8?B?Y0xXK1lDQkw5eTcyaDZ3dmRueG1xdU9pY1VXcHp1dWx5b0RmR1oydStSMW9o?=
 =?utf-8?B?K1lGZkNKUm5pNWZVWjNzckhiRDJBZ0thcHpTOFhaNWhvRDViWUVwVmJPSm03?=
 =?utf-8?B?ZXNJUVNqWGJadjhRRllwL0MxeHZnWUpGKzZMRFZUUWw0QmFQN0RDRkozSlds?=
 =?utf-8?B?Ukw1SlVyVktUcG5Ra0NCYk1zbzJEYWY4QnJPb0MxUjhacW9kUWVaZXNITmk3?=
 =?utf-8?B?T3VWQlVyVWE2TUZJSWJXT0tKU2U2ZmZzQnp2TGNqYXNUV3Z0Q2pDeW9ybWQ0?=
 =?utf-8?B?TWx5Y1V2OXZyQnFjMXIwMmhZL0tlUy8rT0VOL0p6c3lRWEdrNFEvT1Bpa1Yz?=
 =?utf-8?B?NEU5RDVFS3JWR1JGZGE2MEo5eUVLaS9UL2VmUVpkbzh5cVNNN0l2eG84OUcw?=
 =?utf-8?B?K3NHSWtIeXRHd1hOdVNwSCtPVkFVSG5NZEJCMVcrL3JhTTMvc1p0Z05IT2tW?=
 =?utf-8?B?THRKTG5KRmJOcW5oSzBCTVpHdklBVFk3S3FpeEM5d0pVbDVSMW0zZE5FbnBs?=
 =?utf-8?B?VXZ4RkNVd0ttZkxJcmVWRCtlSy9MeS9OTEt3d0F1U2Q3V1NXbmJXS0VvVVd1?=
 =?utf-8?B?ajUwSnNsY3ZIYWRIUGtJNmJkOVkxck44ejQxNlRYR045cXNXTkd6OXpUUDUz?=
 =?utf-8?B?QTVpK28rWUxnVklzSzJlZnk2TTY0bzVnNWJxeHR6SW0xTnAybzBmZXdPQXpK?=
 =?utf-8?B?V3BMbjhxd1ZsT3Y5WTZ4cW5zMVBNaEU1WGhWZW5BamlPMFE3UWl4RlZYQk15?=
 =?utf-8?B?cEVyYnlINkVTbDNHR09OQ1lrR1BTQ0ZwQXpGZ1hiYUpSU24ySEFGZEw5czhv?=
 =?utf-8?B?dFQwbWZVZVYzcTUyMkswakFSZHh1VW4ranJiRW1TOHBVK1kzMkpXVkk1QnZK?=
 =?utf-8?B?dmVyNFdpMmUrWkM5WjJuRjBjOXgxSFA5VjRkaWMwaWF2c2JVUVgycnp5Z1Z2?=
 =?utf-8?B?M2J5Zlg2eC9qWTZocm12T2JoYi83dXJZcy9oemxGZ3hORFhTU0FhVEUzaFlz?=
 =?utf-8?B?UUFUaHJVNmo4RkJ1a2ZlYjQxcGVTTzljNTdLai9xZkJtbFBYVm1nbHQrYjVL?=
 =?utf-8?B?M3owVWRZZnNlblpzUWtCWFZlbHFRQ1ZkdGo4aU1hTG1lNXlIWGhPZzIvY21L?=
 =?utf-8?B?enEvSFhHNGxXNUQ4Y0hFaWZkWmt2VXFkTXVodi9nL0Iva08wNXQvdUtaak1D?=
 =?utf-8?B?S1NHTE5qMXVHYmE1VGUycEpzckZVaVN1cnlmelRyVEpwREVnWDVncktHOTQr?=
 =?utf-8?B?L2hSUEtpczVHejdaUk54TTRTWGJtY04rKzhCUWtFaVgrSmNIUCt3MW1iRzht?=
 =?utf-8?B?ZGpxSk5LOGFuK2t3NndITk8xdjlsVWs0Z2lDc0dZYmhMQVlENStHQUN3V1g3?=
 =?utf-8?B?S00yaFp5Umx5QlNDM01PazNIRTlsb3BuZW8vQlh5d3VzY3ozc1dmZHVSSWJq?=
 =?utf-8?Q?QOTwplajvZCS+jRkgRWuy0/7y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652fde97-113e-43a6-a875-08ddeba6ed8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 11:33:53.8678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrRZM2m+VGSBBV6Vk7hWBgFMJ6IEElVufKAUtkA9tRPKLqvhJnbCFGOOQwnDTRUAR8oAS98bEUu1BsE1099K6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7795
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

DQoNCj4gT24gU2VwIDQsIDIwMjUsIGF0IDM6MTbigK9BTSwgRGFuaWxvIEtydW1tcmljaCA8ZGFr
ckBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IO+7v09uIFRodSBTZXAgNCwgMjAyNSBhdCA1OjE2
IEFNIENFU1QsIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOg0KPj4gT24gVGh1IFNlcCA0LCAyMDI1
IGF0IDEyOjE1IEFNIEpTVCwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6DQo+PiA8c25pcD4NCj4+Pj4+
ICt1c2Uga2VybmVsOjpwcmVsdWRlOjoqOw0KPj4+Pj4gKw0KPj4+Pj4gKy8vLyBNYWNybyBmb3Ig
ZGVmaW5pbmcgYml0ZmllbGQtcGFja2VkIHN0cnVjdHVyZXMgaW4gUnVzdC4NCj4+Pj4+ICsvLy8g
VGhlIHNpemUgb2YgdGhlIHVuZGVybHlpbmcgc3RvcmFnZSB0eXBlIGlzIHNwZWNpZmllZCB3aXRo
ICNbcmVwcihUWVBFKV0uDQo+Pj4+PiArLy8vDQo+Pj4+PiArLy8vICMgRXhhbXBsZSAoanVzdCBm
b3IgaWxsdXN0cmF0aW9uKQ0KPj4+Pj4gKy8vLyBgYGBydXN0DQo+Pj4+PiArLy8vIGJpdHN0cnVj
dCEgew0KPj4+Pj4gKy8vLyAgICAgI1tyZXByKHU2NCldDQo+Pj4+PiArLy8vICAgICBwdWIgc3Ry
dWN0IFBhZ2VUYWJsZUVudHJ5IHsNCj4+Pj4+ICsvLy8gICAgICAgICAwOjAgICAgICAgcHJlc2Vu
dCAgICAgYXMgYm9vbCwNCj4+Pj4+ICsvLy8gICAgICAgICAxOjEgICAgICAgd3JpdGFibGUgICAg
YXMgYm9vbCwNCj4+Pj4+ICsvLy8gICAgICAgICAxMTo5ICAgICAgYXZhaWxhYmxlICAgYXMgdTgs
DQo+Pj4+PiArLy8vICAgICAgICAgNTE6MTIgICAgIHBmbiAgICAgICAgIGFzIHU2NCwNCj4+Pj4+
ICsvLy8gICAgICAgICA2Mjo1MiAgICAgYXZhaWxhYmxlMiAgYXMgdTE2LA0KPj4+Pj4gKy8vLyAg
ICAgICAgIDYzOjYzICAgICBueCAgICAgICAgICBhcyBib29sLA0KPj4+PiANCj4+Pj4gQSBub3Rl
IG9uIHN5bnRheDogZm9yIG5vdmEtY29yZSwgd2UgbWF5IHdhbnQgdG8gdXNlIHRoZSBgSDpMYCBu
b3RhdGlvbiwNCj4+Pj4gYXMgdGhpcyBpcyB3aGF0IE9wZW5STSB1c2VzLCBidXQgaW4gdGhlIGxh
cmdlciBrZXJuZWwgd2UgbWlnaHQgd2FudCB0bw0KPj4+PiB1c2UgaW5jbHVzaXZlIHJhbmdlcyAo
YEwuLj1IYCkgYXMgaXQgd2lsbCBsb29rIG1vcmUgbmF0dXJhbCBpbiBSdXN0DQo+Pj4+IGNvZGUg
KGFuZCBpcyB0aGUgbm90YXRpb24gdGhlIGBiaXRzYCBtb2R1bGUgYWxyZWFkeSB1c2VzKS4NCj4+
PiANCj4+PiBQZXJoYXBzIGZ1dHVyZSBhZGQtb24gZW5oYW5jZW1lbnQgdG8gaGF2ZSBib3RoIHN5
bnRheD8gSSdkIGxpa2UgdG8gaW5pdGlhbGx5DQo+Pj4ga2VlcCBIOkwgYW5kIHN0YWJpbGl6ZSB0
aGUgY29kZSBmaXJzdCwgd2hhdCBkbyB5b3UgdGhpbms/DQo+PiANCj4+IExldCdzIGhhdmUgdGhl
IGRpc2N1c3Npb24gd2l0aCB0aGUgb3RoZXIgc3Rha2Vob2xkZXJzIChEYW5pZWw/KS4gSSB0aGlu
aw0KPj4gaW4gTm92YSB3ZSB3YW50IHRvIGtlZXAgdGhlIGBIOkxgIHN5bnRheCwgYXMgaXQgbWF0
Y2hlcyB3aGF0IHRoZSBPcGVuUk0NCj4+IGhlYWRlcnMgZG8gKHNvIE5vdmEgd291bGQgaGF2ZSBp
dHMgb3duIGByZWdpc3RlcmAgbWFjcm8gdGhhdCBjYWxscyBpbnRvDQo+PiB0aGUgY29tbW9uIG9u
ZSwgdHdlYWtpbmcgdGhpbmdzIGFzIGl0IG5lZWRzKS4gQnV0IGluIHRoZSBrZXJuZWwgY3JhdGUg
d2UNCj4+IHNob3VsZCB1c2Ugc29tZXRoaW5nIGludHVpdGl2ZSBmb3IgZXZlcnlvbmUuDQo+IA0K
PiBJIGRvbid0IGNhcmUgdG9vIG11Y2ggYWJvdXQgd2hldGhlciBpdCdzIGdvbm5hIGJlIEg6TCBv
ciBMOkggWzFdLCBidXQgSSBkbyBjYXJlDQo+IGFib3V0IGJlaW5nIGNvbnNpc3RlbnQgdGhyb3Vn
aG91dCB0aGUga2VybmVsLiBMZXQncyBub3Qgc3RhcnQgdGhlIHByYWN0aWNlIG9mDQo+IHR3aXN0
aW5nIGtlcm5lbCBBUElzIHRvIE5WXyogc3BlY2lmaWMgQVBJcyB0aGF0IGRpZmZlciBmcm9tIHdo
YXQgcGVvcGxlIGFyZSB1c2VkDQo+IHRvIHdvcmsgd2l0aCBpbiB0aGUga2VybmVsLg0KPiANCj4g
WzFdIElmIGl0J3MgZ29ubmEgYmUgSDpMLCBJIHRoaW5rIHdlIHNob3VsZCBhbHNvIGxpc3QgdGhp
bmdzIGluIHJldmVyc2Ugb3JkZXIsDQo+ICAgIGkuZS46DQo+IA0KPiAgICBwdWIgc3RydWN0IFBh
Z2VUYWJsZUVudHJ5IHsNCj4gICAgICAgIDYzOjYzICAgICBueCAgICAgICAgICBhcyBib29sLA0K
PiAgICAgICAgNjI6NTIgICAgIGF2YWlsYWJsZTIgIGFzIHUxNiwNCj4gICAgICAgIDUxOjEyICAg
ICBwZm4gICAgICAgICBhcyB1NjQsDQo+ICAgICAgICAxMTo5ICAgICAgYXZhaWxhYmxlICAgYXMg
dTgsDQo+ICAgICAgICAxOjEgICAgICAgd3JpdGFibGUgICAgYXMgYm9vbCwNCj4gICAgICAgIDA6
MCAgICAgICBwcmVzZW50ICAgICBhcyBib29sLA0KPiAgICB9DQo+IA0KPiBUaGlzIGlzIGFsc28g
d2hhdCB3b3VsZCBiZSBteSBwcmVmZXJyZWQgc3R5bGUgZm9yIHRoZSBrZXJuZWwgaW4gZ2VuZXJh
bC4NCg0KU3VyZSwgdGhhdCBvbmx5IG1lYW5zIEkgaGF2ZSB0byBjaGFuZ2UgdGhlIGV4YW1wbGUg
Y29kZSBzaW5jZSB0aGUNCm1hY3JvIGl0c2VsZiBhbHJlYWR5IHN1cHBvcnRzIHRoYXQuIEkgY2Fu
IGRvIHRoYXQuDQoNClRoYW5rcy4NCg0KDQoNCg0KDQo+IA0KPiAtIERhbmlsbw0K
