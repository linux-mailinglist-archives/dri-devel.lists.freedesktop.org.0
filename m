Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C18D33238
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 16:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A9410E8C3;
	Fri, 16 Jan 2026 15:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RvrWmpCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AF510E8C3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 15:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wo0jQktl11NKtCaE+d3vCPbC6rPkdPb2TTMv6BT2onWCCVlAfOUY0Ck2AKdI0giKjpWh96tqaywWJ92xl7cOP2+I338+lEP0jk6WgaLEG6uiE/wceYRcwl1YOgXFAJWnwuybKPmGqxBdVC+tUBeXQ2uhSJ4Va14/bpVBvBYvPd8mj/LI+pOvIQYY9JQZbWaVYzsjYwdvpSipyZDnLZzuXOM1cr8bgPcuZNA9akLfQvWAi8uPxeib4oKGonkFEUkCNNP51W9YEE8YGYgksFiyQQeo64crU2O+Ck6TIBLnoqroqt3gBvcpfauRw7CZISAbvd3EgHTNBXPBt8am1SuCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nd3jCOUr8HOmcOPEijWKLF4iDsul91ZjIS4nq3JviY=;
 b=KPx1FUmLxkWAJaVarXo8jFiJzrosHvyNAUgZLJwxhtMstjdxd7oqm3M6NHwxabz9hRoylYUdVKG5ypeAI2YEbO91Ezcdok1wtHJ9rjypyvGGew4jHa6J1H00SD2nj39ZEnpOTJ8XquBYnQza5KW56xc47Ge7oHCGgfplOJRaTzvKPe+8jrmwQjXAqPhYzpzsIqf4ASgLVwfW9j8snfD15gpzB0KnxOCsY6CHdrmFD2zGPwtEr7AM2mr9JCwPnG+fIPJEm6I5WeN4Y8jNQZ/jo1lL1jv0Hz1yM7cZarPG8WxeCQVjWELFyWhhnflJyf3vAMSxEmNZucm59Eg+loP9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nd3jCOUr8HOmcOPEijWKLF4iDsul91ZjIS4nq3JviY=;
 b=RvrWmpCj+xEb0rVgF7trOVH8oL4E46Uu5BatrBQS3aJ4eJ9T7vqgKTZLksLdaCWx9BAgzpRcJ2F3KHWvbet/R4KzC5RMnHelp8raSqlc0pdZKDhm2hgOxbuj6tEpv63ndGyL/a8IvdY5P4bj8R6nDGPkxITxskmJPlo+vqDcWe5U7o9kezL6xGA5mnW894k7Ij8rfbKBV6XbzTtG/cfaC3uWfKJ6/wb7YbRBDlURyciUbZFluHzPHmsoa+SRVkrb3or7vJNBVgMJIQ3nfLmabWU336/By/5K1n1D9hGO2laZd6rHQge7TqJmN57fgWRRSmZq1A/GAbTuU2MNva+R9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV9PR12MB9830.namprd12.prod.outlook.com (2603:10b6:408:2ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 15:20:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 15:20:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 00:19:58 +0900
Message-Id: <DFQ45GSQLR55.1GRM6DSYTG01D@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Dirk Behme" <Dirk.Behme@de.bosch.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Steven Price" <steven.price@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <fdc39008-ba4a-4170-b7ce-cca2deda5652@de.bosch.com>
 <1EF6A3B7-216F-47C3-8631-25C38994BAC1@collabora.com>
In-Reply-To: <1EF6A3B7-216F-47C3-8631-25C38994BAC1@collabora.com>
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV9PR12MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: c8df49cf-e5a1-4da5-7939-08de5512ba03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWxlbmZoVG1rZW53WURGMVQxQis0ZXdOdDZoRm9XU2EreHpmNUFNRXpjQlJL?=
 =?utf-8?B?UGg5M0JEblhMcmVocm1QRENNL21ET2NhbU9FZ1FRNkw1cW5tcGtIQWYwcmw5?=
 =?utf-8?B?WXZjQStEdXBVY2RqVmRUMFlQWjhnZzRseDdmNHhkZUV3QUVKU2pHSjYxRStH?=
 =?utf-8?B?dTAyeWtxRWt2M3VYc3VEbUVXNys5VWVUSEdwRHoyYTA4SWpFRFA2eEVjdFpt?=
 =?utf-8?B?RFRyZjh0aDR1ZWJOdkxBbUx0VjkzREhZc1BaM3NIVjhJdXp2QXVacS8vVWZk?=
 =?utf-8?B?TVNjejZKRDRTZW5IbmIzYzMyNlp5UTM3MFNKWE5nRlhUN2I0dGxQS1ZCd2dx?=
 =?utf-8?B?ZTFyaWZORjIxNXZiQ3JUWG1HT3pGVVBZa0ZTMEp3SGVENW4rbnZFWDVLbW1n?=
 =?utf-8?B?VDAxdGhraDZCL1d2bnhZWGVNMkR1T1RobCtpNzlpYzVucXdEQXBUcDZlWkNv?=
 =?utf-8?B?RU8xNlJEemxyY25ZZ0dhNWZrNVVVTXIyV3JzTXlxK0ZnUzNWWXMwNVAzaFI0?=
 =?utf-8?B?elVUY2pNc1NFY3p6MmxsTCtyaDJSdlNRYVRtcnFHaDRDMnJNVFk2ZEExWndR?=
 =?utf-8?B?RnpEUk0zWlRuOEsrZHRsWklNaExHdkVEalJEWGRQdGNHelNTZit1NkxNY1Y5?=
 =?utf-8?B?akcwRTl4dldPNFdndzBYYW5UL1NJbnRkZ3hyRWNqeHhMb2xxaE1EV051QlRy?=
 =?utf-8?B?M1JhT3lOZE94dmpFays2SFA5WUlJSlBuK2s1TEJmT0hvdGVETDhrdXJocUp6?=
 =?utf-8?B?ejJ6Q21SRTFhemlYUVA1WDFtM1hxd0dsZ2hVVjdLMzVPOUNybzBPVmFMUDM2?=
 =?utf-8?B?K2dlV29KMmppZjdtMjQwOGhydEVobWNQUVB2QUYvWUY0RnVGZjVGVkQ3ZEZp?=
 =?utf-8?B?bzJmS1B1QkNSNFVhcmhib1BmaURzWUdaZ0NmeDMvaU0wQkcyMDNEeWhYZm1h?=
 =?utf-8?B?ZXJqZTRYNTVLcnVvTU1oUkt0cDRnS1ZTUU4zakszN3EreWpyTVFKRDNlalhS?=
 =?utf-8?B?cE1XOXVEZmJYU3FBcEpqNFJRb2hvU0hueTZrb05sUjdHbm1PNVQrbGprSS9V?=
 =?utf-8?B?QmlVTXhUTjRjNWlubTZrTHRvRzhJL0hWaXJ3ak85YW5tRGdSVDh5K0h3MURw?=
 =?utf-8?B?S3QxZjN2Zld0TEtmNWZGRkh2UVRETmgzZDcvbGNUS0pEcnB4dnJKcktLbytQ?=
 =?utf-8?B?ZXBJVkRXZVdXZUJRUFNBTTNDRXNIV21OQ1JNT1FQM2ZHcFFmb0tTY2szS2Jh?=
 =?utf-8?B?eW5NWUdzQTBBYVJOTjg3bjgvY1RDSjcveHY1Yk90QzFoT1d5dytkT1ZSZWRt?=
 =?utf-8?B?MVNpbFdXUXliVWlHNGtlTXFScXhPNHNmVjM2OWVLdklIUjFZV3BCVjA0d1E5?=
 =?utf-8?B?TGx0UnBrbzBsT2FBMCs1OGw1QXkvcGd3Wm83YjNxYlJIdU1Ic3EyeWgwV2NJ?=
 =?utf-8?B?OUM3N1YxeUtmd3RsMkdZajNpTmJVZ014NjZDNEh2TWJ1WHkydGNJTE5HT2pL?=
 =?utf-8?B?Y2lnandaZ09GREluWTA1d1N5eFlILzdzdUY2dXJXY3lnemRLQ0tFb3Vxcjl3?=
 =?utf-8?B?ZjFSK0RyTVFPc3l6NFduMHNqMmo5cmRieTBLZTlxVWx5NHkwZldjUVJFUERv?=
 =?utf-8?B?M0dGQUEzUjU0UkE2L21zeUFBRWgyZTVMY2ovWWlGUTdaTjQ4MEVEbDZicFhS?=
 =?utf-8?B?TEV4WWxKTXhYcExxUElLRGlRTEI1L29ycWJpMTFCMGJUa3grNzRoMVlZYkM1?=
 =?utf-8?B?M3ZaMFRJWCtMK29uek5acVhhSGJPT042TEdoUFJoTjZhK3VTVHVDaU9rK2dK?=
 =?utf-8?B?WmllY0hIcnF0K3cwZWFVRldyT3hzRE5MdjNnS3FyMXZrQVdsazB2dTloRXZp?=
 =?utf-8?B?V2JTL3VSand0eHBXV0cyZWY0bmE1N0NwYWRKaDJ4OVVDRU4yU244WXh4TnI3?=
 =?utf-8?B?U202ZGVwNnlVVng4NHFTSk9DZDV3c1NUOEFJbWY3d3N1RU52d2JzSDloOS93?=
 =?utf-8?B?NVFOdm9id2JMYWdSY3JtSVBSSG1Ed1B1R1M2VUJpUUtZYndhL3JXQzQrRmx0?=
 =?utf-8?B?dkEvcVhCZXJEbUFQRW9ERWszUVhZQld3SDlYSmFTclEra1ZQVC8zTlUxRFR2?=
 =?utf-8?Q?B4iA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkR3V1J1MW9aYVAwRGNhTi84cVFqcEdZZTc5VHRzNWMwWUEwZG5ENTNCeG1X?=
 =?utf-8?B?aGV5UCtPMVdBWHFtbzRwNExTT0YzdWxXSjliWk55RzBGdnRva3JmWC9mSG1a?=
 =?utf-8?B?RC9DbVphc0FjNWxUNjR3Smw3Rmt0REZPMW05NFZLd3UwL2l1ZDluVWlVWnFE?=
 =?utf-8?B?SzlyQWpRSXk0eVhlV3htZzBBQjFjcnBBaDZDNjFVQ3p3SDJ1a0JWV1M2NlBO?=
 =?utf-8?B?ZktSaHRVZGw2Q3lwS3k5d3RvdGZyd202VHpzcnpzQUFZLzJqZFZxUGQ0dU9x?=
 =?utf-8?B?Z3EwckExSGs1d0FUKzRMb0RLbFdXR3VVekpkbTRkVXNEcTNqb1lxNC9yS1hn?=
 =?utf-8?B?YytSeFAyMDlDZnpTSFZsU3RKUFNiQSt1YWRHYk51eHFUcTFaSU53OC9oUUds?=
 =?utf-8?B?dk1wMUhTZnVIelpXN1oyYmt2ZzRwbnlVSGdkcXkrazdIajR5ckJYNitJLzZP?=
 =?utf-8?B?Y2RqMVVQOE1qQnh6T1FmWHlleDZqaGRNWFlSMytRZmxxMkVPSDcvSThpWFp5?=
 =?utf-8?B?akd2SDBzblR2eElpR0RCYTlHUFZCY3gzR2pPTktIejZjMzNkV2w0UkxsMWFP?=
 =?utf-8?B?V2dETWJ6Y01MU0VVYzBPaFlpZ0tCUmhCU2huTm4yUUhLS3pESXZ2WkdFWVpI?=
 =?utf-8?B?MGZxcmxJbmlmRWVSSE13eGFoRDRYZHdiaitiQWhSQ0s2QmZFYTlqV2lWV01x?=
 =?utf-8?B?TGlLUUZpSmRYZzJVMW55bUFvZ29semEvSUw3djIwTTVieXljRlpjdzdWS3lB?=
 =?utf-8?B?TU1mS0w1c01PMnJoWFI2S3VlckNORVF5c1k4KzN2Qk5HMmtxaHdrUURHbUZN?=
 =?utf-8?B?QUN2SVRzQ2pmc3Y2ZEovM1FIQUpOaExxOVg4ejRBc3ZDVmRlaDg3ZUxOUW5Z?=
 =?utf-8?B?SldpaGN0dnE0QnRwdzJBMVJGV3hrTUJnSDZBd3RZUXRRb1g2ZC92UWtJZkt5?=
 =?utf-8?B?OENOakRCS08yN21VNEpvZzdWTUQ4ZFE4aHkwUlU4S0ZvdlVRTE5YbmlvSGpZ?=
 =?utf-8?B?MCtVb2pZSUNSdUhiQlRsWGlubTZrK0hqNGxkRGJ3SGJ5U3JsbnNzY202Rkln?=
 =?utf-8?B?QkJLQU5JWEhFWC9zQlJOckF4VzFWcE81T1NYSEVmZ0Rsbkh5bzJJSFhORkpj?=
 =?utf-8?B?L1lIOG1xT3g3RVZJSVlRUjdqVzBmMzJPTlI1bUZyQWpHUUFNand3eFVYZmNx?=
 =?utf-8?B?WXN6djdScFcyVnVLSzFWbTl5VkFuTTFSM3d5STJraTA1WmlBUThoMXZWVzVa?=
 =?utf-8?B?YXI1MVJQZzAyRDB5UUVTZSt3MHlRRzM3eDFjc1B5M3NvY3JZeTdTNkw3V3Q1?=
 =?utf-8?B?RXE2N3RMMHhCdklyc2FhUkpkaFBYYUhWWFF0ZG5aM1l2aGV5VDZqaXJ5WDcw?=
 =?utf-8?B?eUxBMW9icWpXWDlkdEhncWtObXFtWjRwb3pNVzlkMy9UOHROZmV2ZnI1alpP?=
 =?utf-8?B?a2dmemhDL1h0bjdoM1o3bDl4SDI4b3RtbmhScVgyUyt2a3dXS1R0SE5iaG50?=
 =?utf-8?B?RDhHcnAxY1dRYncyb3kzSDVxVEZUZitRaGZNTk9DQjBQR3JPYXNvVUZXUjRL?=
 =?utf-8?B?NUt6NllrdFo3WURGRHhUWjYwSnMvam9JNm83OFhjL1hqcVVjaTZoa1JkdXRp?=
 =?utf-8?B?end4ZGthZnNGSHV1RjNKK1VmRXFWOFJMdllQSXJQWTMxWG4zS2VVZXpBMjJM?=
 =?utf-8?B?TTlzZ0MzeGZBS081YXJ4UnBlT2JjYmQwSjZySGptZDIwV1FrZW5DYlJnOFJm?=
 =?utf-8?B?WU9UU1hoRlVIWTVJOFFMamtOSVRValFDQlN5LzNvUEpaMWJJWmQxNzdjcHhH?=
 =?utf-8?B?K2xkNXVCRkFoTXRHQTNVaUhlMUlGcGsrOTJkdzMyWk12ekVGMHZPdWxUNzlJ?=
 =?utf-8?B?Nm5PV1FDNXN2LzVySWFidndOQU9UZnFBbFFIekRJZ2NqT2Z0dnFuTExvWDgz?=
 =?utf-8?B?U284ckFGa0xMQzFnbEhvQm50NlVMcU5QYjBCd1RacUlMemVSNEtDSTE5eFU0?=
 =?utf-8?B?eWZwV2RPZ0VOME5zZDlINDdvKzhWcDdMY2tPRUZOU2FqQTFCbmtOaXE3WXFW?=
 =?utf-8?B?TmY2WlpvYXppWHU3OWwycE5mU3BSZGNaQUZoRHl6Nit6NGZhdHhmTUd3NjNJ?=
 =?utf-8?B?cmpGSGNQNHhPTkhSKzdlaXI2UTVtckFDb3NMMnZvUGI2Vis0VDhndWFGZ09X?=
 =?utf-8?B?V2tPR244clNpdDQ4ZHB2eGJmT1dBc0RWUEtKNjE1MmQ2TnlpYTRXbXFmands?=
 =?utf-8?B?Umx3bG9mVml2eEpzQ2ZkdzZaa2M0dkJoazFIY3F2ZnZ1eGFFb0s2WFdqbzVS?=
 =?utf-8?B?alVWQUU3U2t2SUFDOWRPVElDbGlTUmFLNHpESTFIVXYyV2xKZGVKU0FnaGt2?=
 =?utf-8?Q?oD3O4gvfggoT8dzqKairpZIu101B79jHyok7BzHEcsNAF?=
X-MS-Exchange-AntiSpam-MessageData-1: hqi0Qkh9tyPu8Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8df49cf-e5a1-4da5-7939-08de5512ba03
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:20:05.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9B/dugEI/otoSILZxiA0kYBCu2TomIJuI3eHFeKBl1eJEApdz+Ss+nEuSl3vZIO7xCEpWuhjgrS8P4W6yFhHEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9830
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

On Fri Jan 16, 2026 at 9:26 PM JST, Daniel Almeida wrote:
> +cc Alex,
>
>
>>>> +    31:0    l2_pwractive_hi as u32, "Bitmap of L2 caches active (high=
er 32 bits)";
>>>> +});
>>>> +
>>>>  pub(crate) const MCU_CONTROL_ENABLE: u32 =3D 1;
>>>>  pub(crate) const MCU_CONTROL_AUTO: u32 =3D 2;
>>>>  pub(crate) const MCU_CONTROL_DISABLE: u32 =3D 0;
>>>>  -pub(crate) const MCU_STATUS: Register<0x704> =3D Register;
>>>> +register!(McuControl @ 0x700, "Controls the execution state of the MC=
U subsystem" {
>>>> +    1:0     req as u32, "Request state change";
>>>> +});
>>> Any reason why req is a u32 and not a u8? Same for some other places.
>>> And would it be an option to move the const MCU_CONTROL* to an =C3=ACmp=
l
>>> McuControl Same for STATUS below.
>>=20
>> Just fyi something like [1] builds for me.
>>=20
>> This is inspired by
>>=20
>> https://lore.kernel.org/rust-for-linux/20251003154748.1687160-6-joelagne=
lf@nvidia.com/
>>=20
>> Best regards
>>=20
>> Dirk
>>=20
>> [1]
>>=20
>> #[repr(u32)]
>> #[derive(Debug, Default, Clone, Copy, PartialEq)]
>> enum McuControl {
>>    #[default]
>>    Disable =3D 0,
>>    Enable =3D 1,
>>    Auto =3D 2,
>> }
>>=20
>> impl From<McuControl> for u8 {
>>    fn from(ctrl: McuControl) -> Self {
>>        ctrl as u8
>>    }
>> }
>>=20
>> impl From<u8> for McuControl {
>>    fn from(req: u8) -> Self {
>>        match req & 0x3 {
>>            0 =3D> McuControl::Disable,
>>            1 =3D> McuControl::Enable,
>>            2 =3D> McuControl::Auto,
>>            _ =3D> McuControl::Disable,
>>        }
>>    }
>> }
>>=20
>> register!(MCUCONTROL @ 0x700, "Controls the execution state of the MCU s=
ubsystem" {
>>    1:0     req as u8 =3D> McuControl, "Request state change";
>> });
>
> Alex, looking at the above, I wonder if a =E2=80=9Cas Foo=E2=80=9D would =
be a good
> addition to the macro? That would then invoke a TryFrom implementation, i=
.e.:
>
>
> register!(MCUCONTROL @ 0x700, "Controls the execution state of the MCU su=
bsystem" {
>    1:0     req as McuControl =3D> McuControl, "Request state change";
> });

So the register macro that I will submit for the kernel crate will be
significantly different from the one in Nova. Expect something closer to
[1].

This means that fields won't need to have an explicit integer type
anymore (they will automatically use the corresponding `BoundedInt`
instead).

IIUC this will them behave as you expect.

[1] https://lore.kernel.org/rust-for-linux/20251108-bounded_ints-v4-4-c9342=
ac7ebd1@nvidia.com/
