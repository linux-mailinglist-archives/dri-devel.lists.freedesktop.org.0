Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E263AA58EB
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 02:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2213489755;
	Thu,  1 May 2025 00:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l6P9+3bH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2058.outbound.protection.outlook.com [40.107.102.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8631889755;
 Thu,  1 May 2025 00:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2C/Oao1Dz5JkTFmE5Ct181uO2P/lJQpWZnzFDwh1b6arrEL3iF357b+dH/d5XEOrMJ9GENHONAlRv+8G63Ojm4DGbjtuZ2lF8CeZSYTfSLKdEa7YYaT6ocDDJRyFtklNw7i3+V9BgvGJqGue8vVEOVZHiouE2/tDnJkB+m9fQ4I1LGjysthMUiI9IKI8wJWtTtHpBrl/tFQ5FtOzeNYjHPCsDLuhLr5QVdf+uKJwbWdqp0GFWudvuufaC6BN22rAOHsfDDgBzZno+tWcPpx4cpDiXL1mNQm/3W7qpHy54J4xH59UPWw/c5H5xU0vURJ8Xvmm+XyhczXOHJVrZ8T+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4NNHt7SNaUDpZw/J7NbUy14hBGG9zwzz9JhQiXgHvU=;
 b=YGm662Sr4zTAVYXCklg7U61e3981eA6p3Z6wAkDVKO3rEHXnrbWqxzzbzfRKAgzRFLHMj5+s8YML3QISWW+8fuSNQuGUo5UYLt6gYVTdydFNUqSCmdS/CJ8X7D8tLqXDjnO2j3LOr3Rn37c9rCSaDVJNvqNfHaL27XIXvKx8007Fi8tyVIDnlAR5AeI4Fo7KsJGcGL6icBJCHqdtujBcwh1n7ptN+YVEtk7bYsiZ8hu7dMsGVkYFhyrpln7QzAeVUGUnTeniT4xHZItjDhaDj7u7E/kM0YNPnwyOOMstLWq59zE09ZF4i1teIQpF3mPv29i7zGgnfwZoR81APwqCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4NNHt7SNaUDpZw/J7NbUy14hBGG9zwzz9JhQiXgHvU=;
 b=l6P9+3bHr5LTJ9lA48DDFFXk/dskjkW4p0XLKyrRIuDqbqtpKnOTvqCA0lMSNlXrcOYXQLUyZo3/Iv+byat7rEOrju2Z8bI9MawjaluHQyMvHHSZbsTGQVCPJQxO8ZPOnD8lDb8llPvhjsn42I7OYp+f0bNgQ8yewvMobhINwuOLdeaAV6Ko0Hv1+9hfMdQOFCAHCaCB1ugzc4uAoVrDmo4hUY+DIKhSOmOgLbf4vC4gDHHKMZ5AKLBLiMAVnzLBoLQkrc+Xvdtggd79Drr2tkqyycgiF/PvId6dnZh6DfTODBNbtiKyxLbdmgwDCSU03eho22g0dyuJ2RJNP/V9Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB9725.namprd12.prod.outlook.com (2603:10b6:8:226::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 1 May
 2025 00:09:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 00:09:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 May 2025 09:09:28 +0900
Message-Id: <D9KDYOVU0EG3.2TA8UJHMW66Q6@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions
 and base code
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
 <aAerWF9j5d01pQv0@cassiopeiae> <D9K09AU4KTQJ.3TVVZPMDB0H7I@nvidia.com>
 <9977ad2e-ce2d-48b5-a222-f74a821abfeb@nvidia.com> <aBJo9qNDn8xDEwlk@pollux>
In-Reply-To: <aBJo9qNDn8xDEwlk@pollux>
X-ClientProxiedBy: TY4PR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: e113f8ee-c78c-414e-e6ce-08dd88447278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OW9iZGVSTi8vcmVGeVVKVHE3OGR1ZEhMeHU4bmxEU1liU0xqdkNqdDVFbkt3?=
 =?utf-8?B?OEtqY21nNkFFUEROMnFhL1hMbjc4eTBQUUlUMGFSUkczdE8zNWxXei9IYUJq?=
 =?utf-8?B?dXQ1RzdiRHJ5TU81LzRpbFlZbjY1cUxVbjhoREtQQVpSMldoaGxSVVVVWVo1?=
 =?utf-8?B?MGgrK2xPaXZob0Z0b09QTEF4TG1EMnpLRFZlVU9nYUt0eXJoWEZLYnZmMWFB?=
 =?utf-8?B?ZXg3bU9JMnFxUWs4S3dCNXdGNjR3MTBGL1lxU1ZnbHVuS3RuVk1nVDRnTjBw?=
 =?utf-8?B?Rk1kZUZHMnZZWXh6dGMvbnMxSjlRaWowbVE5emV4RzBXMU9BRGNucENSSXZ4?=
 =?utf-8?B?NkhWSm1PZUZrNzllVGRQZk9Eb0NoMDljakxIaHpFRHpHQ0U2VHFtL2dUZWp5?=
 =?utf-8?B?Q1Yva2VZZ3N2REgwWTAyYjRIZXhDdnJZMlRvYjduMXNEM3MvZ1gvSVQrd01X?=
 =?utf-8?B?VzAwUXBGVlVaL1NabFhTejFURThxVkF2RWo0TENlRkdrT3RJV3A2bTJJM3pH?=
 =?utf-8?B?eGhSS0txS3hBejVFbnUxSkUvY21RUHA0NDYrT0lZZUZNUzJUdzZRa2wzbVlE?=
 =?utf-8?B?MEI2YXpzWHpXMVM0aDFtZjNZQTM5VDdFUmhSSEI2aktCc0xUSDdISjVqWGNH?=
 =?utf-8?B?VXc2bHJKaTdqajNraUFOY29UcWppSDZFZXdZSGd5Wmp6aW5PSWFaRG1iK2JL?=
 =?utf-8?B?WkVGN1owc0todWY0L0JPSkFKRm92OVJpeUhJSzI5YUlvU0lucFc4NlJtU2U4?=
 =?utf-8?B?L2dwOU1iOUdLQ0tENHpnbm1RTllHOUJsdFNjUndkTE4wZFV0RC90eUpnalFZ?=
 =?utf-8?B?QmlxZndxZnlYaHB0MjQ0OUpZWnVUclJvaisweDdiQVA5aTlQd3RIaURKYkxz?=
 =?utf-8?B?SEh1VmJXWmhmSElSS2h4RjVJb0h5WE5SOGRXYXY0akdjWUIxZFRraVk1TnZ5?=
 =?utf-8?B?YUJ4KzAyNUozRGpSMThwZm5jV2Q4MjIvTTNiMVF4TzdDYVdMbldUU2o2N0FF?=
 =?utf-8?B?L0Y1MVA1VkUrWStTRW1jN0VFeG9IMlp5YjNFUFVaSG1XZHFKSkhDSk9FZk5K?=
 =?utf-8?B?dlJyU3FWdTFqU3huTytnanZ3MW8rT2Zjay8xbjcwaG41em96WWNvaTJycnBS?=
 =?utf-8?B?cnJyU0I5OS9DSEhOZkFOSFNjczlKdVFUa3oxTVMwQmVqbU9PSnhWdzdhVHpZ?=
 =?utf-8?B?RWlGNmZoNVVWOEJ3YU5obW0wZVBXUU9RTHU0d3hwTjR1aUlGVEJrM01NcEp1?=
 =?utf-8?B?Nm80MzVpdGdPc1JWNGgzOUdpMnlXYThBQ09kSy9WVkNDcURwZlB2WlczK0xO?=
 =?utf-8?B?K1lGdktZb3cyNWVkbVNoMHIwdE5iUldvWE5PK3BGMG5TMkdDQnpaVmp3ejhO?=
 =?utf-8?B?Zi83VlNkcFZDenVxbUNXL1M2SzBCVy9ZOEFjQnFhSlJadTQ2VEhmaEdnWFZW?=
 =?utf-8?B?bWhEQnJuMndvZmUyK0lUY3dyM0hWcUd3MWxSSVczMlIwZ08xcFQ5eGlZcy8z?=
 =?utf-8?B?Qk5IUGt6bFh4ZU9PSHB2Mm9FMzhMVCt0SytNTEFNbnptVEhjd2VhWmcwT1gy?=
 =?utf-8?B?aUkvOCtYWitsMU9zbDlCOHczdHVwUVp1RGlySEJML2d3MW0xQWJadGxZTSs3?=
 =?utf-8?B?bjN2YmZUQ1lsUjZiSHgxWjVlZU91R2E3czFOQ0VBQStqam5yOUMyWnc3NVh5?=
 =?utf-8?B?d2lLRTU5RjRLeW5BeTVPNkNqQmRudmJadnU1ei9oWVJLM3F0UGZESDN4cVBK?=
 =?utf-8?B?ZmNMd0JRSktKVnJVcWhGUHgyWmhIS25JYjBVUjZYVVJEWktXSUozR0tZanFP?=
 =?utf-8?B?Q3gwb2U0ajI2ZTFySC8rTjZmbmJkVTFuMnJySVdBK2dneFNueGdPWVpuYTF4?=
 =?utf-8?B?a1BrRXVQUTc4UC82L2haRnlldkVORXhVd21sSmlXT01KT2pVVkhVM0dUZFR6?=
 =?utf-8?Q?K9ppAurNaBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHVWQUZ4S1MzV3Y5ZElSSW5xc2QxdE1DRHpOYmhkWHJSRFM2YTU2VGl2eG5X?=
 =?utf-8?B?RjdadFFEM1RKN3VQbldVaUtqdWtEZmpzOGkyQlU5OStuNjd3Nk1VaVBTRFEz?=
 =?utf-8?B?cFJ5ZzlscWJIU05OUjBWTXpXNGxNWUZ2UGFiNnl6ZFJyOGhpMXppeHNvR0tV?=
 =?utf-8?B?U2JKM1h4OVVpL3kxUWg2bGs0anVKeG1nOUZLaVcxc2VqZWlGVWIrYkt2MElx?=
 =?utf-8?B?QWF2ZERkNUR5OURzTGZJOUJNcVkwTndudjl2MjF5Y241VGVZcDZ0c1ZpYUdS?=
 =?utf-8?B?dU9xMmdFcStPSUNvYU9nTkRieUJMV3lMN2tnN0wzTUlwTWViVmFQNFlRa0do?=
 =?utf-8?B?djBzR0N3TUJJeHdnWXNtSytpSDFCN3JIa1Q1M3Zvd0pHMlQzQkdyRU5GVU80?=
 =?utf-8?B?YUE3SHU1TlBoT3lSTy9ZT1FTN3BmVUJSS2thazRSLzF1bUQ0QmhncVdjNjJz?=
 =?utf-8?B?bzBqTllVVFFKWG9FckFaaFgvUkFpQ2dBbUpaQ2drbk9rRXZneWN6QmZCVVdY?=
 =?utf-8?B?M2RSSXd5b1IycTJhN0lsRlpkcHRicU9FTFVJYXk5OVZlV2RSODBUYTRqV1RD?=
 =?utf-8?B?RXRKQ2RJNitnbVNNY3RsRlRRS0RLVE53WE4rZHllZnduMzFpblA3QVA2T0x3?=
 =?utf-8?B?YUx2UFBuNDFVT1NlYm1iVFkvcHhVbkNkNHo0S1l4cUJPT2kyNWJKTGY2aTZi?=
 =?utf-8?B?ZVFGSWJqb3ZnT1doakw4ZFQ5YlM5RWsxQmFpSnB3clhBWWUvR2RaenIxcXNl?=
 =?utf-8?B?ejkrb2c0eEV4TUlRZG4zNnRsYUdMOEk4RHdNaGZJeWFYQlNvM0t1dDN5UTRn?=
 =?utf-8?B?d1pmbDdBZm1oU1FmWG1obkFTVmdsVlNyTUxWdCtSRmVyTGtzTU05VEVjTUcy?=
 =?utf-8?B?ZFV1dndPdUdsTFYwbzNwN2kxcGJwb0FVVUZ0S3l1U3ZMbk1ybE5UdEhnMmR0?=
 =?utf-8?B?SVhNZW5VNURyQm0xUTRVVlQzbmVaalBXUXRWTC92aVNZbVU0RWZDZ2QzbDJt?=
 =?utf-8?B?S3lsYjRvNzdRT3FWSjFaaExaV3FYajZuNHV3VVY2RTkvS3N5SGxKK2ZhUlJM?=
 =?utf-8?B?ZERDNi9nS2tUSGNBemlZdi9ZYjgraHpOL091RGlrZ2dQWEtvQk9Xa2g2Zjl0?=
 =?utf-8?B?WmVvZWhGaDNHUHNrOXlySU85U2Iwb1R5eDlCVkZqRWM1Y0I2SnIxM3VEWDRl?=
 =?utf-8?B?OGZSeitMNStlK0JydEVRKzllbHNOajZ3bWszOEcrVUMzNEs3TW5jNVhoaXJK?=
 =?utf-8?B?ejFDUUdzUVY0dFNybVVpZVAya0t6b2RDaUVwR1gzcTJ2MVM1RnMrckljamtE?=
 =?utf-8?B?TEk0NDFmWm4vazFRZ0xTMFRnV0E0OHBvMjRpYzc1cG1RRmM3U3dkeW96RXRx?=
 =?utf-8?B?d0FpaUVBdlR4TDFmWGxjcTBPLys0ZUJrc1RnbExKR0ZLK0VwRkhYUWhHdU9W?=
 =?utf-8?B?Mjg1TWR3MDJGdkx2TXQrMEd1b3ZyRytFazg2Z1AxTDd0MkZONFVYNUNXaEl4?=
 =?utf-8?B?Z3FRc2FnekhMbUN4NzVEdFdjYU9ZR01QdTJoTGJDelJoZXN1T01JTFVxUm9y?=
 =?utf-8?B?RGkxNFFQd3BlaE40bFBIZFp0TW9JZnlkWlR3ZSttTFhmZ2VQOHl4TU9MVElj?=
 =?utf-8?B?NDhxdXVMT2pZQk8rc3RublJWNTJUVXVnVUp1R1lCSkhyTGJWUFpYWlNoWkk2?=
 =?utf-8?B?TFNqcFA5cXp5UWszTVlneWNaTWQ2UFZLaDk2dFpZNVR6dnh6d3JWTWhJNEs0?=
 =?utf-8?B?MEoySmJxcUQ5MWc4WGJ1aDMxUHpaR1lneFQxOVJqUTJzcndSU3JCTHkybFVx?=
 =?utf-8?B?Rkk5ZFl1QmUrMzE5aHhDZkZBUmFCZmZqSEVDTUZvN1JURmJ0L1FYZ3NHUjV6?=
 =?utf-8?B?K0FFNGZaeExjTzk0T0k0Mi9LbTZHOTc5L1hoS3U1UWwzL1lzejRWTEpFdCtl?=
 =?utf-8?B?YjZOQ2U5S1h0UXRaRnBDRWlGZmtWWGJnbWEyaEZBMDM4cytLRzVwK3dHWWYz?=
 =?utf-8?B?b1VSQ2luQVBpdmIzWE9NcE9ON2NRS0dtc2Z1VDIyV05Ya0NLREh4akVLam5u?=
 =?utf-8?B?dG9PZGdES0VURS9QWk9VNnA4THByRWFHdzlSaEVyMFJhQjNjZThETXRZdjZK?=
 =?utf-8?B?b0d4amdsbE9rY3FRWWMzRm1IMDBVSUZLcXNpWFFFR2tScTllZ0ZYaXZCOFQ0?=
 =?utf-8?Q?RVveTqrAqE7qDrca5/MWUfchR6lo0B5EOc0Y+pa8LcSx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e113f8ee-c78c-414e-e6ce-08dd88447278
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 00:09:32.2869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXnnsYxgT4W/IS0ghc1IqyCNItRzVKCp674wyY0QmVr75C/RBBAQgzDTZfdo/T5R10FsDEDRbcWctNDV6I4xEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9725
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

On Thu May 1, 2025 at 3:16 AM JST, Danilo Krummrich wrote:
> On Wed, Apr 30, 2025 at 10:38:11AM -0400, Joel Fernandes wrote:
>> On 4/30/2025 9:25 AM, Alexandre Courbot wrote:
>> > On Tue Apr 22, 2025 at 11:44 PM JST, Danilo Krummrich wrote:
>>=20
>> >>> +/// Returns a boxed falcon HAL adequate for the passed `chipset`.
>> >>> +///
>> >>> +/// We use this function and a heap-allocated trait object instead =
of statically defined trait
>> >>> +/// objects because of the two-dimensional (Chipset, Engine) lookup=
 required to return the
>> >>> +/// requested HAL.
>> >>
>> >> Do we really need the dynamic dispatch? AFAICS, there's only E::BASE =
that is
>> >> relevant to FalconHal impls?
>> >>
>> >> Can't we do something like I do in the following example [1]?
>> >>
>> >> [1] https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=
=3D2024&gist=3Dbf7035a07e79a4047fb6834eac03a9f2
>> >=20
>> > So are you have noticed there are two dimensions from which the falcon=
s
>> > can be instantiated:
>> >=20
>> > - The engine, which determines its register BASE,
>> > - The HAL, which is determined by the chipset.
>> >=20
>> > For the engine, I want to keep things static for the main reason that =
if
>> > BASE was dynamic, we would have to do all our IO using
>> > try_read()/try_write() and check for an out-of-bounds error at each
>> > register access. The cost of monomorphization is limited as there are
>> > only a handful of engines.
>> >=20
>> > But the HAL introduces a second dimension to this, and if we support N
>> > engines then the amount of monomorphized code would then increase by N
>> > for each new HAL we add. Chipsets are released at a good cadence, so
>> > this is the dimension that risks growing the most.
>
> I agree, avoiding the dynamic dispatch is probably not worth in this case
> considering the long term. However, I wanted to point out an alternative =
with
> [2].
>
>> > It is also the one that makes use of methods to abstract things (vs.
>> > fixed parameters), so it is a natural candidate for using virtual
>> > methods. I am not a fan of having ever-growing boilerplate match
>> > statements for each method that needs to be abstracted, especially sin=
ce
>> > this is that virtual methods do without requiring extra code, and for =
a
>> > runtime penalty that is completely negligible in our context and IMHO
>> > completely balanced by the smaller binary size that results from their
>> > use.
>>
>> Adding to what Alex said, note that the runtime cost is still there even=
 without
>> using dyn. Because at runtime, the match conditionals need to route func=
tion
>> calls to the right place.
>
> Honestly, I don't know how dynamic dispatch scales compared to static dis=
patch
> with conditionals.
>
> OOC, I briefly looked for a benchmark and found [3], which doesn't look
> unreasonable at a first glance.
>
> I modified it real quick to have more than 2 actions. [4]
>
> 2 Actions
> ---------
> Dynamic Dispatch: time:   [2.0679 ns 2.0825 ns 2.0945 ns]
>  Static Dispatch: time:   [850.29 ps 851.05 ps 852.36 ps]
>
> 20 Actions
> ----------
> Dynamic Dispatch: time:   [21.368 ns 21.827 ns 22.284 ns]
>  Static Dispatch: time:   [1.3623 ns 1.3703 ns 1.3793 ns]
>
> 100 Actions
> -----------
> Dynamic Dispatch: time:   [103.72 ns 104.33 ns 105.13 ns]
>  Static Dispatch: time:   [4.5905 ns 4.6311 ns 4.6775 ns]
>
> Absolutely take it with a grain of salt, I neither spend a lot of brain p=
ower
> nor time on this, which usually is not a great combination with benchmark=
ing
> things. :)
>
> However, I think it's probably not too important here. Hence, feel free t=
o go
> with dynamic dispatch for this.

Indeed, it looks like the cost of dispatch will be completely shadowed
by the IO behind it anyway. And these HAL calls are like a few here and
there anyway, it's not like they are on a critical path.

>
>> I am just not seeing the benefits of not using dyn for
>> this use case and only drawbacks. IMHO, we should try to not be doing th=
e
>> compiler's job.
>>=20
>> Maybe the only benefit is you don't need an Arc or Kbox wrapper?
>
> That's not a huge concern for me, it's only one single allocation per Eng=
ine,
> correct?

Correct. Note that for other engines we will be able to store the HALs as
static singletons instead of building them on the heap like I am
currently doing. The reason for doing this on falcon is that the
dual-dimension of the instances makes it more complex to build and look
them up.

... or maybe I could just use a macro? Let me try that and see whether
it works.
