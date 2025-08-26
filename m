Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E34B3528C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3230610E5B8;
	Tue, 26 Aug 2025 04:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NMGyW9dj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709ED10E5BC;
 Tue, 26 Aug 2025 04:08:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9c1urcAzgqQAOWeM31hNczr+xjs5rtQCtMAEUi08Bccr9Hq7vFqZCJ3n/SwbsUk2MxJdYHm1i0bLFtjmIU4Ah39jfM820pcwUmskHvE16GJmoeMqwRrrXA1kEqTLmkx3uR2UkrC2bH+qkrjajEBTmSLcg6IN1mAJmgNSeb9G7ljTx3DbAF+3iaiSbosvO3dY2P+WWSeJ9kNDHQIi42mxe+5Y5AS2Vqz7zej1FLY+VY23+a5roO1EokqKuciDrlhlaxU/goRP6G/0+6HX64BFtHBdmdUsL2qWA7JaQAAUbzNBZ/4eM3TW4O9uh/XxC7OT3PuDJ4tOemBnt52qF9fSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16U7uqzjOhNc7cdF0uQH60x4JK1SeDgI5a9IwxEWUbg=;
 b=jQJIQENPUjsjH+wYvfmQrRuOaBm0b7l4eLCyZv91AZn4va2rnNrYxj8TF8WjBHI4x6A2Z6ESczr97qjktthHOxZqsqWhTJba553lc+O+wyos1/ofBNyNl54zJjvnTyglL4YUaljxab8GMnJU4Rhwn2yVZ263oKOxGB+rnRSAhnuiDDKsCSpId16wW/OlAZsTonXq9qH7m5rvvIsYNK040I6ANubkVyAWByb4fQOxYULxm3T343WKgRd3bBpF+rFrxEFXr5gFOCwOO1Cj/cf0z++9dFL0Mo5lPOSR6O6U1fLrNiNre/7Hg+riuSPb4x9g7Gt/YDhMCYfvhW/t+a4ebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16U7uqzjOhNc7cdF0uQH60x4JK1SeDgI5a9IwxEWUbg=;
 b=NMGyW9dj82klr74G6+RQfDmRQa6AddkXYjnAwo/b3gczG54ggGv2Kd4VBDEgWdc3u08TIj5zemuvKptp2wpebW80Mv8eRPvlOHAAPgAhCoeTAh1xNUy7kZ/6xu2pOjDrrcDE5fOoN5dzk3h9chn4vdNzj7jxJx+ClpEEDd1rB0TCYFK/eNdAeNYOUKYLNXNzIjIUt5HLxH0O+ApcjMBP3Qi3W2vkniXZtnQJfE6z+mwba9gfHGkLzakHEilYar0scl3WwI+f7NF5hjjXicEC41Jt8sStQrQ8h7kyKa0GV/0R8jlHeosfumw+g6U1jA4eRysZIUkajKF01+COE9fAiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:08:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:08:09 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 26 Aug 2025 13:07:42 +0900
Subject: [PATCH v2 6/8] gpu: nova-core: firmware: use 570.144 firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-nova_firmware-v2-6-93566252fe3a@nvidia.com>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
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
X-ClientProxiedBy: TYAPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 695e18b5-6ce5-455e-eb3a-08dde4562afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGlKakk3RSszaEQ0SGJNTWs3M0hVd2Y3NGpDeUhwZVF0YkJ1UGc1VytVUXN2?=
 =?utf-8?B?UHh4eklsUkFCR3d1bU5STW5jUDJHU0RNZ3BzR0tDbk45M25IVG5YcUx4R1hs?=
 =?utf-8?B?dUVNR09WQlRJdEEvdndLRkpJdFRjQlBrRHNPL3F3bnE2SXlTaFZDMEJaQXdT?=
 =?utf-8?B?L3dIRkdHaWo3Y1VnOGtYbGdXL3NmNXExMzZaM1J5T1NmYk02MHFqVis2Z1Z3?=
 =?utf-8?B?K3dnc2xlTXlxYjFWeE5lYkZvQ09SdjRWeXRUWmJGeHMyTUNaWVFLelorUXpu?=
 =?utf-8?B?dFBRcEIzQ1FDSkNvRFZucjA5MzJSelNaaVZ2VVBkeG9odGJhMTFOZ1ZDREs2?=
 =?utf-8?B?eDNxM3Rxektza1hXNjJycTk1MEllKzR6eURONUtzQmUrODlXdWdnblh0TUJw?=
 =?utf-8?B?QzNvcXJkMWFzRURZQUYrQlNOT1pnNGl3bXE1eWFOYm9ld0VWQUNjL2R2b2Z3?=
 =?utf-8?B?V3M1WHNvdk5RcVVaWlkxM3ZyT0I0TWVrUHdTS3NNNVN3THl6TzltaHBvYkhu?=
 =?utf-8?B?aUwyUExnbWdFL2xicEh4elNveUxhL0llMkc4VzJnOWpKcW1GLzVPNFlxUWtS?=
 =?utf-8?B?U2JQQWhoRTdsVHViSmpNNUJQdUVXQUFKeElybDRqYW5EemJoYUxMUXFPQVVK?=
 =?utf-8?B?V08vYUJFL2hpRklidjJNR3BqN3V4cCtidHo1K0FlUVpTd3VkOGJGNFVCZkU1?=
 =?utf-8?B?a21CZ0dDeVZwd0J6REVSSDRaYmVaREtkRGd6MHdEa2dFa2R4NUcwcmExcUVJ?=
 =?utf-8?B?VTVERHJCaXVqd3JsUGJGWGYzdVVGU0ZOR1BHN0lRSENKNFVMTGNNSFMvZkps?=
 =?utf-8?B?Z0hGUHVUS0M1S1FGcndaenF6NnU1eWtlQXdKYUNCeXUzakgwdTMzanI0eDlo?=
 =?utf-8?B?SXNmUm9IVTZmM0k0dTVJNTVxaUR6MzBNLzhHRlFPWXQ0TExlcUl4aEFJZm1Z?=
 =?utf-8?B?LytoSDduYi81b3pKbFlGcS9TOHpVbXVZRThqTlEwMytiaFkwUS9UVEkxaisr?=
 =?utf-8?B?RnZKYm9RY3I5NGFSd1NWR3BlL3pFQVdjZDhONUVhamxYY3B0SmR6UFRJeW1R?=
 =?utf-8?B?aVdiR3RpbFNUcWxnUTUwejlUMG8zK3Rpb1paRHNNeDZiNDlTbmhzc2Y2RmFs?=
 =?utf-8?B?QVI0TGNQYVVpRlRSR25mTTFRZlVkVW9iTCtpTmNObDNMRWVYL2RXTjMrSnRv?=
 =?utf-8?B?b3p0NFBrMyt0VjA0RkgzRDd3SUNLSmxTZmFSbk96OElDakdwVm53MS8rZ0Fr?=
 =?utf-8?B?NG5tVy8rQ3MwbFhPTWJLVkFnOUc0QmxWU3JhWnlWVkVmYTB1VVdYb2Rkd1Bv?=
 =?utf-8?B?ZElQbVIrSlZPZ2cvaU5NUTNZcFBHT3BuSWE1cnRrN29vUzdaVlhUcEo3UWow?=
 =?utf-8?B?ODdpMjBaOWZ5eWF5eVc1aW9QYjVIcjdrT3lsY0l4R1ZRZG1jUkk1VExjaFNO?=
 =?utf-8?B?cEZFSTZlOG5JS0RDb1JIUmJwbDRlalllaHVzeXhIZVNHTWFKUkRIYjM4OHhJ?=
 =?utf-8?B?V2FPaUtZM1dYTTgwcXYvSTc2SjlsRXgydll3QUd3d25oYklPUmxmUEk2Z1JD?=
 =?utf-8?B?ZU5mYzdoNEdrQ1ZDdUtZb3c5bEtKSkZJR1dzOGlZdmM4V1dUYVJLM3ptM1ln?=
 =?utf-8?B?VnhnREtyM2tvd044RGxMQ0oyZWJkUkNSamErSy9HMjFPVFptMkFMQTBOZ3ZK?=
 =?utf-8?B?ZVlDL0l1ZS9vWUNnMHp0a1d5cmhVaHBJRzJrUFVvZWNkU2FGck8vTExNdkdR?=
 =?utf-8?B?dEhjdkxqRlN3bE9NUnFucks3Q056TmFGTGpSUWJxMDdlNWt4TW9CTXdGSi9v?=
 =?utf-8?B?cW5RK0FwZnlMZlAzeXlQa3VnMVhPYmpVZmhxM3k1RGt6VTZzNm5HLzBKNkIy?=
 =?utf-8?B?N0dkQ2Y2NE9oemJjeC9yZzBPaVVndStwRnRnalYzYnBMQ2Y3dWRUcTVmKzB6?=
 =?utf-8?B?d1FRT2laNHhiU0doZlF1RWlwQzRTbDFLUy9sdnFtUkNvNXNaU2czU2I3OFV0?=
 =?utf-8?B?czdHMngzZG53PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFZxQ0drekdpSDg0TlFubXBrdzcxRlBsaW9TSWlwd0ovYTFLNzhrOHhBOWRh?=
 =?utf-8?B?WVp4YnhXNGtobFd4dVFxdkJOMGVDRDRPNmI2VExDRlFhSHVPV3JDVzU5NnE3?=
 =?utf-8?B?MGtMK1NnVFpFdFJ0ZW5OSjRrUEd4VzR0RElnR0t0YjY2MjBDUENOY3lrRmZi?=
 =?utf-8?B?UVJiZm5WakdvT3VjakRVdjJXUGxWMUgyaStpN1BDemhBNGdYRks4U3owUXha?=
 =?utf-8?B?aTZzRnRSVkZBZjh5MEVRQWVlaXAwQVBYRktPaXhHeEhSazRZT2QvK3ZTc1pT?=
 =?utf-8?B?MVI2aTBZaFBpbDA2NVY0Mk81dG1oV1gwMDNXb3Yra2N3RDVIdHFXVVhlY2J4?=
 =?utf-8?B?dGh2V2pzMjdMcmRqQVh3UzhFL1J4OWpiZzFQaUV3MEVVa0VxdWN5bXVWUU5h?=
 =?utf-8?B?SEsvVjl4VDI2UFFTNGU4SStpaWVqQytvdHc2azZ0RnBGYmdYa1RWUENIdThU?=
 =?utf-8?B?MnMwNGlOYmZXbFVDVXVxOGpxdE9IUnBrTzlpTHdQTDh1TGVWNDd4cXVMamx0?=
 =?utf-8?B?bzYvQWptMUhRdVg5L1ZIb2pMUVZBRlhIRU92MzBvWGNQWndhamcwdXV0RTF4?=
 =?utf-8?B?WmNOVTA0NlJSbnlpQjE3N25FWGU2SHdJVnI5b2ZrTnBmakxZRDc3Nzl5TGRD?=
 =?utf-8?B?Z01TUWQ2UDY0bDBDK1ZqakpNZXhqSlNUUEh6ZXdTT2krYjVIZnIwbmdJSU5W?=
 =?utf-8?B?eklrbWJBNWIxekRJdzRia0paUmRwRm1VdHpHeFJyblAwKzNiQ3ZUUENxZXFY?=
 =?utf-8?B?ZFVtc1R6Rk5rell1c2pFci9ob1hXVEllblA2RnQ1SlMxVGZ2akxkTGNRNndl?=
 =?utf-8?B?dlZHRmJJRFAxZFc5TjlEZllmWmU2VkFQa3FqeUN1Z3RFVkVrYm1vaSt6TWE4?=
 =?utf-8?B?QUJZcXJGZ0N1YVhHVGJTUXU3Zm83a2RYdjc2ekxFT01FR3EyN2Vld2tIVnQ0?=
 =?utf-8?B?b0lOUnhiY3N1VWFFODBCOEpzRzNsT1A2RGN2Q3JyOFVvajlkNkdNdlg3NjBP?=
 =?utf-8?B?VjBaR2xoTGthdHFYZXJWWTgza283cFBNMSsrRER3R1g3b1dFQlc4bmovZ0x2?=
 =?utf-8?B?ZkZoL1F3VjRCUmRRS0hZOW9SS3p3YlVKSTkvbCs4TEFWamUxM2hjVnJrNHNs?=
 =?utf-8?B?RFdqVm5pb21JZkFnYkcrdDZnWFllaUtPRkY0dDNoNzhydzRSQVJRcnpxR2Zh?=
 =?utf-8?B?N2JqemRJZnl3cDFsclZMek5zN2UyYzRRekcvdWFKN2F2dGg1dlJNc3JScXdD?=
 =?utf-8?B?WW5zaUU4QWUrTWE4Y3kzT09sL2dYR3pPaVJHWDV3Q3Z1WmE1Y3oyRlNGL0ls?=
 =?utf-8?B?T3AzUitDL2M0UlJVcGFsbGk3cWRYL0JEZytSbmNQSE9FZWFWTmM0SjV5Tmov?=
 =?utf-8?B?NmlzakxJcEU0ekxtUXpNTXZyVEZTZ2Y3ZDFGV1B3c05BY0FTNlhub2kvM3FE?=
 =?utf-8?B?aUdzU2plaEJxdFZNcmtXN2ZyVDVoOFJ6aCtrZVFzMGkxbjJWUDZIcHp1NmVC?=
 =?utf-8?B?eHUwQ21tZFhuQnZEcFFna0xQTDN1YnNaQ3M2T0h1ZW0yUWY3bTIzM3N3a3A2?=
 =?utf-8?B?VVVjQ3lOazNVd2hKS1V5bG81cmJaRVN3dHp4NHdQNHdablgvTWR2aWhpRVJV?=
 =?utf-8?B?elY5M0tiYXkrcjBRc3RJVklJTldhWXp0Q1BtZGZ4NE14TjcxMnJVeHplODJl?=
 =?utf-8?B?ZFJRN3AwVWwrT3hFWjFpa00xa1I0R3lQanVpanFtZnFtUlhuZ0lnWURRZ3BB?=
 =?utf-8?B?dmZhdnVqOWc2WVlDT1ZuTDNKU0N5VkhkYkVyamV1MGl5N2pNd3ZvaHhsWktJ?=
 =?utf-8?B?MktFZnEwQmNxZG1kMkpZalhyRk15b2FQUUJVUFBPOGJ4b2lQV3hFU0tQZU03?=
 =?utf-8?B?cXNWNWRvQlZKakhoSGZkcWVTdlgyL1U2SzQwU0JYbzV1dHpLK2tEZHVQSHpX?=
 =?utf-8?B?MmhPdks5dGJRejRTZzdvWHVpeHVIbERvQXAvOGUxbGpPVE4zT21ZcUo5OG1V?=
 =?utf-8?B?ZVc4WDFZcUhDL282RUcrNjkvQVlSQ1Y2RnhMVVFveGd0aTlHMUN6ZitoZWQx?=
 =?utf-8?B?elRYYjl0TmxQb21BSkJtai9obWJLeGlVeHVoaEdaZ3U4cm15TVdlUHJ4dGtu?=
 =?utf-8?B?UXRUb21xVVJ1L1d0UzRsV01YU3RwL0RTbmZkT1ZWY1Y2TlFXOUVUbVJKTmcy?=
 =?utf-8?Q?qDki8ojZxuP4GrrluOEc1tE6ug6oCKzyADuQ7aXAOYRE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695e18b5-6ce5-455e-eb3a-08dde4562afd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:08:09.9094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAboZg34N+F12v9Tx+GG1kyTyIwhSCW2nBDKUAwQFNhdAEkGryFCjxAOaHMicO2ZwNhDgyYxbnKoHZsU03LG4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

570.144 is the latest available into linux-firmware as of this commit,
and the one we will use to start development of nova-core. It should
eventually be dropped for a newer version before the driver becomes able
to do anything useful. The newer firmware is expected to iron out some
of the inelegances of 570.144, notably related to packaging.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index fb751287e938e6a323db185ff8c4ba2781d25285..f296dee224e48b2a4e20d06f8b36d8d1e5f08c53 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -27,7 +27,7 @@
 pub(crate) mod gsp;
 pub(crate) mod riscv;
 
-pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
+pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
 /// Ad-hoc and temporary module to extract sections from ELF images.
 ///

-- 
2.50.1

