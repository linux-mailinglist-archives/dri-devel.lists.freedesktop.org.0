Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MS6EnUGfGnBKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 02:16:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1663B61B4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 02:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480510E331;
	Fri, 30 Jan 2026 01:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="ml42NyGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021072.outbound.protection.outlook.com [52.101.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A350910E270;
 Fri, 30 Jan 2026 01:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nP7WWS28p4WtF9/szG7RIX3hK5DFeQ93ZaRXaIKxw/BZA1VZOPuEAV5R40FnGNr8ZYPpjOWqeItmZ8qQQ7I3hVb7ARrxTTViRh/Q5CQrkF/NWsQzADhjZgAUKB28lxtnk+LM/wY5DbxwdqAEytOmPfez2+ryNmhC2pMR4JKqt+4PeIxjM4XMkec9+8Mz9rdSN3m3h81C9nIMzSZ3nIJyPlJ0IyEK1xH3conxj328WVc5MFXXZXnAyNFEvBfTTKZqgHU4yb2Y+6LU2eRuZ1UAI/ZD+b5zHYEbaUKRuvWA7NkkD3Z2NfKDNa6XK+WoUF/dInfLLUICpcs79JaCVdN32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eb5T1e+WC+h/T3w62dnzLnirX9OdDJiXHInDcxku7N4=;
 b=hr2psHUH9xA4/bayhkUYSkAbbL9del7AL9NvS6Ar5v6nqLd2QaMbq/oeu4sAExCRr9fuXmAr37y77GtD0SHTBuK6tNkfjyGFiC7s14QuoM+ZTHTn16xdRzcuuSb9KMU84xBXuTm6Kia3R6ovK5rEtnxFnSl09YhkdLih67+CoCVArikFYve38XTj4Efg0UpVmfaBMSnJqzv7779p2fmVPPxUrWKxtds63c3lnpEBOsZeHcBGOoRxloJWfXFOj/1Un8hG22InMYWgtV1mEV8QaCfVcJQOJej1bqK9shBXBH1lH77sk90NxgJutWku86eGKXt13PLh3J9tLET1CVqtjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb5T1e+WC+h/T3w62dnzLnirX9OdDJiXHInDcxku7N4=;
 b=ml42NyGf8sAVmdlQBIssTPw2b4pW4ezOzH1MhFXJRCQntSPimmpaqbxp/8V1kL8DCuQEEXNOWHWTb6rex81a2atCS7H9AJFzeRMka6HCPJi9xL2ldu6mXw74/UqNu2RwIe6j9lmhpnanVmutkNK1O429wA8LorcoCrVFfL1m/bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 01:16:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 01:16:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 01:16:26 +0000
Message-Id: <DG1IZ8T0FFM2.2WTUZ3AESF9RD@garyguo.net>
Cc: "Zhi Wang" <zhiw@nvidia.com>, <linux-kernel@vger.kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 "Christian Koenig" <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>, "Helge Deller"
 <deller@gmx.de>, "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Bjorn Roy Baron"
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Alexey
 Ivanov" <alexeyi@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp
 Stanner" <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
 <20260121100745.2b5a58e5.zhiw@nvidia.com>
 <e186973c-ce31-405a-8bfa-dc647737a666@nvidia.com>
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
 <DG07HZN0PL87.X5MKDCVVYIRE@kernel.org>
 <20e04a3e-8d7d-47bc-9299-deadf8b9e992@nvidia.com>
In-Reply-To: <20e04a3e-8d7d-47bc-9299-deadf8b9e992@nvidia.com>
X-ClientProxiedBy: LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd3f3df-d13f-4742-8881-08de5f9d3156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFIxSmpwd1ZBeDhUWGlqWU9vcTNUaGZvL3FtaVBhdTBoV3BmckFpM0d6VnB0?=
 =?utf-8?B?S05KclJCSmY0K1oxd2tDR3hjSlFnMFRXbk5qdXZoVkFuMVQ1RWt6aC9wc0tU?=
 =?utf-8?B?bDhFNG1OcTFoUkZhajFSL01Pcjk3Z2E5VlBxWmMxeUMrT2Fqa2FwdjV5WUJk?=
 =?utf-8?B?b0JkU3RDRjZtRnU0MXZnZ3hhbXlWejM2aUdCeHFGbGpFbjQ3enYwd1JPZGd2?=
 =?utf-8?B?ZnI2cFNsN1Nxam5qa0hCMnVrZmsvSUtybzJ1c2JtT0N1TFNUWE1kQjNKd0xG?=
 =?utf-8?B?NmoyMk00M0l1UGxpVUFOMTNPZ29tTEE0V1QyMWlQKzFhdzJtSDI0d21ZS1BP?=
 =?utf-8?B?YzBsak4waVdTeWZDa0ZaSVNpVlVQUkwrTDB6WlJkQmUvbkwrTjk5MW5DcWFW?=
 =?utf-8?B?QmRNWUFuNlJYVUE4M0lOaFYyKzNQQ0RuMnVTUUtONDRiMEczRXlGV2tkeWxM?=
 =?utf-8?B?S0ZRSFJENTNyRk42OC9vS0RyRWNjSnhtWUx2alYrL3lOYlZUMTF0VWYxTmtK?=
 =?utf-8?B?dXRCTHpaYmg3UnNqMktKTTZYMFRPVXlSTFZ6R1pqSVJwMlk3SWVzNi9VWnRp?=
 =?utf-8?B?Y3orUFJDK3AvK3BXanpCQ0tuNU5Eend5enlIeU9Mb3JwaWZ6ZHJCZm5SQlhZ?=
 =?utf-8?B?NEtFbG15N21NZlM1dFJBeVArNEdna08yNWxPNGhxRDhhSHVsZDFySTU5Y2U5?=
 =?utf-8?B?WUlRc1d5R2FENE16WmQzRGtPNE5nc21KNXFFZFZqZXp4cFNFV2s1a1MvTnFZ?=
 =?utf-8?B?OTBJWkNucmkyZW9yTHlNWG5pRkNsQXNvZWVRRUNhK3ZHVTZlcSs0NHB2MENw?=
 =?utf-8?B?NVlYTWlhTExIQTE1cDZLVW41MTdONXVRMUIyNUwyajhiUHdnc2RUc1RzNjI0?=
 =?utf-8?B?YnRadmZYRnJrOGxwYWNuOUNxc0hpUHlML2xvTjUvZ09yd0FOM2xwK2wreXcw?=
 =?utf-8?B?WVVHaHBQL3dWdWlVY2o3MVk0SEJDWGgyY1YySHVGbnM4YWkvb293OWVjQjg4?=
 =?utf-8?B?VUU4V0E5ZGk4a0wvSk5USnRTMkdNb3duMDc0LzBhY0lGS1I4R3lBUTdiTjFY?=
 =?utf-8?B?VDRIa2VjYlhvL1o0U0c4UGFQb0xWeXRqVWZQMjB0VG1LbTB0RjdrOEtodnFr?=
 =?utf-8?B?YzZockxHZmRKVnBMRVlzR3h5OGtId0FieEg2S2cvNHZ6QlB3K1BlWFVzSEdv?=
 =?utf-8?B?ZXRSdHY2eUF2bVR3Q3M5WDMzNEJ2MDlWdDhlSmVnVXhoTmZ1ai9QMVJMbGhi?=
 =?utf-8?B?MW9qRmNKYVI3T3VYeHpJd3ZReCtjUzZpUjA1cjBLLzQyVTRsQTdmSnZWQWt6?=
 =?utf-8?B?Wk9yQzRmRjZlZk5yK1I0WmxUMkFSVHNzcU1NYkZ3YzlXOFYxVEtQWUhwdzNz?=
 =?utf-8?B?WXlZc0dUTExDdFozalU2M3JYTmVhSjBjZWJ0SmtJejFRWnFjZ25VS2pQbGRw?=
 =?utf-8?B?NWF6NHZsVmN6UGRCK1VIWTl6RlRCakxTd3l2QVJMM2R5M2Q3dWtTYnVmc2hR?=
 =?utf-8?B?aVBCS3NMb3orekRyN3c3cnVJTlBUZXZHVWFLcWk5alRiTVhuUmd1aEZqRmRC?=
 =?utf-8?B?WWwrblVyNlpyUFNEUDlBdlBKZXJCbXlyTlBnNG52MzhhMjlWTDVnR2dsSlpK?=
 =?utf-8?B?RjdrSkJ4NVA4aVZ4ZlJEand6dk5qZWRBazN3UnhJVGxvK1dXOGFteU9ZcFZh?=
 =?utf-8?B?UTYxV2V5ZGxXNzRCandrRXlqbDFNT1hVMkt0TEI4QUlwamZPZVQ2UE9zQ1Zh?=
 =?utf-8?B?ZTdpbDFvMERuMHp1T0VPT3RqZllXQmNxcWJHd0JjV0ZtQ1NUZkFnQUNmYkF4?=
 =?utf-8?B?aHg2MGJVd2xSYm0zK05QaStLcjFVKzNVMHBaWmtLSlB4cmsvY3Rla3E4OGdT?=
 =?utf-8?B?dGdWeDlrWFJ5TVlvODJvQjkyVUlSQXZBdEtHbVpoVEhiR1JWR2hpc0dvWWg5?=
 =?utf-8?B?RmdmNTI5RTliTWpSWWM0QnhWUjZsUzM0L1VCb29DK2FRTFVkSWRQcUhSeWUy?=
 =?utf-8?B?ZlBPRnZuQUs5OFUzc3o2QjYxd0YxcjJsVmM3SHgvU3RhUUxPSk9GcWJHUGgr?=
 =?utf-8?B?VFhZanRlRjZaREI2Q2pKMmNLcnRCOW5zb2kzbnV0OExDa3NDV0YrQlVFOUhr?=
 =?utf-8?Q?zUIE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K09ZVkE0cHZialhlM1IvbTNLVjJHMnl2YlN0czdIQzVTMzJWMHRhU3VuNVVY?=
 =?utf-8?B?SDlOOERCOUhDUFBQOGdNbGtZVElFd3RwZFJKNEdmN0hpOXVVRFJQb2crQ1BE?=
 =?utf-8?B?T3J5N0szcDhXclZCYkdPZ2JmZXdldWRzL01aWmZicDhsQkhrTUJUWGJrVkMy?=
 =?utf-8?B?ZHJFSnNFTUdwelBDaDdFVXBQcUtPREg4ZzdNMXE0WWlaR0RoRWs5U2ZURUp5?=
 =?utf-8?B?cEhoNzZNUGVDRFFGK3lXNU9GRHl0NFVaQ3NQV1BiNFRnU043STRueXIxM0V4?=
 =?utf-8?B?MS9hUHhGYnJyZXNvb1dxOWNJWVZuRU0rczV6SXY5Z2Z2Ukx1dVdQZlQ0MjE3?=
 =?utf-8?B?ZEtxUGZJRWxMOEk1bEppWVJvc2QrMEVuZlF0NUtFZE9OajJraU11RXQ0Z1Uz?=
 =?utf-8?B?L0V2ZFUvOUp4VFZjUzExcncwTGlMOUZzUlZYMTQvaVNvNGlWcnJKOXFJWXlI?=
 =?utf-8?B?THd3UlR5cGtwSjNBQzJzYmhhdmhwSjJtTmhWS1ZicGtQSlBLS3RwOU5PMnd0?=
 =?utf-8?B?ek1EWm9WZ285NFBvd3BWT0lNY2x1VDVXTHMyU0xZY2ZGazU1VzJFdStlalM2?=
 =?utf-8?B?RDZNYjE2aGtkMVdSZlJJL1ZJZDdWY0hQcDJGOVBsVS8rMStQdmgxaFQ2eWRr?=
 =?utf-8?B?Ly9EOXNCbXBzcHlFdCtycU1MV3JzYVVvLysvSHpVSVNBbkZSdHVrakhHNnBr?=
 =?utf-8?B?aTMvQVRKVlJwSEsxcnBTNzVqWk9VUHhyaDlCUk5IdTdDRlorKytLVEtnTDVX?=
 =?utf-8?B?YjFIbmZpSkhZbGVuWTJIalNxU3RzMUhCV1BKRnYxNWg4ZTUxdHlGR0hLQlBu?=
 =?utf-8?B?RDRSTnN6MnR4dFZML2VMSUJDRGtwbXlHS3E1ZnloR05UUVd3MTZHK3p5eHov?=
 =?utf-8?B?N1NvenNHdjF0NVE4ZHNOb3ZwVHFEYXF1dForNXR3cjhWRGp4dytIbENmQ1RB?=
 =?utf-8?B?S1R0VWUxVUhHM1ZPRkVXWGdPUWlDaGNveG5VcUYySnUrcG42bTdwNkpGcXpa?=
 =?utf-8?B?VW5WK29VNmt3RCtXYUwyMmttcUdTWFdSRHYzSnFObVI1SkxXcTNnekJHOWw1?=
 =?utf-8?B?dzVjdDVDVWdnVVhINlpHQnhRUTlRcjJXUG96OThCblpGSys2MndVRzZjbWxM?=
 =?utf-8?B?bXJZalBGc2Jwa0dmWE5xRXp1WGtqaExtdzZpNGxsV29yWE1ER1ZhZEFGcTV2?=
 =?utf-8?B?MmUxcHBKSDdkYWZnRVo4TkR5WFJ2SjFLaEcveVJSNFI0dnNMV2lkTXZuYXFS?=
 =?utf-8?B?a0VvejlsYXdaQ2QzVWE5Y09UOTdqNUZyYnhxTGhtZEJrdlU2anZtZisxS28v?=
 =?utf-8?B?a1FDMmJ5T3dIUUNVWDNNc0xLelp4OFBERnNZYWtIeVBncTFQZUk4RllqMFpr?=
 =?utf-8?B?ajRCaGxZWktidmFGdGRJR2liY3BtcUM0TmpDbldvaFJpcWxsTzVZc25WZVlZ?=
 =?utf-8?B?VEpDbVViNDBXdkwxWHJKdEpidm9NQmdDNVRVWVhKUnk4Tm83WWtCMmhocDZI?=
 =?utf-8?B?eUh3V2xFN2Y0NjJrSXQyYXViaVJ0bXRzRUt1L1MwK3hRWktpdVFPa3RHT1hZ?=
 =?utf-8?B?RHhjRFYyMlkrdzRubnRVc28zWStNWkVnVEJLY0hJY2plaGFPVytSOEl5bmQv?=
 =?utf-8?B?SFNzN00xa3NyNzlzRG51UUN1RWdrVGEyd1ZjZXlDUU5XZ0cwUHRvVUVoczJF?=
 =?utf-8?B?aUNYK2ZjbFJUbEd2UGxwbHQzc1RoRjR1SkFCK256Q3hMY2JWQy9RVzZ5Z25y?=
 =?utf-8?B?YVNXTWtpODVKSGloNmFjVld6c1JMTWdtTmVnQ2sxRVF2bjFMcFhVWUtYc3da?=
 =?utf-8?B?Zi9UY1F4NzFlOTFzZEJMazh1aGt4ZjdpVEFJTFNaOTVGQ1dnTFE0c3MvV2U5?=
 =?utf-8?B?YUN2RkhLeGxRc2ZNa1ZKSStCU2tlaStPVi8zOUFHNHU5bStGamZZSnNWK2tm?=
 =?utf-8?B?ckJTeFhPV0oyVXhJMEgxNUpNZ21aalQvb2QrUk9xRWNNRVQzVW9LNGN2cDNl?=
 =?utf-8?B?TVRNNHRQTlZka3hjYUg4b0owdEtya0lpbU1GY1E2ak1UWWFvQkVSeXVSTFN3?=
 =?utf-8?B?NG5wODB0eXc5QklFODdyQ3lkaWFEemNMQjd1aFh2aGxlcEVuMnVCaUp2RVd3?=
 =?utf-8?B?SHJSZXFCWXlIbjQ3L0g2VU1BandOS0MxcFpyc0NyZVVrRTZSNGlnQ21odU9J?=
 =?utf-8?B?MHREcFR5bUJoQnV5ODFCaUM2S0NHbmNhQ2p4aGpRdytFNXJYdXcrUVV3a2w1?=
 =?utf-8?B?WXV2OWtEN0t3SUc5aGowRlBsUnRoMXFUN05qNHBIc0FmUFFMR1V1SUxDRWsr?=
 =?utf-8?Q?YP7lXO+J9rxnR7I34P?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd3f3df-d13f-4742-8881-08de5f9d3156
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 01:16:27.6467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AW4E0Ns0H1GpsKMVarYleHGkvyzB+t9C6KTBns+yxkXZPIVlXQ80lDbAeXFV35DMQQmCos3cKPcsUM0UitpYoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7463
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: E1663B61B4
X-Rspamd-Action: no action

On Fri Jan 30, 2026 at 12:26 AM GMT, Joel Fernandes wrote:
> Hi, Danilo, all,
>
> Based on the below discussion and research, I came up with some deadlock
> scenarios that we need to handle in the v6 series of these patches. Pleas=
e let
> me know if I missed something below. At the moment, off the top I identif=
ied
> that we are doing GFP_KERNEL memory allocations inside GPU buddy allocato=
r
> during map/unmap. I will work on solutions for that. Thanks.
>
> All deadlock scenarios
> ----------------------
> The gist is, in the DMA fence signaling critical path we cannot acquire
> resources (locks or memory allocation etc) that are already acquired when=
 a
> fence is being waited on to be signaled. So we have to careful which reso=
urces
> we acquire, and also we need to be careful which paths in the driver we d=
o any
> memory allocations under locks that we need in the dma-fence signaling cr=
itical
> path (when doing the virtual memory map/unmap)

When thinking about deadlocks it usually helps if you think without detaile=
d
scenarios (which would be hard to enumerate and easy to miss), but rather i=
n
terms of relative order of resource acquisition. All resources that you wai=
t on
would need to form a partial order. Any violation could result in deadlocks=
.
This is also how lockdep checks.

So to me all cases you listed are all the same...

Best,
Gary

>
> 1. deadlock scenario 1: allocator deadlock (no locking needed to trigger =
it)
>
> Fence Signal start (A) -> Alloc -> MMU notifier/Shrinker (B) -> Fence Wai=
t (A)
>
> ABA deadlock.
>
> 2. deadlock scenario 2: Same as 1, but ABBA scenario (2 CPUs).
>
> CPU 0: Fence Signal start (A) -> Alloc (B)
>
> CPU 1: Alloc -> MMU notifier or Shrinker (B) -> Fence Wait (A)
>
> 3. deadlock scenario 3: When locking: ABBA (and similarly) deadlock but l=
ocking.
>
> CPU 0: Fence Signal start (A) -> Lock (B)
>
> CPU 1: Lock (B) -> Fence Wait (A)
>
> 4. deadlock scenario 4: Same as scenario 3, but the fence wait comes from
> allocation path.
>
> rule: We cannot try to acquire locks in the DMA fence signaling critical =
path if
> those locks were already acquire in paths that do reclaimable memory allo=
cations.
>
> CPU 0: Fence Signal (A) -> Lock (B)
>
> CPU 1: Lock (B) -> Alloc -> Fence Wait (A)
>
> 5. deadlock scenario 5: Transitive locking:
>
> rule: We cannot try to acquire locks in the DMA fence signaling critical =
path
> that are transitively waiting on the same DMA fence.
>
> Fence Signal (A) -> Lock (B)
>
> Lock (B) -> Lock(C)
>
> Lock (C) -> Alloc -> Fence Wait (A)
>
> ABBCCA deadlock.
>
>
> --
> Joel Fernandes
>
> On 1/28/2026 7:04 AM, Danilo Krummrich wrote:
>> On Fri Jan 23, 2026 at 12:16 AM CET, Joel Fernandes wrote:
>>> My plan is to make TLB and PRAMIN use immutable references in their fun=
ction
>>> calls and then implement internal locking. I've already done this for t=
he GPU
>>> buddy functions, so it should be doable, and we'll keep it consistent. =
As a
>>> result, we will have finer-grain locking on the memory management objec=
ts
>>> instead of requiring to globally lock a common GpuMm object. I'll plan =
on
>>> doing this for v7.
>>>
>>> Also, the PTE allocation race you mentioned is already handled by PRAMI=
N
>>> serialization. Since threads must hold the PRAMIN lock to write page ta=
ble
>>> entries, concurrent writers are not possible:
>>>
>>>   Thread A: acquire PRAMIN lock
>>>   Thread A: read PDE (via PRAMIN) -> NULL
>>>   Thread A: alloc PT page, write PDE
>>>   Thread A: release PRAMIN lock
>>>
>>>   Thread B: acquire PRAMIN lock
>>>   Thread B: read PDE (via PRAMIN) -> sees A's pointer
>>>   Thread B: uses existing PT page, no allocation needed
>>=20
>> This won't work unfortunately.
>>=20
>> We have to separate allocations and modifications of the page tabe. Or i=
n other
>> words, we must not allocate new PDEs or PTEs while holding the lock prot=
ecting
>> the page table from modifications.
>>=20
>> Once we have VM_BIND in nova-drm, we will have the situation that usersp=
ace
>> passes jobs to modify the GPUs virtual address space and hence the page =
tables.
>>=20
>> Such a jobs has mainly three stages.
>>=20
>>   (1) The submit stage.
>>=20
>>       This is where the job is initialized, dependencies are set up and =
the
>>       driver has to pre-allocate all kinds of structures that are requir=
ed
>>       throughout the subsequent stages of the job.
>>=20
>>   (2) The run stage.
>>=20
>>       This is the stage where the job is staged for execution and its DM=
A fence
>>       has been made public (i.e. it is accessible by userspace).
>>=20
>>       This is the stage where we are in the DMA fence signalling critica=
l
>>       section, hence we can't do any non-atomic allocations, since other=
wise we
>>       could deadlock in MMU notifier callbacks for instance.
>>=20
>>       This is the stage where the page table is actually modified. Hence=
, we
>>       can't acquire any locks that might be held elsewhere while doing
>>       non-atomic allocations. Also note that this is transitive, e.g. if=
 you
>>       take lock A and somewhere else a lock B is taked while A is alread=
y held
>>       and we do non-atomic allocations while holding B, then A can't be =
held in
>>       the DMA fence signalling critical path either.
>>=20
>>       It is also worth noting that this is the stage where we know the e=
xact
>>       operations we have to execute based on the VM_BIND request from us=
erspace.
>>=20
>>       For instance, in the submit stage we may only know that userspace =
wants
>>       that we map a BO with a certain offset in the GPUs virtual address=
 space
>>       at [0x0, 0x1000000]. What we don't know is what exact operations t=
his does
>>       require, i.e. "What do we have to unmap first?", "Are there any
>>       overlapping mappings that we have to truncate?", etc.
>>=20
>>       So, we have to consider this when we pre-allocate in the submit st=
age.
>>=20
>>   (3) The cleanup stage.
>>=20
>>       This is where the job has been signaled and hence left the DMA fen=
ce
>>       signalling critical section.
>>=20
>>       In this stage the job is cleaned up, which includes freeing data t=
hat is
>>       not required anymore, such as PTEs and PDEs.

