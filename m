Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ShkCIO6scmmAogAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 00:04:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64FD6E605
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 00:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D19F10EAB0;
	Thu, 22 Jan 2026 23:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="FK6UPP36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021080.outbound.protection.outlook.com [52.101.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF8410EB84
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 23:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnQTBwRDdvasIQYZjPCxeQW1heywvdmC6wYK0mUXt4QFXzQIR0iYs6hNhQn474dU+ce0yX7IOirNLzGmZNCwIJL78CXzptPF7TUgleetDkwsZZA9AimIQK+btCIkbq3k70A/FkH60qBI/yDjMOho6XzrtLKskkyEGbkk9GlCCH/BvB+j/CDer7IhjKjgqu4wHZ3nbqMFVg6wC10cel9DaepzloI6jYa7P74aarh2xwit28SOn5+uQnsrk4wLglbLTIvqBptD6BmorElfh9AgolYKsxHOow8cLCvp6ryNW00HDlK9nTrfIvEL5vgVq8DtE0lyikT8OSzRphs1yZYNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FSblNzhzOXCVRUYGdktdolGNUWxO00PoiW3KsOQUTE=;
 b=zAJYAldkCLclAtF8IvV4wLq++9Nd3r5l25IzraWFdAnoqKLP929EYesdW6GA+ehRIJqawfjEwiwMC5pnireiEAsye+3+zufprcHE7tcvDc+xbaAo3au05A2sUvF33nRM/AKVSzJuqYZrywILs2uHthP+RN6ne8t6rnoDXPpNTAFCPbMwczc5XfVJsML0TAamwWEOjgxYWEmQZQuUiKE+rzN1NFsgn/XVO9vZ8SX7Y+svL4JPuxJ9wJiJxVkLntwGeEM9pmoKAiKbxX1BHO2PVfc5NUcitgqmSSMjY50vfFrEkghDxTkZphrIR9K4FRU0xCM6Itt+vPftMI+Eh5xYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FSblNzhzOXCVRUYGdktdolGNUWxO00PoiW3KsOQUTE=;
 b=FK6UPP36H3pmXqUk+EibWgYeEQkIVtbGu7RCTNpk9a6bv/E8RskHkE9Nns8vl63FtjQ69PhR9clPmylSmyUz4Forlt+Dd/uqmnM3W3V+MES2maJ6baNLOFQZTwVqY0coN8RyWeWKI+XK0k2iLeMD/AsZDdkcfxXj+XfbFFJQffA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6572.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 23:04:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 23:04:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 23:04:06 +0000
Message-Id: <DFVHS3VVR2NL.25TRT6CK2EBB3@garyguo.net>
Cc: "Ewan Chorynski" <ewan.chorynski@ik.me>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Shankari Anand" <shankari.ak0208@gmail.com>, "David
 Airlie" <airlied@gmail.com>, "Atharv Dubey" <atharvd440@gmail.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH v2 1/2] rust/drm: Fixup import styles
From: "Gary Guo" <gary@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260122214316.3281257-1-lyude@redhat.com>
In-Reply-To: <20260122214316.3281257-1-lyude@redhat.com>
X-ClientProxiedBy: LO2P265CA0450.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::30) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 047e2918-d1f1-4b29-16cb-08de5a0a8bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm41UUlwMGxjdlpWUklvd3pXL0tRNk9KelgvU09sNS9rWDVLb2VDblNsYzlR?=
 =?utf-8?B?UFFzNVRvMW82cXBUZXVOdkd6SWlQZDFRMENYUWdnVktlNC9PL05BcytZWk52?=
 =?utf-8?B?dDhEZEhxZ0JVU2tVajNLYnhWenU5SW9KcllvVHdoeldqRjJUK2oxTWl6bDdO?=
 =?utf-8?B?eFFCVVhBTmU0c3ROWGtIODdHaEFVNzNQdFVyY0YxTE0wT1FscnB3TUtLYzV3?=
 =?utf-8?B?dDFPTC9OUWQ4QjNmM3lLL3FFSVpiL2tyNFYzZHlsTklBWG9HeVFZdFJTaGxR?=
 =?utf-8?B?d3lmcE8ydjJ1WjVXdUxxanRPaEJhOGRKYUxveWVjR1MyeWgyN2h0d3JWaVVV?=
 =?utf-8?B?SkFKLzl4bHEzZk12dG8xSVJRMkh0aXJEMDdZWnIvMlg1UkltNXFtd1p1Nm9M?=
 =?utf-8?B?dWFQR1RKSS9iSDlVK3BrazRVajhNeHhmUE9jUmNvcmQ5YmlLbXRUQW5JbXJG?=
 =?utf-8?B?UmErMjFPV1pKb3RUMVBYTVVwOFNONXJKRk9YQXBrczBpUXBYWlZGVzVZeUlp?=
 =?utf-8?B?NitRTlhkQ3hhaFF4a012UmNOSzM1ZGNUbFFML1RGbUw0bTF3STNMS0wrWXpa?=
 =?utf-8?B?K3FVSFVSeVljaCtvQ1FwaHk3cmp2bkJ6cWd2UkpzYVprek1OL2JubWNzR0M1?=
 =?utf-8?B?TUdYOStjejJXYTYwaU1NclJoTnU5cUx0TDFWZUh0ZmUxT05oUzl5dzFqaENq?=
 =?utf-8?B?My9aU3djc0E0OTdQTHZ2ekJhMVhDbzNEWExHLzd6bVM5MFRkY2ZEcWROOG81?=
 =?utf-8?B?d0pwZEtWVTdiL2FtWUFBcWQyYkx1R1pTUmFhUjBDTXhBbGZwYnJ6YmF0Vlk3?=
 =?utf-8?B?cGJWcVRvbm1pZGJUYTFVWFdWTUVDTHhtdjdOb2I5enFqKzNEdGFhNDhjNGgx?=
 =?utf-8?B?N0dNT2V5MDd3SUJEUjdWdm11eHFUUlo2MHpYcU16cGx1bXdwTGR1WWVxMkNN?=
 =?utf-8?B?OGQ2UzRiNVZIVXRHN1M5eTQzRStTYXhHa04vZ0l1eFl1QmlCL0VXK2djVjQ3?=
 =?utf-8?B?bmNYQUkxTmhybWkrc2ZlMjArRXBYQnpQWFIwaktlbCswMmsydnNxNnJ1RHls?=
 =?utf-8?B?akFXakFRR0pkYzFhWFVRWFRrRC9FSnN6YzdERjhXTGNwQnh6N0c5RVVNNXNE?=
 =?utf-8?B?dWZBYmk3c0l0ZlFBRnVBZlhFbGtGS1NSbTBObEI3SDFaQmNwUzRJQkhDSWN1?=
 =?utf-8?B?czcrVW1CamlFWC91WGtmSWtBc0hEeVdBcERQc1kvbUZWbFZpZDdDSmNXVEl2?=
 =?utf-8?B?V2c4RCtUOGZTRG5QVmdxNXYwRUQxdXVBZk8xa09ic0VQQmF2UjhyRFdSRTJj?=
 =?utf-8?B?NHhNeFFWWENQOHdNSW1yeXEwckpHM3kvcjFkb2gxZ1FUVTB1YW9Eb3U4TUtt?=
 =?utf-8?B?bS9iTXVobXJORXJqWlp2dkNramViZ0h1dy9zRWUvRStXbis2UjFHWWZQWWFH?=
 =?utf-8?B?NG9BdHMxa2ZRQmw5dFRpTUZkOUIrRjkvZUhxcnJ4MzNoT1V5T1Z3bHg4WHN4?=
 =?utf-8?B?RDEzN0RUR3dMRDN5VWlxNWVRdVJCOWZuTzdRaG54MVc5WDU1ODhxYmxENm53?=
 =?utf-8?B?SEU0TUxaaVdaKzJZdUlEN2dxQUhTTCtZSnd2YnV5QTd3T0JHdDk0UzR2TVYz?=
 =?utf-8?B?OVFFdDRFd28vb212UVdOcEN6M1JmeXI2YnllQlAzQnM0Q2NUNks0emdWTjRZ?=
 =?utf-8?B?ejI2ZTZiVFcrTEhzL054MzIzMjk1ZXdzcyt6OStWTnRNaDFaQWFNOHlIY1NG?=
 =?utf-8?B?aExSNlVQaWZlUlBRZUkyNWlQN0ZQeVpjSU1SbUNOaUM1bUovUHZkbytSMlhh?=
 =?utf-8?B?YlBWcEJFUG5LVlVOc3M2aXBNZWx4elpzbmcxNzA5RVZBcTNzbTNaSndBNlNj?=
 =?utf-8?B?T0RCRjZHcWtxY1JOMnV2cmRvOXhzOXFNSyt0bC8wZDVhMFZHSDRvOGloVktX?=
 =?utf-8?B?clBMSEVtT0RGUFFWTWNoUng0STVYQ2w0WmU5UUs1VVFIRFptWGY1OEkzYzJm?=
 =?utf-8?B?S2FQQXBpRTZXa1RXeVF1cUM4TTU4b00xTzhGWkQ3ZFpBSytpSjFONkRiVWRW?=
 =?utf-8?B?VFFDNHBndFl4MC8xdUhEZkxlTWJ2SXpRT09BZWl1WjhpcGRlTzUrU2lQbGpE?=
 =?utf-8?Q?5xDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3lCZHpLRWhWMTJ5L1JORmdCOEtNdmpIc081Rk85K2FOQUZURkNpUFlNWVhy?=
 =?utf-8?B?SzlXUTVUalpubE9IZkJRWHpmY0k3eS80aHZFMFNYdUNoajE1SzR1YThPYlFy?=
 =?utf-8?B?ellpNTFFQkFaTDhOMnB4ZUlyeE9pS3pGQXFzRkdWckNpUEtxbUxObkRWZTR4?=
 =?utf-8?B?OGVzdHpSSTFNTlYrU05YS0ZKcjJCdXE5WlBUVDhYRDkwa29qRTk3dXJqNkYv?=
 =?utf-8?B?aDd5cW1uZmlwazJBcDV0TDdKZFFvdGJCVFB5YytCNnJHZW16eGhBVm0vRnNm?=
 =?utf-8?B?c1FJbHJsd3h4Tmc1QVJ5ZEIrbnBLWVJ6RGhkOXhFQ21JaExSZ2J4bVNkbXNP?=
 =?utf-8?B?eTBhUkZKUjJDY2NhQUV4QXdQQ3hkaG5wWlY5ZXRDWXhIODlnYld3WTl3dklL?=
 =?utf-8?B?TFFVVEo3R3plNWk4bXpYeHdYMEpWdytNNE1RSjVEYWoxNjRGM0g2d0lrSGlW?=
 =?utf-8?B?QUYxZDdDL0N6MUQ3azhkY1c2UzdzdHFpWUlKZVpRY1A0d0FWTko3ZHB0UHB2?=
 =?utf-8?B?ZVExeE05WmJ5MGFRVld3Mk5NZnFNSE1iaGMzUHZMQk5GZzljdnBrSjYwNkpt?=
 =?utf-8?B?Mm9BT2RockFSdHQ5ZFlpY1VjUmJhSEEzRkxtbTBEV3hEMjVuU05lWWd1VUdW?=
 =?utf-8?B?VW9VNmZ1bXIzUy9aNi9vWjIxcXFtc0REYkFIMzhqaVFXNjkzZVZZMkNIeFQ1?=
 =?utf-8?B?ZUE0Vm1JSHh5cGpRbGVUNGhDY05kQk1UdXpvVmxoNlI5YzhtdnlPcERwM3BT?=
 =?utf-8?B?SGJndmhKQStnNE9SMzZjWWRWUmRVRENNcGptaGdnaVYwYU1GaEpYaHFhRHRh?=
 =?utf-8?B?d3A2cVdYaXVOWnZ6TTV6ZHVmVVJzYmR4TlZtYmZ0U3UwRWdoYnJNSWhDVktX?=
 =?utf-8?B?dzhmZmE3RlRrQjU0SC8yMUM1d2RCYXlQMm93VytQOEJNZldyQWlaKzVHcVpv?=
 =?utf-8?B?VHhnSGRZWEpUK0wwUCtEZ1h5UXdqYlVqUjFkanZzN2tTbGlSWGwycHE1dW40?=
 =?utf-8?B?WVpqaDhWMVQ0RFhVbEJFUkgzajQ4b21BZlBnNXNWOWVDV0N5bmFUK1RFaWJP?=
 =?utf-8?B?UHpaVEsxSnBKMkJNaUM0SHZiMWNrRHBSMFZ6dDc2bXJhWUxzTGNOZFArcnpL?=
 =?utf-8?B?ZVZqdldNYmFiWlZxL3pCWWkxUkpWdCtqWTFGYnJJVHAzM3VWeHhGODFRM1RF?=
 =?utf-8?B?WkpXd2t4Rm5nN3lneUxjSlc0dTloelBjRnNpL0ZWSHNtMWhUK09GaTR4MHJB?=
 =?utf-8?B?NDZGMVdpTHQ0NmZCQlRKb21zYXBHTWZKN014bHhBc3BIOEdWVG9XWEJiOEJa?=
 =?utf-8?B?ZWJxTG03WkpkZkh6bmhyTUphdWIrd3RKQ3VFRXE5cDNKTWhVRjg0NW9WS2JF?=
 =?utf-8?B?QklhNXRTNzhJQ1dIN2J1TnNXc0hHUGlRb2cxNTdBTU5WaFRHN3hZR2NWK044?=
 =?utf-8?B?clg1Tkp6QzVaTDlEVEthR1pVMUlMWWxUVjhiL2IyVXlIRU5NeHByR0J0Y3c0?=
 =?utf-8?B?alpLSWoyYm5DbFpUTXpScHd5MUVVRmlZbEMveHkzMFd2SC8yTVJVWGg2L0Ey?=
 =?utf-8?B?aHpxSEpKVlFMT1FKWnJWWlRUYmNwc1pwWkZsUS9MQlBZbndnTVN6QmxVQ1lG?=
 =?utf-8?B?QWRMSG93bUtwN2xjTUMybVJYSllBaWdMaXdyOWpacmt6MlJ3MHlpTFk1RjIz?=
 =?utf-8?B?RlBDNC8yU0RhRUl4dFVBS3JDZTRDQ2o1QjhmeFRlUXFpNXJSSXlaOWpScGph?=
 =?utf-8?B?bVJ3Y005eFRHK05qWkQ4engzNStFa0NuUFhxcFJwNWJvTi9JdXFGbEpUaWtQ?=
 =?utf-8?B?dEJ6YzZSMkhIdDVMbXFXenZQYmozZStGbGMvd05xTHF3SDRpNDZzY09TcG11?=
 =?utf-8?B?YmlaNEhGbWl4RnBiNlh3ckZyMGVpQ0N3TjQ2NlNJM2dlZHpGdG1NMmRFRnAx?=
 =?utf-8?B?Q25HVHZ2ckFQRTRndlhHclBZa3gvVmNzL1FvRWdKc2xpN25SV1UyV2pvOFp5?=
 =?utf-8?B?bFFoSFFMNFJzUWY1aWhyVklINm53UUkyUEdxeEtrSXBCNEZHRnNmaGxiYkww?=
 =?utf-8?B?NExTYnBsSGU2emZJNWh1ZGgzd3ZWVXdXL3NNRllmVGNRSStTSldZTitBU0VR?=
 =?utf-8?B?czFZalVVUHNxUWNjWWtQZVlMeFhOV3FZRWkyWHpmSVJUdkMxclpIMVV3S004?=
 =?utf-8?B?d1kxOENOeTZtOUFLTElXM3YxS2pDU0hvODNvSTNBQWoreWtGTE0xTnFTelAv?=
 =?utf-8?B?eGluY25wbVJJeDdhcUt5d0M1dTh2aHN5YXFSVmdkUVU3WmdWYUNYNEpiaXZK?=
 =?utf-8?B?NFlDUnc5Z0JwT29jM09CbjdleHNSbkxJeWpNOWN5TWt6MkVrMHg5akZ1NHBk?=
 =?utf-8?Q?q8l7NMcO7qBrZRxKaCXUbAhw33vzDWdUQM1ivShAujmAB?=
X-MS-Exchange-AntiSpam-MessageData-1: uRl/U2p/HvWQBw==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 047e2918-d1f1-4b29-16cb-08de5a0a8bad
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 23:04:07.3387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CMMyslR8ua5sdFRd3CiFmapMwMzo/EKDyttoqwTeBfRQo9x8uLWTHJYue7VC6iFptLJj+Gbx3VIdUrS8TfxSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6572
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
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ewan.chorynski@ik.me,m:ojeda@kernel.org,m:aliceryhl@google.com,m:simona@ffwll.ch,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:atharvd440@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:lyude@redhat.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ik.me,kernel.org,google.com,ffwll.ch,gmail.com,asahilina.net,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.743];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D64FD6E605
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 9:43 PM GMT, Lyude Paul wrote:
> This is to match
>   https://docs.kernel.org/rust/coding-guidelines.html#imports
>
> There should be no functional changes in this patch.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/device.rs  | 29 +++++++++++++++++++++++------
>  rust/kernel/drm/driver.rs  | 10 ++++++++--
>  rust/kernel/drm/file.rs    | 14 +++++++++++---
>  rust/kernel/drm/gem/mod.rs | 25 ++++++++++++++++++++-----
>  4 files changed, 62 insertions(+), 16 deletions(-)
>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 3ce8f62a00569..23c457c90a6ab 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -6,15 +6,32 @@
> =20
>  use crate::{
>      alloc::allocator::Kmalloc,
> -    bindings, device, drm,
> -    drm::driver::AllocImpl,
> -    error::from_err_ptr,
> -    error::Result,
> +    bindings,
> +    device, //

I think this // is supposed to go to the last item in the import?

Best,
Gary

> +    drm::{
> +        self,
> +        driver::AllocImpl, //
> +    },
> +    error::{
> +        from_err_ptr,
> +        Result, //
> +    },
>      prelude::*,
> -    sync::aref::{ARef, AlwaysRefCounted},
> +    sync::aref::{
> +        ARef,
> +        AlwaysRefCounted, //
> +    },
>      types::Opaque,
>  };
> -use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
> +use core::{
> +    alloc::Layout,
> +    mem,
> +    ops::Deref,
> +    ptr::{
> +        self,
> +        NonNull, //
> +    },
> +};
> =20
>  #[cfg(CONFIG_DRM_LEGACY)]
>  macro_rules! drm_legacy_fields {
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index f30ee4c6245cd..c8ec5c0819a06 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -5,8 +5,14 @@
>  //! C header: [`include/drm/drm_drv.h`](srctree/include/drm/drm_drv.h)
> =20
>  use crate::{
> -    bindings, device, devres, drm,
> -    error::{to_result, Result},
> +    bindings,
> +    device,
> +    devres,
> +    drm, //
> +    error::{
> +        to_result,
> +        Result, //
> +    },
>      prelude::*,
>      sync::aref::ARef,
>  };
> diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
> index 8c46f8d519516..7dade6dfa1ba2 100644
> --- a/rust/kernel/drm/file.rs
> +++ b/rust/kernel/drm/file.rs
> @@ -4,9 +4,17 @@
>  //!
>  //! C header: [`include/drm/drm_file.h`](srctree/include/drm/drm_file.h)
> =20
> -use crate::{bindings, drm, error::Result, prelude::*, types::Opaque};
> -use core::marker::PhantomData;
> -use core::pin::Pin;
> +use crate::{
> +    bindings,
> +    drm,
> +    error::Result,
> +    prelude::*,
> +    types::Opaque, //
> +};
> +use core::{
> +    marker::PhantomData,
> +    pin::Pin, //
> +};
> =20
>  /// Trait that must be implemented by DRM drivers to represent a DRM Fil=
e (a client instance).
>  pub trait DriverFile {
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index d49a9ba026356..56b7641b1405e 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -6,14 +6,29 @@
> =20
>  use crate::{
>      alloc::flags::*,
> -    bindings, drm,
> -    drm::driver::{AllocImpl, AllocOps},
> -    error::{to_result, Result},
> +    bindings,
> +    drm::{
> +        self,
> +        driver::{
> +            AllocImpl,
> +            AllocOps, //
> +        },
> +    },
> +    error::{
> +        to_result,
> +        Result, //
> +    },
>      prelude::*,
> -    sync::aref::{ARef, AlwaysRefCounted},
> +    sync::aref::{
> +        ARef,
> +        AlwaysRefCounted, //
> +    },
>      types::Opaque,
>  };
> -use core::{ops::Deref, ptr::NonNull};
> +use core::{
> +    ops::Deref,
> +    ptr::NonNull, //
> +};
> =20
>  /// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementat=
ion from its
>  /// [`DriverObject`] implementation.
>
> base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331

