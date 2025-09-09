Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2FB4FEC1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481E610E77D;
	Tue,  9 Sep 2025 14:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uHFpnhqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5B710E77F;
 Tue,  9 Sep 2025 14:07:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYOdkiCl/pqITMPll9MDf3E8M7etfFkcMWe/WZ4sAB3ZZmqklPxtlgJ9ntZ7laugJHYT9Qs8B42phoPvJI7dcQSiAD7dRdriMIC+OQdQlYznFvhUKcIyK6i5fLKNesGXUQFCkHrv5PyGMXhv48/x4XffEVa9Du6dRQ5osBph5b8XBE7XCZAwIr4Ep73uzk7s1mloJAk/+hfNLTRshTRQaLxmvnwLa5vt+sHPSH07dmSbfqING7VAFTotV9+mQ+i37i0A0JRDdHGieJx7lIlz8ay8X9p1NDoENoxG1lSg92by39+2fuIp4LEqDUds8Dwy9k4b8nbgF912ipofos2m9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sam+QjQQ9eMsjtri5qclOymY+KzWX4k71iQqkyofeUo=;
 b=Zn9iRM/FFtxZXsJ7w7wpywHuw8UkVz+of3jDfBmjCm53ein/N8xCyru87lu0+OvUkMU9rNbgxkXTsk+T7KhXNtLm/4ToFNRscewUDzRNVbV7rp/QTiBv+xSir0Hghd7e9uyaZoKn3g42HEFmPtORx7pJH5OIc+zU5+Seq16KiatryO+0Nld63MY0pB4U0qt8rEfM6iGDDNxNPu7yry4Gl9rKFjEnNdVei/O0+zosUH1W4DgwUcNAv1wsknhJb2OwAn2HcjWVZeNNecQ19ChmcSPDtCFyBtE25oAj+xNkk4ENHUgwcASmJDjxxINJDBfLw01XiRDiHgMok4rBjVeqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sam+QjQQ9eMsjtri5qclOymY+KzWX4k71iQqkyofeUo=;
 b=uHFpnhqhkupQ8zfyCNL7gIzcw48dw4lT1sADblpNfOaNFiQ5GWgZHnrlGbLtYJHHURLhpBT0Z2kDn5J0TU55y8iEB49s3HZ2tROlsRo2CUrE2xErtke2skFxwZ5rvDklqwvTP3Ld7y+82RUTKL/OmraW+bM++7rVYB3+ljcXR864gmii8fYjQhkfafx6eP2msf6y7p5WEb5EeYO3lGu3xPuMImti6Q9IM4AJSTZ3vxlPcxslj6HH54HA7rdFCWqVcKhwnBZTfWbiWVO46in/JNN9FiYxU77NS661cODNiXmwskkGzDK392vr7XhO+s8yZ2RJIUG2bP5xZFWIwsbSTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:06:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:06:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:39 +0900
Subject: [PATCH v4 03/11] gpu: nova-core: add Chipset::name() method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-3-4dcb433d5fee@nvidia.com>
References: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
In-Reply-To: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:405:4::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: b9940488-c021-4e7b-c39b-08ddefaa23a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE5EcVpWZlJOSzc2UDlrS010YVZ2dEFVMC9LRWN3eHM5blVpV0lSMnY1YlVL?=
 =?utf-8?B?RHBTaDlGNW50YnQyeTNrbUQzWTdkYlB5UTF4ai9OOUh1V3REZVNLcWxZV1V6?=
 =?utf-8?B?NU5YRXdkeW1WK1dySlZtZXFaWktMNmgvU3RUS0w1eFN1WEJobFRWT0ZGbm5U?=
 =?utf-8?B?aVh3SjBpWm9hYktDU2FyZlZFa0w4NXFwenVWeWRuL0xMZjlBNXRwRDZ2c2NW?=
 =?utf-8?B?eEppTSt2NXUydFhSNmt3OXdqQzQvSEw0Z1BTL3paZzRybmJWbG9rUmNnR0NX?=
 =?utf-8?B?NjBQODdqNDA5Q0t3M09QVTZ5bUVBTGxoVCtXUEU4WmRFNnRGdHZiWk5Vc3Bx?=
 =?utf-8?B?Rm9OZDZpNGdYOFJPcTNyTENqR2V0dFRxbWdWZmIvQm5CVGZsZkhpY0V1ZXFK?=
 =?utf-8?B?OTZTNHdxVjE5cHo5Y3NXaVNNM3dsM3Vzb1BVL1lJd2VsWEdkL1VLM1ErbXZw?=
 =?utf-8?B?TkRuMCtYaC9FZFRvMEJKMVlyS3BWMjQ4MWNONy82Vmg5YkxTZ3ZzeFZSTXhP?=
 =?utf-8?B?UWxxRGx0RXpWNk1UZERUMHVRbllEN2xmRXpUZ054bmFkUVpnSEQwQng1M1Zm?=
 =?utf-8?B?RHZ6bEVZSlVob0Q4eHpwb2ozbEkxVnJOcHJxbXJiVjlrd0JTdUdLQ2pqOW9S?=
 =?utf-8?B?eEcrSStYc1NiUm9ya016dEp0OW1IOWRURWNPMFhveVpQbnhWU3h4SDhEbHp4?=
 =?utf-8?B?cnMxZ0ZBWU5QTmwzQi8xM2lIOVBBSk1TK0NGMFdXYUZaTTMxZ21BR3huYTlE?=
 =?utf-8?B?TERtOEVYa0ttcVp0YjR3ZlNDVGw2V3QrbDRzaUN6cXFvNlN2Ry9BTXltVWhx?=
 =?utf-8?B?cndWdTV6bTY1K3I3TmYwVlhSQVB4TEwzam9zcmFUZjFqdHRtVDlGc08vT0xH?=
 =?utf-8?B?aExvS0t1NENQNmwxN0RXU0lwVEpWM1V3c2ZqMXZNZzlCRVJ0Q214cS9oRlR3?=
 =?utf-8?B?QXhOQThsTmlQdTUwV0ZTd1ZuRW5JMC9HMHhBTlpOWHZkbm1GaXFyZUh6YVox?=
 =?utf-8?B?Y2VZcU5FQU1NM3pXWmFvVm4xRHRRVzJ3ck93a25SVkpyMXB0YzVQZzNrOHNN?=
 =?utf-8?B?WUJiT25zVE5reTFnTy9rYXFmT0t0eVpzZFBaa1p6UUtQVm8vZzJlOEdvcWZX?=
 =?utf-8?B?UiswSFRwN0R4WEVvNVl6WWI1RVdjT1dFeXhlSkI5TG03WFJmT3hjbHhlV1B6?=
 =?utf-8?B?dnoxSnFvV0VId2FPemVlb1pRa28yY1dQMHp2V3F6ZEFkalgwSkRjNGJOdW4r?=
 =?utf-8?B?WlRKb3NNWGxSWnJpdERRN3hhWnJuUTJTa0VxZmpjMkhSbUZJb21wN3VFdGND?=
 =?utf-8?B?L1QzVUxGZVV5aG5aYUs0b1FzYUpLU2dKZVJkekZja2EwUlB0clRrempkNzJr?=
 =?utf-8?B?OVV1Rm1vQmdpem4wY1k2TUNZTERiMFcySUdJNjFuOW5LQlZFQlhNcWZWNXFw?=
 =?utf-8?B?UmNWbHFpUnVBcnRORE9HN09xTjhXOGJWMkhxWGRybFFGZHozaHYxQVNxZkpC?=
 =?utf-8?B?NUxxZWdDTlJReEsrVUZ0SnplODQ5TkVHZDhTSXEveTBlZDlMUW5aelFaRUVZ?=
 =?utf-8?B?ak1WYjRaVWxBd0JROUI3YmZ4OWVNdThsYUtXZjY2amlPNXF0RHdyNitrckxF?=
 =?utf-8?B?ajY0aHhTVnpjczE0OWpxdURwOFo3SDVkazdiZHFURUgrczEzeWJGdG53NWln?=
 =?utf-8?B?OUhEYTY2eDhoMjYvRE5qYTE3cXN1MmxpazJvNERtZTgxWjlCQlZDMGRIbWJY?=
 =?utf-8?B?VGQrc0tWVE9FejU2U3FlYlpFV2U2U2FLWnhCUWpKTlV0a3RyYjFlWXpjaEtx?=
 =?utf-8?B?eGx4Nyt3VHVEV3BTc0lFK3JWaWJ1SVdURVZVdzVEODVWUzcrNjRXSnJpYUdY?=
 =?utf-8?B?U2NQUlY3TEoveWJia0ZiV2ZLdjNkU0pOQ3ROMmUzQ1ZlMksxMEJPa1kvUWZi?=
 =?utf-8?B?cHFQNzhxRDIrNGNxMGJ1WlpzTXhHdGN1VHFHQUM3ODJ5Z1hMaWJxVFpBdmF4?=
 =?utf-8?B?RkRvbStQOTBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWU2VFNpenVndFNEQXdLUldpRjlPYzlKZit2bHU5ZEM3OW9wYmdSYU9OODdU?=
 =?utf-8?B?MUtJUGVkUTRYcDJKbFZqUkk2R3QrKzJmQ0lUczRrS0dwQ3piZVRmL2htLzJk?=
 =?utf-8?B?OWxWSFRQYTNTZHFPQTdqV3BOOWJNMDVPRG9reEhUSWhpbXVDZHlQTjRYb3Vr?=
 =?utf-8?B?eGtDSkp6a0t6U3pzcXpBdFZMMnJ2SUVzVjlIL0NHcCtoMG1XckkxOVNzWFNH?=
 =?utf-8?B?Q0lJRHRPK0wzbHZmbXhXTVhEeWNxcC92bEM4UG95STNsVVNoSVh5ZVlNek9D?=
 =?utf-8?B?OGJmYnFSOGVURXBhc0FZRjByQ011RFlWSitxZVlIS1JDd1RaN3Q1NUM2N2I0?=
 =?utf-8?B?elBaUXVkOGYxeDFSRUZWRXFaVDBuN0k4QkJTaU91UEFTNGR6cGx2YVlhWk1I?=
 =?utf-8?B?WFY3VVhKRjNKQUlXT0EwQUIvU2Q5S250Ui9ma1FoUXc2S3F6azUyUFhHcWpj?=
 =?utf-8?B?UklqT1BEN3MxSHNPbzdNcEZrd3lSaXhrZjhKeExSRmQ5OUZNOUlVdXFpUlNK?=
 =?utf-8?B?b1N5aDcrV0w2Q3RFNFBVRnltNEdULzlVbHBlUVhQWE1NQStSZW55eDZ6YlpQ?=
 =?utf-8?B?bDdLZ1NNTHpVbkdaK0t6cjFMUDBpMEJPZTNFMnNMZWNCd2xLcEVWZUc3eEtq?=
 =?utf-8?B?bm5zS1NGL2RqeGpXS3FNZHdxbHU5QjA1UlF1WlZsd3RoSHhIZ0NJRGRsMDMz?=
 =?utf-8?B?SlhwRnRVT3U3dnMyRE10enJoTHhsbWFnME1qY0Z3SWlRWXI2VHZlQ1cwT3Nk?=
 =?utf-8?B?Nk1pYldwTmRxY0pCQWhUNEJkMFc0Y01uNzg0a0RwbEFZQjl6THE1UFlIdDIw?=
 =?utf-8?B?VkZ3a0xCNzBtMzhaOTlaZFJtUk51cTFaWmt3aW5QejdFRjFiMnlFbDhqbm5r?=
 =?utf-8?B?Zkg3V0tQSk44VDhJYmI5azEzVFQvdUFvL3oyell0Q3hRU0dtV2pyRTduZjBS?=
 =?utf-8?B?V0Z1bzdvaVpqVTYxYlI0ZWhlYkJWWUpOSk54OEZ3VWxza0l0U2xnMmtUV2VL?=
 =?utf-8?B?YzlDam84RWpIdmFwbTRVTURsRC94VklCQ3FYVUFyYlduaC9wZk85OXlDT3pQ?=
 =?utf-8?B?Y3lObk5adG0vcnFDalFGVmJNL0lwZlI3aWlhTm1lTU5ONzZqNjZMbnBEUklR?=
 =?utf-8?B?Z2NsTVRpZGlrWTJaT1hWQnJZQUl0eXhDRlBPaDVDQVg5SnFoelVISUVEaWIz?=
 =?utf-8?B?ekxBclZwamhJTTUzd2lQcDdvOW9sellvWGY4aHZwZ3dacG01NWVrdzdWbjZX?=
 =?utf-8?B?S09XZEsrOWdqOGUwTXBOR05PMG1vQ3hhcTBLSFNIM2E5YXpLakorRzRKVEww?=
 =?utf-8?B?alp5VGhiTmtscGlsZkxjNkc1V3B4STc4TTkwMmJBWFErdDZwSHBFaVlZaUFE?=
 =?utf-8?B?bklhM09EQ3ZjeXhDRFVuSlIzbmcwc0hhOERidnF4amMrV3RhaGx4NTlJTkk3?=
 =?utf-8?B?WTVSd2RXbG1lSlpaZ0VBTTZPM05oTy9SRURtWEVVbEIzTGZqaEMxbDQwZWpy?=
 =?utf-8?B?eFNhdmowajJRUXdUbGhuNnBGNWprY0x6ZHE4bWRoNUV2Qm1ZL1dqa1JxT3Zl?=
 =?utf-8?B?b1Z6WFF4VWw1WU05TXdMc084MWg0NXNYeHUzKzgvLzNRK2tyWXlRNU5yOHNw?=
 =?utf-8?B?OXdMdi9KS0UxZUtJc3JwUzdWUDVtUkFqb2ptcnRMMktaeWRiUDUzeFhiWng5?=
 =?utf-8?B?N1R4MkJWRDBIbGUza2xPY25Dc2oyek5QQ2p1cW9GbDNLTHo1ZUdwYTdJNUNH?=
 =?utf-8?B?djkreU5VNWxYL3BFaFZMQ1kxVy9aNkgwUUlKc1F6dVdsS1d0LzZINVlSVW1r?=
 =?utf-8?B?dVBCZVZqaGJERWRCTmJMZXZVSTRUNFBRYmZoR2tXTVQ1cW5jWGtLRzQ1WVV2?=
 =?utf-8?B?WmI4WmlDT2VlMGlBMWZkWCswbWpBak13dmxxWVFveTBSdEpyeWlJdUVhTmhr?=
 =?utf-8?B?MkN0RkRNYzU4QVJ3cE5LM2RpVVNjZEtlcnM4dytKWlpqR0JaM0s5U09IbFhE?=
 =?utf-8?B?Z2pwU2hnMlphWGcyaks0Q0pwRUpGeGdFTWRnSlVBSEJNbXNSelVIQ0ZKM1c2?=
 =?utf-8?B?NUFwY0hPZkF1TWtubWFnRmFBeXJMZ0pEN05vc1ovSldwT1VkaURCUTN1SDdR?=
 =?utf-8?B?UW5ETVpxemRUenA3YWlpVzJqSUhtWlRWb0FUcGNoSzJxMHJES0R3b3ZXdWVo?=
 =?utf-8?Q?tHakuKBW2RpEwssI2KEFR3VMtrKGPKykBFuSkm7BSKyH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9940488-c021-4e7b-c39b-08ddefaa23a5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:06:57.9401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDIo1BPZ8WS2MTfamXEBJ7S+Wtn31v85NSfbBR3TpbIhC+o9SJ2A3w6rrJSGyQuUagVRYv4Zu/MKiv8/XCi/bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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

There are a few cases where we need the lowercase name of a given
chipset, notably to resolve firmware files paths for dynamic loading or
to build the module information.

So far, we relied on a static `NAMES` array for the latter, and some
CString hackery for the former.

Replace both with a new `name` const method that returns the lowercase
name of a chipset instance. We can generate it using the `paste!` macro.

Using this method removes the need to create a `CString` when loading
firmware, and lets us remove a couple of utility functions that now have
no user.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  8 +++-----
 drivers/gpu/nova-core/gpu.rs      | 25 +++++++++++++++++--------
 drivers/gpu/nova-core/util.rs     | 20 --------------------
 3 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2931912ddba0ea1fe6d027ccec70b39cdb40344a..213d4506a53f83e7474861f6f81f033a9760fb61 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -30,9 +30,7 @@ pub(crate) struct Firmware {
 
 impl Firmware {
     pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let mut chip_name = CString::try_from_fmt(fmt!("{chipset}"))?;
-        chip_name.make_ascii_lowercase();
-        let chip_name = &*chip_name;
+        let chip_name = chipset.name();
 
         let request = |name_| {
             CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name_}-{ver}.bin"))
@@ -180,8 +178,8 @@ pub(crate) const fn create(
         let mut this = Self(firmware::ModInfoBuilder::new(module_name));
         let mut i = 0;
 
-        while i < gpu::Chipset::NAMES.len() {
-            this = this.make_entry_chipset(gpu::Chipset::NAMES[i]);
+        while i < gpu::Chipset::ALL.len() {
+            this = this.make_entry_chipset(gpu::Chipset::ALL[i].name());
             i += 1;
         }
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index cb991c7faef5523459367f3b9a7fd9cc29671b98..444beda52a4166e7052e980231dd870237354c3a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -10,7 +10,6 @@
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
-use crate::util;
 use crate::vbios::Vbios;
 use core::fmt;
 
@@ -28,13 +27,23 @@ impl Chipset {
                 $( Chipset::$variant, )*
             ];
 
-            pub(crate) const NAMES: [&'static str; Self::ALL.len()] = [
-                $( util::const_bytes_to_str(
-                        util::to_lowercase_bytes::<{ stringify!($variant).len() }>(
-                            stringify!($variant)
-                        ).as_slice()
-                ), )*
-            ];
+            ::kernel::macros::paste!(
+            /// Returns the name of this chipset, in lowercase.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// let chipset = Chipset::GA102;
+            /// assert_eq!(chipset.name(), "ga102");
+            /// ```
+            pub(crate) const fn name(&self) -> &'static str {
+                match *self {
+                $(
+                    Chipset::$variant => stringify!([<$variant:lower>]),
+                )*
+                }
+            }
+            );
         }
 
         // TODO[FPRI]: replace with something like derive(FromPrimitive)
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 76cedf3710d7bb248f62ed50381a70f8ffb3f19a..bf35f00cb732ee4fa6644854718a0ad99051666a 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -3,26 +3,6 @@
 use kernel::prelude::*;
 use kernel::time::{Delta, Instant, Monotonic};
 
-pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
-    let src = s.as_bytes();
-    let mut dst = [0; N];
-    let mut i = 0;
-
-    while i < src.len() && i < N {
-        dst[i] = (src[i] as char).to_ascii_lowercase() as u8;
-        i += 1;
-    }
-
-    dst
-}
-
-pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
-    match core::str::from_utf8(bytes) {
-        Ok(string) => string,
-        Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
-    }
-}
-
 /// Wait until `cond` is true or `timeout` elapsed.
 ///
 /// When `cond` evaluates to `Some`, its return value is returned.

-- 
2.51.0

