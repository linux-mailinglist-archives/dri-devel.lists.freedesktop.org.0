Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C06C5003B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4141E10E09C;
	Tue, 11 Nov 2025 22:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mJV3ll97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013016.outbound.protection.outlook.com
 [40.107.201.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F8710E09C;
 Tue, 11 Nov 2025 22:51:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKTZqk469JwyhJCREgwKDw1PHHpN8AA2FzndouhZXEc6X/vqC6XJ4I9hY2gQKNPryuWkTfweAWdfFjbIwbRrj1fU9zgnm72nSfKaMWAlEvrhN2UEK1MkQS4VOAJLzEToNJW8pmfOTMzhZMOBGYnipFrheIIF22R9H3Q7ePYnkRE70qMlm4MSbjtEHCQiCx5tlEkZUnr+uRrGbcxiFPusv3jxE+Qo2RYh2y82boUZ2Vi9M0u/9AJ0343CCP46NiIFnjvThVBreOW8dPkNNj9i1DUtWQ2hbMSt/qx50Gl8uFX5iq1LTxBoAaA/Vo2OTNIMmO1TJ5/dxPg264OKwlbzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGQB13IgG18V2rlpf/QEc+uDxL+TczNIemQ1t/7twig=;
 b=t6vGyWRClaoHUT9Zbw0OmKYGE+UohPxBmd4kS3Uo5kcmufQJEyDKjQ8bWmB6+mwKygokNqZWFAYCVT3w3sgMBzXhQvVk1rx3XaYnO2S17w66OcsEjBNMY942inZGWczMARK44uWkDgioyZmulbxlpg5tBxHC8El7+yOx0LsVuA+IsM+rDOmth3iQauC+58PlsJKKI+hVyJAHDIp6FKEV2n9jqKWjXdvx94CBL8kq8pQxVI9ju55SRUNZ2Mz+LDqnoON6j/Dj2fNK7f82KPKl9AkgB7EMs1UghbKGqD2Nhosq8LWDblWy2Mw047yfsMEbr/aVwjSIxTf/2qgWei3fzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGQB13IgG18V2rlpf/QEc+uDxL+TczNIemQ1t/7twig=;
 b=mJV3ll97K7NX+TXL4YY2nEWA+nPajxhiPbiebYbmdL85mPjQF8WSl4IbJ3KrdFJsZbwa1c6z20g+L0OGoDkzzLH2j8n5sBv7bD8Nu/6z+lLf07lbVWfaCJNxA/fe3Jeizm9hvHB9Cf3ZGxmhnWWuek3GZlTlMacVRPDZomtNX/arJJjxCyVlwlyIEemLAjpeIi3TuAfPLeuxLga4FUx3TmVK8VZxgVtt88zuhEez/mRZNcbKVZD10w2PzxaTyHSYGu39ipAh2e2zHs6h8iLjhAeBtxgWfXmZbMf6oyEaVkRIEroGWZr6E9PEQDlqHiJNHh/OFPq6jIEhVv/+OLsUHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 22:51:35 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 22:51:35 +0000
Message-ID: <1ae47b0b-b77d-4a99-b137-f1c9055226dd@nvidia.com>
Date: Tue, 11 Nov 2025 17:51:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] nova-core: Implement the GSP sequencer
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-8-joelagnelf@nvidia.com>
 <DE5256UCJHXU.27RS8A445Z1XN@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DE5256UCJHXU.27RS8A445Z1XN@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV8PR12MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7c9de4-f388-46ae-fcc0-08de2174ddc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2hEKzBIZUJQZlBpQlFHUElNdFRtb0ZZK0luK2dCcFJ6YUVCQ2hBSTl0b25X?=
 =?utf-8?B?UEl0VTlVMmZoL3JmMExORDVoeHhjcjVuM0oyQVhMb0lOd0tDMko0bGRsVEJR?=
 =?utf-8?B?ZkdhWVdTc3cwamJOemduTzZTK2QxN1VzRE42elpUWDJSYnIzY2NjWHZyblB5?=
 =?utf-8?B?a1MwWVFMV1ZZUEsvT0k5QlFXNHdMbFdpUVBudzdzQ2xUQmFkR3NuWGg5S0h1?=
 =?utf-8?B?YURya3A3KzRiaTAxbjBUUkxHR0c5MUE2TFVpZE5xWkkxOU53Z2xma0g1OW5C?=
 =?utf-8?B?MWlUMjRwUFF1TVBDbEpsdGVObHl4Wng0SW5POFJtWWYvSVVxcFF5cis0RzJK?=
 =?utf-8?B?QTdic3dLSUdUTVpUQVh4RFFiNUVuK0tMTzJuSDYydnNJeHF5RlROTitrUGZo?=
 =?utf-8?B?UzJaZ3l1QUphVVFtZ3oydE5BYjB5ZDc5N0hHNzlKdk05WW5WN3luSmp3QnEw?=
 =?utf-8?B?d2hncXg0NXBtblc2Y0xaUFNINktNTHY2UktpVVR5ZkhWMmsyWGtMSndaR1d6?=
 =?utf-8?B?RTk1c004SmUrb1BUWjk5d2cvVHZEUUtZeDJiMVNESHU2VStTYTl5K1FGRmJJ?=
 =?utf-8?B?cDdlcUNvcTJ3dXJ1V0tSMjAxS3EvNHduM3JNYVJOS2pZaDFtWldvaHg2Z3Vs?=
 =?utf-8?B?OXF5VW9oelAyRUkrQXNSZ3Yyc0YrWDROQlVSN3l4TGgvbEpnOEdHMnVSUUV0?=
 =?utf-8?B?Nno1c09jMkN2d1NFTlJxaW5tUjlGanBlNFdMb0pWWXFEYmxYdXVKcjNwemdz?=
 =?utf-8?B?QnhNc2MxR01WWlIyekIyQUNWLzM3L3Rmc0ZpN2FaZkxjWlJPdGplQVNIdS9z?=
 =?utf-8?B?bkpGa2xsTUVNa0xlb0c4eWtCMFlOWVlrZkhZZjgxOTEvT1d4eDFlMFpDMFpS?=
 =?utf-8?B?VzRidEw1allSeDFpeEhzUkNFVytKa2EvUVB0Q2YzK09hNTNMMDJmU3VqNkR0?=
 =?utf-8?B?UWlpUlgzYU94bWc1UmFXdEYxaDdOYXk4NkhDbExZekhKTDNHSk9Kc2tERWtX?=
 =?utf-8?B?RDdPMnUrY0ZPSUJxQmdKZTZkMmxGWjJWN28zQ2pDNkg0WmlQNTFMVVZuMG41?=
 =?utf-8?B?aEpzN2pRUUJpdHRUTTNJT0cvZkFwc0p3enVidllBb3QvUGRQQk9laEJxWU4y?=
 =?utf-8?B?ek5TWTNPVHVScHJGUVljaWowVFZXcnJ2aTFudG94Q3B2NnFNelM0UWVqZTgx?=
 =?utf-8?B?QTNWRWxSdjFIZTNCQ1MrTkk0aG56MXl4cGsvVEFPS1ZEL2FSWE9jRGZqVmwy?=
 =?utf-8?B?WitQVGwxZklIVkJwNEcvamI3N0EwenU5YVNteGsxMXR0V3BmU3ZiSWdGZHA4?=
 =?utf-8?B?YnFMTzhqdzQ5aFJGMDlWdk5TL2Z6NVdBYTBCZWtYUmVKQkVWS2lTeXEwS2FR?=
 =?utf-8?B?MkFnblN0bnk3ZXk3MWU1UmNjLzRNamtTYUVDTzdremxoZUFVMUtQUHcwZ2gw?=
 =?utf-8?B?aitQcThXTmZOTm5tNFRtM3Y0TnFDYWRwN0xIVEtkUmpMSXhNUnBEZkNJZmxF?=
 =?utf-8?B?V2VEejlIL3VIbzdrbk5ESVNNOTJPKzJ5MFZaUDVzVG91SStTQ3ZuZlBlRTVv?=
 =?utf-8?B?d0RyS1lnYUZlOW4vWXlPNUlsb0U4SkJ0RXplSnJNbVFsb2IrRHhLeThJalkz?=
 =?utf-8?B?WEI1UWxWbm5qWkFSeFVqRlJMM1g1MUhpTlYzNzZJNUgxbC8zcFJGZXFMYlYx?=
 =?utf-8?B?c0ZvMzJwaVMyZ1B5a0E5emNWNWVCR0RjVE5kaWg3bXM2Vm80ZzZMU1Nnb0Vo?=
 =?utf-8?B?ZEJkM2t1Nm9maDBCeGh1b2lma3lNb1B6MzgyOGZWVk5tT1lwbmRIZEVPTmtz?=
 =?utf-8?B?ZXFrTXBtVlppcUdNOGhOZmQ3eFMwcCs1cHlRYkFCd3ZiOC81TUU0NDgwSGxY?=
 =?utf-8?B?VkR2UWdkOGdqMURKbS9RZnBMbTFFMlYzK1JSNXMrVENaY3hmVVNrMEQ4OW5k?=
 =?utf-8?Q?4mNlLOX2LXz69ofh7sYvQ0HCOkxoPDFv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVdNY2RlUmJlakNva1lxTXppYjQ4UmZxamt6QWNFNmE1YWpSeE9adjNmSzNH?=
 =?utf-8?B?UEZpOVg3WXkwZXVvRFpBazNzMkhjUVh0alAzK1VPU3VBdmRnYTZOVWZIUVpS?=
 =?utf-8?B?dEpjZmhFYWRwK0RlWWF1cVhZOEFFcEZKcGtJR3VFUXNyRWdDSEZJTUJxYnEr?=
 =?utf-8?B?ZlNJdGtUSndaZ0sxUHcrd2UreWV3OE5XSk9RQWRqMmQ3V3hBL2EzenAzdXRi?=
 =?utf-8?B?QUhoYmNEWk9QemtLT2NXemRqZDZXeDIzWGdWNFNKeGZ2MHJTaDNMK3VjZ0R6?=
 =?utf-8?B?YVVHU1V4aWlkTzE2YUVKMGdMN25GVjNpNEg1VGY2MjhybGN5QUt0bWZSUHNU?=
 =?utf-8?B?QzFkVTZDcXVIamFqY3h0MUpNT2w1VHoxdzhNdng2MUo5RStrMEU2dmNjcW1B?=
 =?utf-8?B?OTZ0TmFrbHVnMDFTeC80NzJZTHhsZE5DK05OaU8vd0hiN3IweXpsTjRMb0pi?=
 =?utf-8?B?U0g0QXZ4WFdvcHFPdS9UcldYRlhvZ0lSYUxXZTBycno2aEJhOTdhM3BvNkpJ?=
 =?utf-8?B?a2pTK3gvODNNK1B6NDg2WDltc2s1Qk9kZ1pKVTQzNWV2RWY4VFNZd1JGbWFk?=
 =?utf-8?B?d1JVTFluZ3YwWUpac1hjcTRzZnF5dHlOZTNZT0FIb2p5bEVDU2pNOU5EcWY1?=
 =?utf-8?B?RjYrYXc2NmpmUnB2dUw0UnNweW1wQXh3QWZ4dVo2NTVYZXEvaUhHemlYcWlt?=
 =?utf-8?B?MkhlaXJEV0RpNmdyRlluL3RNekxydWFuZEVla0E4UzA4aGJXbDR5aU8vMTJV?=
 =?utf-8?B?Ly8za2tIaU9Mek5EQlRYR3hKbnNhWENnY2I0K1dwOFp1MGI1dHNGNmxHdFVy?=
 =?utf-8?B?dHROWXFGcDlsa0tjUFY1eFp6WXZKOEsvcFBpQnpwUXFaUzE5dGRBVkVVNlBl?=
 =?utf-8?B?Y2NIVnBDU1ZZSTJhUFMrTTFKeDRsMllBZklnbGIrQWlVRGNOZnVTbjlydEc1?=
 =?utf-8?B?c2xwa01RNlIwakJNTW13bGpkTHBwRVZKU0N1c0UrWHQwdHo1cVFrYm9Lcm1X?=
 =?utf-8?B?S1EzeWZVTjFPOVlmbGNBSGQyWm9JTGdDSk9vWGxRb2ZmVGhBSnNBWlorYkkx?=
 =?utf-8?B?MUpwbzdBZSt0TnBjWFdhUG80NzNzbkF4d0VhSkJrcGJkL3FUR2g1ZWpiMWtL?=
 =?utf-8?B?RHkvdE91VHEvamQvZW5FWHVFTytvVXlmTDAxaC9hUlhCdTFBbFZSSWRZNlo2?=
 =?utf-8?B?eGJOUlRhSDhqUzNsU2ZtYUczOTNCbHArd2M2QUVNZ2dQZ2djMTdQWnR6ZURJ?=
 =?utf-8?B?QldkbHRwUTFFS2ZQVlJ1YXAydGVCSjZVL2RsWmN5dVRIdmJJRi9pcThaZ3Vz?=
 =?utf-8?B?eEliUFlEWEpvZ3RKU0JnN2dHTTBJNjJNZmRsMjVjVVpHaG1NeThVajNrT1BC?=
 =?utf-8?B?V2Y0UG5Vd0QyZ2JMM1NONkhnY1dhZUU4V3dRcENTNHd3SFJPSHcrc1lGd1pJ?=
 =?utf-8?B?NjB5YnlvWGw3TStMUURNZG43TmRwZ3NudHpQUFdVYlVVOUtWdk5Cc0FlRjVJ?=
 =?utf-8?B?cHVWano0L2NzdzIzUE1sc2pPWUNsWm5jZVpHakN0Yis5Q29JQ0l4YldZU1NU?=
 =?utf-8?B?UDlGTFVqaWxFbmpDcDNZOG1MWWJGb1dOdXFkaG1ESyt1bEZPYmM1TjIwN3Ri?=
 =?utf-8?B?NllnUU9RU3k1WmluN0o4dUtrM1hZSGp6dGdPckNwWFhaNWVETnhtenVrRTAy?=
 =?utf-8?B?UWE3QjY5MU9WVzRmY2IxWW5DcFM1RTU3WVBmcUhIZm83UDZ6SkV4VFdXbEZU?=
 =?utf-8?B?UDJHcklPU1VjTmkrS1loTUVudy83YTJuNXEwTWtERXluL1NkYWFPSzh0NEpP?=
 =?utf-8?B?SytySGhJUUpmS0lmOHBXV2c4ODYrY05qWXJKc21VMUNtWVNTQXVNbFo4bU8v?=
 =?utf-8?B?dXRTc3JzNXo3NFhEN1hiTTBFODV4TXg0aHdBeks0WER2b2I2NVdCdDU3dW5Z?=
 =?utf-8?B?dTdGVjU1Y0J1WHdWUHFzUllZeFg2Z1VJLzBGcCs4eDhtcUlOdXFlS3BINklw?=
 =?utf-8?B?V1RpcDh6UkEvQ2h1VTdDdlRvbG85YXIzckl3dDVzTEx1Zlg5c0hXSkk1eWhR?=
 =?utf-8?B?TzFvOGRoVjBlWXlEMVUxL2dZS1RJMDZ2aWNSZ2hIcTE1bm5vM1ExODBqdGtO?=
 =?utf-8?Q?mYGbgvrLhGoFmvRAhccyYFIm8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7c9de4-f388-46ae-fcc0-08de2174ddc3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 22:51:35.6049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYC+bronALXdJJZMwsicvJll/7WvlL7BLkds8MI/vbKp/Z9DdtwYT3gynKJ+pVHVKV0DnWRHkhKjuPwDQN83Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153
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



On 11/10/2025 8:43 AM, Alexandre Courbot wrote:
>> +impl<'a> Iterator for GspSeqIter<'a> {
>> +    type Item = Result<GspSeqCmd>;
>> +
>> +    fn next(&mut self) -> Option<Self::Item> {
>> +        // Stop if we've processed all commands or reached the end of data.
>> +        if self.cmds_processed >= self.total_cmds || self.current_offset >= self.cmd_data.len() {
>> +            return None;
>> +        }
>> +
>> +        // Check if we have enough data for opcode.
>> +        let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
>> +        if self.current_offset + opcode_size > self.cmd_data.len() {
[..]>> +        let offset = self.current_offset;
>> +
>> +        // Handle command creation based on available data,
>> +        // zero-pad if necessary (since last command may not be full size).
>> +        let mut buffer = [0u8; CMD_SIZE];
>> +        let copy_len = if offset + CMD_SIZE <= self.cmd_data.len() {
>> +            CMD_SIZE
>> +        } else {
>> +            self.cmd_data.len() - offset
>> +        };
>> +        buffer[..copy_len].copy_from_slice(&self.cmd_data[offset..offset + copy_len]);
>> +        let cmd_result = GspSeqCmd::new(&buffer, self.dev);
>> +
>> +        cmd_result.map_or_else(
>> +            |_err| {
>> +                dev_err!(self.dev, "Error parsing command at offset {}", offset);
>> +                None
>> +            },
>> This looks a bit redundant: we are processing errors here, but then we
> also have another error handler in the caller (the one that says "Error
> running command..."). I'm pretty sure there is room for simplification
> here.

No, "Error running command" is because of .run() failure. We won't even get
there if .next() fails. AFAICS, there is no other diagnostic other than this if
command parsing fails.

Thanks.

