Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEFEAAE160
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77D910E7E6;
	Wed,  7 May 2025 13:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H4KjhFbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9DD10E7DF;
 Wed,  7 May 2025 13:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIy9GnsC4LrWeS7tfbAkhohZR+p65M4EQjfRVO09NNARlpStsrNhdRm9xhDlr4NHS/IXtCL9K9S0s3pVsjeq4sJb8IwY5B0GxD5LbIXgXZRd4hnqe8lDIrcyeJVln0dK0Q24ZqqOtID5rum6s1rduyVP5kYRS4J9YsUGPN5mP9AK/52X1DcZQH9ozwccvNMU3S1VHGtOKJPx+nSGb3xRnPXfz9ctQsA1DfaTwHg9a9hwe6Ox4IfUSpodmoeYUfzGsWCGI88X/ah2UioIfzNJpgj2/RtqdeibD2UNK8gAykkrNgCAOcxK85OP5U8eKjB6JhQ7+/8LHmqUEe0Q2H20Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uMy2zuEVg5yQBUdwKNmg/DX9ldZqvE9nAsnL7m65T0=;
 b=VOlVVq0Evd3qrmvHX3zAs32AvCi6yxjH4tF9aIT9HywZelAwgiA62fm+85MF3YXqmt7EN0gEelIjAxRZL3Vw5ddOvrood78k4TdRBG5LbfixKaj8BUSd9YVZ2ezVnT7nKkbEMR6Wd2/C9vdz/c5soFZnecCyXWBvgP424RZ3Oy/Je2SX0fyo66tTGFHWP9nrliwZBy1QoGhbFujRmuNiXvQJX59zjTgzUgkcbOH3HZff41NB6dgepzRMCxk0WTA4G+wAZPktzMnHjJgHFlNKZ/ohXEPLWnw3Ee8nPVCMWsxxffmuZ0EgsZK+Ild+l40tCRYdue2S4VT0hnjYD0d8lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uMy2zuEVg5yQBUdwKNmg/DX9ldZqvE9nAsnL7m65T0=;
 b=H4KjhFbMYR0kLUllr7+17O5lTVSzbALHF2CxqPKbkDTX8GT7flr25CjGQrAX12DfN8440D3UAuVj+/IP3NEDLcdHsBq8iV525BlTgACSl9IUeN1nF/ZTVlyMwotf9GmiOdyafqHxGKJaXvKEzXmOmEgWIean80AS7fgMj4IF12UvXlanDCwo24v+aphXRuwi213hYr4AjdFtqdjN3s4KynXqYYf099C2KxY2fZVasB1CRtDctopPoBoARulNJRQpSgpcVEZPuYMWdS7nInQT2nZCDyG+oaO+Wx1KjUNPcK6Vy5eEcpDJCLohpXWMzdfKoO4WqMgJziSknCd/2kxAMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:36 +0900
Subject: [PATCH v3 09/19] gpu: nova-core: wait for GFW_BOOT completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-9-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OSAPR01CA0221.jpnprd01.prod.outlook.com
 (2603:1096:604:28::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d86b7e-8035-428b-71e8-08dd8d6e8263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm9YeVA0UVhsbU9hYU96bTkvM1Ivb0pLSlNQUmFXZkFNdHdPdEcreG1XS2Z3?=
 =?utf-8?B?TzFURDRHM05jVXQzODcwSkJ6d0xJcms0RmV4SlE4bGpLMWJLMVpnOUdzRXZQ?=
 =?utf-8?B?MTdzMVVZSkI3YUIrWFk4QWFxVjF1bWllT3BYNEZ2R1VEcnhHeWRvWFlobWYv?=
 =?utf-8?B?TytLdXN6NDFLNHpGV09nTE1ydS9IcWlTN3BzV0ZGdkJVaEp0cStkcEkrNEQw?=
 =?utf-8?B?cHY5UkZGSE9UV3FUc1ZwTGIwRENLSktuSFBySkhCbnJHVC9YQ3FYbEpPZHlN?=
 =?utf-8?B?SUU5WFlPbXlWUHk2WCt3N0lTWmpEWlMrVy9GdkNUL1FwRC9PTExGUFFZNmZP?=
 =?utf-8?B?YjVPTk9xejI3SGNKRnRibjF4WWhRNUxGK0ZmaEdCaGJ1cDArVW5LdHlHYmZx?=
 =?utf-8?B?eHhpUmhWQlJ5dEZDaTN6Y3M1VUNiaWlmYzRKVHVjNTlJTFpNVkwwbEhZenlR?=
 =?utf-8?B?dkRBWlNtcXdLUDFXV3NGbFdXV085a0RNQk44djBHODc5c2Z5Vy9Fa1ZRbXA4?=
 =?utf-8?B?UlhNaG4waDU0YWEwMGNYMHo2dTdHODhRaTRkcEkvQzhJemNhYlV3blp6UW84?=
 =?utf-8?B?S0FqWUJFS0JySlVqS3kxbXRIeGkxUG1TWnBsZFJjTzJWWmlNNjhEZHRQWmQ4?=
 =?utf-8?B?bkUwckdneCt1QlJxTHpQYXNmc1hYQUhWZGFTa05leGNOOVhMS1NrUEVLL1VJ?=
 =?utf-8?B?eTB4emlKZ2JyK2w4ZmlIS2VMWHBEZ24rVkZaNnNjbE1WYTVqSzhoamVFdy9z?=
 =?utf-8?B?M3pNbjZRNGk2Vk5PRENHeGtIWkdBaENXOExQV0NpU3VWaG1TcUcxeXh2VWd2?=
 =?utf-8?B?amN5QThveVhnQmg5TW1PaVV2R3RLSk5NVThUaGNtb09jblRiZ010Uk1DQng4?=
 =?utf-8?B?TWNqVHNQTXZUV1RDazZrQU9Ia3VLWjUvZWhkam1tTk4yNU1oVEhHYVIrUVc0?=
 =?utf-8?B?eTdESGFJY1JjUWJDNXRRdllmQXhoNVBISHV4NXcwUlZEUTNhazRhZUo3OWpa?=
 =?utf-8?B?Q0tGcVlMSmZ1cCtrMkh0N21ydEswT1ZqTjVoUnhjczhnUTFHQVF4Yjd1VGo4?=
 =?utf-8?B?ZWN1djhsNXorNGtpMUxzaU0xbG1UR1UwdldFdmZrbHAvYXA5S0EzQnpVMEFV?=
 =?utf-8?B?RU8xVEZpaVBUMllGQVJoSkMxMGZHUVV0VytzYlN0V3VmMHZKWXdDbDVWNXgv?=
 =?utf-8?B?NzFMNnV1SFRkd3JpY05hL3Z4WksxVGovS096U3RRMzlkQzlhd1NUUFZiTEIy?=
 =?utf-8?B?SHhTeHRPUGU1N29wcGxQT2FESXN5SEV3aW9DVmxESnZJNk9CdnBjWW95ZU9S?=
 =?utf-8?B?bjRyTFZFblpTOW9XSWljbEE4bEpmRGRvRnN1NjBraGszTEJYWFlROURHSVht?=
 =?utf-8?B?K0ZSeE0xKzQ5MDhiWEJrNUlPY1A5QWRqbFp1MkJYUmVKY2l5QnNuUVpvRnc5?=
 =?utf-8?B?WGZpNm4wLzZPMGowODd1OUxzY1R1c2Y4S2o2eGtScy9ZS3ZodHZwMFc5VzlQ?=
 =?utf-8?B?emIwSytDSFptMHdoMTM0WVdua0c4cTBhekVTbWsvNll6dmNJMDF0REx5Uk8r?=
 =?utf-8?B?VnhvekhaUDEzY3liTGZWY3MraWttc2ZVMzdXcGlRRGRCTWtDVjlHNTZEdUpJ?=
 =?utf-8?B?ZnplK1pWU2tZWGUzcWY4WTFnQmlCR3BlRFpkd0NKbGZIeXFrZmlBM1R1bFVT?=
 =?utf-8?B?bWYvcmFhV0N5b2tlOGhyaEZKbURLenRBVm16WjNCM3RHNTE4bExSTkc2ZUNn?=
 =?utf-8?B?NVBJN05Fc3A0bjdvN0I4c3RKc24ybVJTVXZjK09xNVlDWjd1SVgzYTdOcEE5?=
 =?utf-8?B?UE4rcGw1Mysyc1k0eU8walQ4bjlYc3FFenNoNU83NGVuTHJyTnFQbjZML21v?=
 =?utf-8?B?SWxnYzE2c29XdTkwYnlpcTBVMytraFpGeW43RSt1OXNwV3dnNWx1MEQxek9l?=
 =?utf-8?B?c2k0UkFXTUVGTGVQSE5yNlQ0WXBIOEROOFNHb2V5cTdXS1pXWGNaUnl2Y0lS?=
 =?utf-8?B?ZjgvQ1U1MURBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aStXaGFOb2pGdU1TdklJcE1CM0oyT2l4ZmJrcUxIdW5tZEhBc3VkOHV6OUly?=
 =?utf-8?B?UXpBWkdJdklxLzNjNlFzc3lWK2ZzZkpQNTBDelVvTmV6eWV0TWIxZWQ0bXpP?=
 =?utf-8?B?eFZtWUhZSUpsQit1NlhtNGxvM1loOExpQ1h5VktkZEpvUjBUamltUXlRTit3?=
 =?utf-8?B?ZTRBejlTMDh3RkIyRWw5cHRIZ0RURkcxS0ZRQXhPZjlFY0l3VmJPTlN2QXpv?=
 =?utf-8?B?MXlnOWljRHd5UGFXRHYrVkM0eks4K3BURUVKRzh3dmxOZ1FiVG5DazRzbVNx?=
 =?utf-8?B?ZUl0R2srSlVtUllWdU1kWU1Dckw3NVcwcjh6dkk5aXlkMlVlVm5qdjcxbHFC?=
 =?utf-8?B?bXh1WDhrdkVWclpRTlpFajJIb01tUXFRd1hvNmd3MEZRNmNUanJwTVgxRWhK?=
 =?utf-8?B?NElOc3V6Q1BsczkvR2dYc3lsUlBRckJIZ1orb0x3Z0Rka0NGZjRSbkdtZlYr?=
 =?utf-8?B?TkMyT281WDN2SXk5QWoxL3FwTU84a3dCdGJtYjdCTnYyYU41MCs1QUR0T2lj?=
 =?utf-8?B?MUcydFZvRm1OZGxNZmdNQ0JrMjI4WjlwQlhoRFBPNzBaMVZ4a2xWRktvVE9E?=
 =?utf-8?B?OFZabFpZYmlwQVVpc09OaVpYQzB5aTZQL2d0YVkxdjZiOGNhUFJJMjhQUjdh?=
 =?utf-8?B?VFRIbVREbGw3a24rcmFLMVBXRVI3SjRVOGFSR1AxZFhsRWowcE50UWpuQVdo?=
 =?utf-8?B?RmRQcVI5bUxHWVNXR3dyYVpxNENMRi84aEhpblhYZGZZeURSTzNHKzBZR2N5?=
 =?utf-8?B?SHZuTnk3am9UNHZNNWU3K3BtbXJ1MStTL0pXdVcvSDZUZ01EcXIzdW1WMXAx?=
 =?utf-8?B?Q0xYYXlsUWFZMjVuUVA0RWFTd1dDT1dISE5TVlZpc0lKN2d6dTd3SVZ3Zjhw?=
 =?utf-8?B?SW5CaFpyVXJnb1lTc1FnSlQrVEt5emdZVkd4MEpQdkJhMXU1NHZJWVVSRG8x?=
 =?utf-8?B?Z3NCMG1ORGVOMWZkZkNyT0tVZ0hXZHhRdUkvNTQwRDllN096NGtMT2U4QXcr?=
 =?utf-8?B?QzVEcndLVEd1azEvQ2tZN2pTVEFoY0hBb3JPaFNYVVpMVWM3Zi9iYUxmTkU4?=
 =?utf-8?B?bk5CVUIza1c4MkdSZGhybzVVdFNyTE8wdVN4S244d3VzYlVnWDk1SGZITzJM?=
 =?utf-8?B?c3VUZnkveFBNUlNNTUdYQjlmSzJTU2pyKytIZ0l5VEJuNHc0cGpyazU4NEtW?=
 =?utf-8?B?ZUQrd3JtSE0yZjFtMGtvbnZha3R6K05hdHppNUlXb1h6TEJ2TDE2alF0NDNs?=
 =?utf-8?B?UUtpSnB3U201NC8yNmdaYzhQR3F5VmJGWEhsM0VtSzZ4U2dacUx5ZTE5Mzdq?=
 =?utf-8?B?L3B6czhyeUpDYk84dEM3UUp2bTVoZG9MMWwxY1o3K09Bd0RsQnByVWZqdDhB?=
 =?utf-8?B?dTZtSlJ3ajIzclJHK1B0N0ZkQ0ZnUzJ3eElMdTZpN0Q4eVYydnZnOXgyOUZ5?=
 =?utf-8?B?WHM3Vjh3dmZGVGFPUExpY0RQRmcrUHFScTBNWUk5TUo3OXRpUjFMRG9vVENC?=
 =?utf-8?B?OFdYcWttR1g3ZXdmeHJGbGZ1VFVXYVZDVXVWVHJndlBVdDhteVBDMWtaTmJD?=
 =?utf-8?B?ZWxPYXRTanlEalZoV0RDSzI1RjZPOE9VOWZhT2NwT2VxcG40eCtSbDRKalJl?=
 =?utf-8?B?aS9LdnlPZUxFTFZMQmFONkI2VDBKZzE4b1YzaXUxSzNReE9RWVM0SzFUZTc4?=
 =?utf-8?B?VmdBT0k1ekpvbUVNdVBDSExpbFMrVzY3U2tOQnNJOTBHUlFmN005bWc3aGt3?=
 =?utf-8?B?OUsrYmlYeEdTRy9UVEU2cGxlc1JiZ2xNRSs0bmQxUWNTbzRqMzY2eXBVdklR?=
 =?utf-8?B?ekRnMUpldTRmK21UdUdxV28xbWVFUGMwOG00SWppRXdtSmQyazlsdHhqWTNJ?=
 =?utf-8?B?dFg4d05VWXV2UC81MmdBOXBiQ1NQVGhFZ2J5cUJaTFdtMkZmY1NSVWRqQ0F0?=
 =?utf-8?B?R2dsN2FTVU5yUVVXVUJnUnl1Z3V2cTJBZVlCYTY5cmZOQkdxTURocjlPNVBH?=
 =?utf-8?B?azZSKzFaenBzaVBqYVFJWFRtN3NNU0dCM05ZTmNsL2xrdFNxOUdTeGVWY2k1?=
 =?utf-8?B?dUFIdW8wWmxYTEVCRm9GVFU1a3gvY2NwKzRkQVJqMFU4dDBrc3F4UEFIYU5p?=
 =?utf-8?B?dllRTGxNZ1RxQVFOeW5pd0FEYjBtWU9NK2NwWDFSOFRrcnRDQTEwN0NXNUNP?=
 =?utf-8?Q?SFH3ppmkJ8lWu6neU/NXGVXTl0oWSxfCbZERTBEiv+G8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d86b7e-8035-428b-71e8-08dd8d6e8263
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:13.1198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/7faT1lWPSGFyjCteNXgxgTcyJnQAOSVQKb1NTgmUW5rMGaZxmd54LwsfQRSzStZb1lyWJGTA/vHkPI8tw67g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

Upon reset, the GPU executes the GFW_BOOT firmware in order to
initialize its base parameters such as clocks. The driver must ensure
that this step is completed before using the hardware.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/devinit.rs   | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/driver.rs    |  2 +-
 drivers/gpu/nova-core/gpu.rs       |  5 +++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
 5 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
new file mode 100644
index 0000000000000000000000000000000000000000..5be2e0344fb651e5e53c9223aefeb5b2d95b8de1
--- /dev/null
+++ b/drivers/gpu/nova-core/devinit.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Methods for device initialization.
+
+use kernel::bindings;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+
+/// Wait for devinit FW completion.
+///
+/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
+/// considered unusable until this step is completed, so it must be waited on very early during
+/// driver initialization.
+pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result<()> {
+    let mut timeout = 2000;
+
+    loop {
+        let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
+            .read_protection_level0()
+            && (regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05::read(bar).value() & 0xff) == 0xff;
+
+        if gfw_booted {
+            return Ok(());
+        }
+
+        if timeout == 0 {
+            return Err(ETIMEDOUT);
+        }
+        timeout -= 1;
+
+        // TODO: use `read_poll_timeout` once it is available.
+        // (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
+        // SAFETY: msleep should be safe to call with any parameter.
+        unsafe { bindings::msleep(2) };
+    }
+}
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a08fb6599267a960f0e07b6efd0e3b6cdc296aa4..752ba4b0fcfe8d835d366570bb2f807840a196da 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
     pub(crate) gpu: Gpu,
 }
 
-const BAR0_SIZE: usize = 8;
+const BAR0_SIZE: usize = 0x1000000;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9c6a9270ffa374bd386af352f6ad9b857f9c5f8d..a9fcf74717791dc7e23678869bf84f61e51873e2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -2,6 +2,7 @@
 
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
+use crate::devinit;
 use crate::driver::Bar0;
 use crate::firmware::Firmware;
 use crate::regs;
@@ -182,6 +183,10 @@ pub(crate) fn new(
             spec.revision
         );
 
+        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+        devinit::wait_gfw_boot_completion(bar)
+            .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a91cd924054b49966937a8db6aab9cd0614f10de..3d75e7acc6e0ddcfa142b1fb134cb5c966aaf472 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,7 @@
 
 //! Nova Core GPU Driver
 
+mod devinit;
 mod driver;
 mod firmware;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index bfb9555b203ff880c0fc373bb22e5ce6048015d4..401d885539cee03cbe732102f5e2233785a7b284 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -38,3 +38,14 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
             .and_then(Chipset::try_from)
     }
 }
+
+/* PGC6 */
+
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
+    0:0     read_protection_level0 as bool;
+});
+
+// TODO: This is an array of registers.
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
+    31:0    value as u32;
+});

-- 
2.49.0

