Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF62AE072C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0655410E052;
	Thu, 19 Jun 2025 13:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xu8t9PAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44AF10E052;
 Thu, 19 Jun 2025 13:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUHi+9IogDLtRf9LrwJSp3SoRn8VptFdMGGg3XgRjvM9Ti2LZevPTdeVhlEVHmoWJJ5rN5RC2Bk3wquHfTz0huTVDhTpgKgqO17lb7kD63OxANfWi6cTXfkmuaj1vEZ2vwPdmdbWRMd1c/cXZEE7KzWXmEYJPp7HhFifbXTL2YpPirxzZUDBktMs73X9FKFLqSuPC+oDUcon2L+Up3MqUVJTecmqD62RzmTnIPOYamjnFZth9ZrCZvygXkw/Qef4gaZZkSwZaMcezGXnNHaC15Ti/w3xmlGSH4t/hTxxzTZv8rdaL5hiCtPn9u/koCkz5mJ62BkHekTGWkuvIF5SYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qcL6fMhsPg1n7XpZ1+XYe1kfQNSE6kSYfhFzh7Qs+g=;
 b=Kx5HYYetZGkX3BiJXIapzEBhuVT4eB+lbEp+M2LBYlN+9DqRzxvDMjW6eDEoT+i9KwW1+PUY60CVLdrKkUWGwzqnwHyx7TgEgqlpCiSvJS1lyNnxxr9Z7x9WPbNJ5I3oWSnY0Jt75sJC1rcsws6s2kib8aYxw/ANmrCkAwQ4RvPWKOtgkcnDCizNkmoxRBqHxl3aEvCTY6jAqKpq4HsRfEL/Tw1+jFjmh/wu44tJ7/u00YzSVDykHvdcwv9DD3fbTNvmBxwJ0r3FTw2iFKYMg2B+HVnODN7YqZQ2fUL3rugm8sDQ3u2Be0N40GZ5yO4v5ZzqN5mqe/dw9Q0dpRTMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qcL6fMhsPg1n7XpZ1+XYe1kfQNSE6kSYfhFzh7Qs+g=;
 b=Xu8t9PABhjB+gih4kQT7UXQM7/I4p1vESqkQ9Mj/a4eIe+9e0Zugv+nT6m1BXNTPUH8+Q1rtnIOARQS5tSWxgrq6jATwruuQe50XMGOsplPeuDEbgpcB2nouCC4PPCuE63Z+kV9OUgi+070WiSge8/GyDLqUun8er2CmjqJ5Mf4VF3x9vY3wY5gZMgnHCBw1+e/3RI+ftUYR0uFpSd2X6UZAZx1xbg36w3BCiO2CtbRYdpa3wD+cDfulN4ajuoAlujcojWYn2VrJW9zTjI6PljNR6rxmze6KAOINb/qcnrtKWi9mc5/Gcxj0jHfjf0cR3AF0zoSBNGbPusqyLYvIsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:26:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:26:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 22:26:55 +0900
Message-Id: <DAQJLYKS5AV3.62SL1IRSQE4B@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
 <DAMHWN6ML8A1.2AUE4UWR58KR2@kernel.org>
 <DANR43CR8X87.1YWHJK7P75TPQ@nvidia.com>
 <DAPWKX9V8T26.315LG5OZLLL2M@kernel.org>
In-Reply-To: <DAPWKX9V8T26.315LG5OZLLL2M@kernel.org>
X-ClientProxiedBy: TY4PR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed94af6-0a2a-4cf3-9f6c-08ddaf34f769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?di9rRDB3QTRMY1NYRjhlUnAwQ0lRZ0l5YkdQMENhOWRRRFpjbUFYTFpPL0cz?=
 =?utf-8?B?TzIvYThnTTJjeUhDM1pPR21OOXpNaHZ4NGZIaWxGTzVXSmJuaHJoNTBpQVBn?=
 =?utf-8?B?ZlNlZ21MODZ6OFZzR1lpUmhZRFhLeUt4ZEhjM1A1clFRaVVPK1RNeFYvM0or?=
 =?utf-8?B?ci9PQ2RIcWpxR3FLQmk5cHJSOFdQUE0rWUIrMWFWUHd2MzF3bGRxcGlPYklG?=
 =?utf-8?B?ZHptZDFDbjlwekxNTGRVQVdPdmVzS3hIOVAwL2ovUExyb1lvOEhWcDF2KzA0?=
 =?utf-8?B?ekxra0NtbWRBMmwybnJQZmQxWEhiY1dYVVRyV3k2S3FVQmZHMk9VNEhGRFRX?=
 =?utf-8?B?dWc0SnhYejdjKzdiM01KeUNVWTBDcnYvOG92Mk51Y0lkQnZUdXdlRmhKRGJq?=
 =?utf-8?B?VzNJSlRERDNmOWdQa2Z2Z0Q5eFVRa0Z5RndhQjlPNVlHallnbUhtNGN0Q1RI?=
 =?utf-8?B?akJVUTJ1M2s0NHEvZFFUaG1MRFFFb3BxWWR3UFFzNTY2M3Q0eFBMMXdZbXFE?=
 =?utf-8?B?eDdTckZ6S0xTN3RQK0JoNGx5Z0tqa20vWDhKUEx2OXlJbVB1djNJcE5sa1dS?=
 =?utf-8?B?ck5XWDFmVHdDWFRwMWxYUWoweDZvT2NqNGxLS0orNW0vK2N0N3l4S2pTakVz?=
 =?utf-8?B?U3Fkclo2eDdPNFI3b25OVnlSbXQxZS83NDRTZVJhSWYwUlN6eEc3S0Zkd3lv?=
 =?utf-8?B?R1ljWGJnMmt3dGpKWkovaVNQRFdOQmtULzV5Um5oSW9GUmNxb1FVOFkyNmFE?=
 =?utf-8?B?MkNqaFRsMnZ2UnlaOGNGYy9PcGNIczBqOUhiaHBFUG9SdUMrNmFYVnZjUzJ5?=
 =?utf-8?B?c2FBYXVDVUQ0NG45dm1CUmo3QVNLNVJmVGhFaWZXdlBjalBIemtVWTRnWjJN?=
 =?utf-8?B?WUJvamNscTRVamkxdlhoSEdTYTlZOHd6MlpwQXB1UGlHVGVBNHM4cHozVi9Q?=
 =?utf-8?B?NkUxR0trc1ArdndCcERiSE52L0pNbkZ3Y1VCUno0Q3lZUERnSWxwdGZnUHRD?=
 =?utf-8?B?c01sS1c3QXllS3JUMUdLa1g0TkhPWkpyYncrL0s5c2VFOWxjMTIrYWFvYlVu?=
 =?utf-8?B?QnB0K3A3SU5zLytFbGZHb0ZramZDbTVoMEVLWkNJUm5XOWFXU05NV1dhWHla?=
 =?utf-8?B?QlY5eXMzM1QvYTArVFQ0bVVlUFlxRmdwQlB3cEs4K21KTSsyTlMra0VrR2R0?=
 =?utf-8?B?TVVOT0RQdVhJd2c3ZmdHeHF2QWtYYy9GLzRjR2dTMExQQlNVdlJBbEIwTklv?=
 =?utf-8?B?WjNJbDRyTWVSaDRaQjdWdWNqYjlEQ1gzN0xDS3RVbE12WUJiZzhNK0dNUlNk?=
 =?utf-8?B?eTYyWmlVaGNjeWV2NkdvNFpicXY4N3BidTRlWFFEam9Vd0cvYXVnTllHQmhS?=
 =?utf-8?B?UFVZakFqOFNKVUg0M1NEeldaV1AwMFNWaVFVUE9rV0gzR2QzM3pOckM3dGNM?=
 =?utf-8?B?cG5nQTJ1d1JjVmozalByZC9ucXI5dGM2T25aTXozdVpIaDJaRXhkRjdTRjRE?=
 =?utf-8?B?MmQ3UkZaL3hqeXNtbmRqY05OMEtRQ09vTDl5YXVxSExuTlhmcnp6T3NPbmtv?=
 =?utf-8?B?TFJNMlExZENYSFRmWjFFdUI0dDAzTDNKUTduN1pYNlJSK2ZIQzJncTVUcW1Q?=
 =?utf-8?B?REFPWi9kSERvQ09IejdoQlV4UWJzV1VYMmp3RGk2R0wvZG9EQndmcXdES205?=
 =?utf-8?B?MTNjaXlCaU9TZG96cm8xcFhQdHRPQjdQUUVsaVNZMlB1TXpCUzBESGJQMmcz?=
 =?utf-8?B?UENLZS9rRERmZCszaW9OeG90REtWQmRnbldJRHhrRDRJdU5pTGZuaUg1MXlR?=
 =?utf-8?B?QVJjUUtsS3VLRWdlYjUrVUIrZ1Z0OGhKbFhObVB0UmpBT3N0WWM4K2MxREhp?=
 =?utf-8?B?MkZhK0pVMkE2bXh3OEZIdlRFWlJ0UzFKUEVGME9abDlDTFpnanZLbzVIMzMz?=
 =?utf-8?B?MFFuOEh4U25TeFpHMnZBL1ZuNnFlNUUrUjBMY0RsaU9yMUEzV0JhMXhEV0xa?=
 =?utf-8?B?cStuTlV4RzR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3lYTUpVNm5PNTBVVHczUlorbmFXRWhCZ1lOcXA0cHUvWGx2bWsvVHV1T3Vk?=
 =?utf-8?B?RlQrQTNES0ZpQjdLQVdpQitucTQ4SnpiWFlyZWo4TjRmaEllYk03UE8vMEFH?=
 =?utf-8?B?eVowZVoxR1FmbW9aUWF0emFiNUlNTjE0d0xSaHM5WCtyZC80VzFoY0JLNlV1?=
 =?utf-8?B?OVNjeW4yR0JWOWhuUVM5bzZqZG9OTXZxTW5tUmRCZUwyZ0h0cUhLR1Z4R1RJ?=
 =?utf-8?B?dDh1V2c4T3QzZmltSHA2QnNTN1Z3VXoyaURyOHFQaXVPT1RVdWhvaW85anJ4?=
 =?utf-8?B?eWNDdzAyemEySGNlREwzVUZLUWlveXZoSHlYcHROYytZYnNkSDY1YXpYS1JM?=
 =?utf-8?B?RUs1NHVEZGxoclo2OTNUcHozckZKUE1vUXY4eE1GODcvcVp3SC92UkMzT0NX?=
 =?utf-8?B?MGxsaSt2a0RjUDBvUi9hQjV0NGp4LzJWMi8zazJaMzlIRUNNak1RL2VpZW9r?=
 =?utf-8?B?OHdXc0hwR2cxZGtGVUpoa3FHV2VzUzl4UStlQmwweHFNUGFzQllHSlVhMktP?=
 =?utf-8?B?RENycnBoV2RCNnFGbnhySmsyN2NUVmtEVXJPYld3VVkzQVN0R2NMV3hoS3J0?=
 =?utf-8?B?OUhXQ0k1SjNreWtZclFwMWtQMDB5NitMUnZHSis3K0I4SmdlYUl6U25uNXJj?=
 =?utf-8?B?RDJlQUVLRm85cTFQbU85SWZiakdtemJYbXh1T21oampqZDZzeCtoRFFrSExB?=
 =?utf-8?B?VGlkL0tneCtVYU1TbjdUb3J1SFFTazh4WGpRU2ZUZnJLdGVDY2pySHUyMWY3?=
 =?utf-8?B?MnVUTUo4V1paOEhSa1NIMXN3ODZ0NU15bFpTUXg4eXN3cGtWa2ZMQ3lPeW9H?=
 =?utf-8?B?S3d2MWprSGliOUhqc0FaU09EZkF0NTFZYWNJUHYrR3FsUHpoT3BCOFE1NVFM?=
 =?utf-8?B?U1ljd0VUd3o5TkkvQTFMb1lPVjlYN0JpZkRiWXBvZmFTRVZ1KzZMMVBIY2Jm?=
 =?utf-8?B?c0NoMnIzY09RWmhJTzNaQk5CYmZpWDFhTms4a1I3cHdEbXpkOVlwbk5HVGdv?=
 =?utf-8?B?OTg5VW5tckp6NmQ5VGpPbGdkZDVLWC9TR1hLaGVZTGFvN3ZHUVoxSjdyNlBu?=
 =?utf-8?B?azkrYk9OQ2QrR09Ebkgrcktxc3hpZ1lwaEJMVlF3dzQ4WjhUTVhNLzdCQmt2?=
 =?utf-8?B?dGZ2OGdVWFJnbUdlR1dyb0JCbzROWGMvZjFoY3ZvaXdGUHhPbk9sSjd4aGxl?=
 =?utf-8?B?eUdXYnNteklmeVNFbmlZN3N0VUxtVGJhbnNvMllKMXVYc01WNEQ0YXJKdm5n?=
 =?utf-8?B?Y1RyZllkYm1sdXphVHdzRm0rT1BQcUN3U09FcGQ1WmZuenZVa0FUVmVvd2Zy?=
 =?utf-8?B?UWVUWjV2aGd1OVFVekVtc0hCVTI5OXdlZ2Q3RnRZY0Via2FLZjdzbWk3ci9a?=
 =?utf-8?B?bTdsTHlqSjdPdExBZjdHdE9PaDR1dnBobWM0WCtselBqK1lRTXd2WlAvcDBQ?=
 =?utf-8?B?cjRwaHJZbS9UTTl6OWJpR0tkcDlsNi9FRmR6amZTSHhweC9xejZXZzhmNDZF?=
 =?utf-8?B?N1VNN3YvVmR4c2xwa3V4bms0M2hIeUowNjVWZmtacGJsVStYYVg4TzFRZngx?=
 =?utf-8?B?UG1GeHh4UGxoOVYvVGVlL28vV1Q1OVNmOCtYWmNhSnRERTZEd05VaXorZXZ4?=
 =?utf-8?B?SHJFNC9ONUNjcTZGcGxpM0x1ZXdlZXVCNVRsUjA0VE1JS21MSGlDQTcreE9j?=
 =?utf-8?B?R1QzTW1nVEpqVXZSR3VMMm1GbFpkYUZTVnk1QXRiVnprN3VsbnlNU0g2WW50?=
 =?utf-8?B?SEJvZGtCYVBtWnI5VSt5VG9Va29SYjBITzZGZHFxay9QbGZPeFJSVDRjZkFL?=
 =?utf-8?B?cXc5RnlhVFRsREhMRE5SbUNGa3BvdHNDb0xnZTRrYUprYkh2ZzJQNVRpUlJa?=
 =?utf-8?B?cW9WOGtsNEZIOHZMVG83dXlySk1HTE5ZbjQzSkVSRDlRQm9yWFhwVlhyWEFi?=
 =?utf-8?B?MkZZVzVmdEFiYkJtQkt0bWpkQ3V1VHhia21xVEFpNTZncTdSOWNvUW1BS3h4?=
 =?utf-8?B?M0ZKbUZFV0s4MlNOelpsOTFMNHhaaVZJQnB5cXg4bUIvQ0JXcEpiQ3NxM1Q0?=
 =?utf-8?B?bHRvWjIvZEhYbFRhWEhCTkJNeE9lNzNxMzhhU2liVngvSzJtc2J0UDZYNysz?=
 =?utf-8?B?WUgyN3hndjZjYWFaNEVVVWNiNVZjTE43TjhVZ0JMeWxaN3IwRGNqdVV6aCtF?=
 =?utf-8?Q?BsbDkDp7z/UyXF/AFXP3THbLhw/raSE3lv7QlEJFJ5My?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed94af6-0a2a-4cf3-9f6c-08ddaf34f769
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:26:58.2522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqCCDko51hSviQ2xRGKD0QwxORVWf45QxSqJ4+Ea+99kQTQBCmqnh8shysWTtE4rMan6g+l45SUo5n8KglL3Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

On Thu Jun 19, 2025 at 4:24 AM JST, Benno Lossin wrote:
> On Mon Jun 16, 2025 at 8:41 AM CEST, Alexandre Courbot wrote:
>> On Sun Jun 15, 2025 at 4:16 AM JST, Benno Lossin wrote:
>>> On Thu Jun 12, 2025 at 4:01 PM CEST, Alexandre Courbot wrote:
>>>> +            #[inline(always)]
>>>> +            pub const fn [<fls_ $t>](v: $t) -> u32 {
>>>
>>> Can we name this `find_last_set_bit_ $t`? When the upstream function
>>> lands, we should also rename this one.
>>
>> We can - but as for `align_up`/`next_multiple_of`, I am not sure which
>> naming scheme (kernel-like or closer to Rust conventions) is favored in
>> such cases, and so far it seems to come down to personal preference. I
>> tend to think that staying close to kernel conventions make it easier to
>> understand when a function is the equivalent of a C one, but whichever
>> policy we adopt it would be nice to codify it somewhere (apologies if it
>> is already and I missed it).
>
> I don't think we have it written down anywhere. I don't think that we
> should have a global rule for this. Certain things are more in the
> purview of the kernel and others are more on the Rust side.
>
> My opinion is that this, since it will hopefully be in `core` at some
> point, should go with the Rust naming.

I guess in that case we should go with `last_set_bit`, as `find_` is not
really used as a prefix for this kind of operations (e.g.
`leading_zeros` and friends).
