Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739649C81B4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 05:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333EB10E2BB;
	Thu, 14 Nov 2024 04:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DbVqV53c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BD110E26A;
 Thu, 14 Nov 2024 04:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzELsCBsm1/kHUc3OHowBK6dn8klbsKO0eCTRkpMiA1AK8VttCVuFvGteGsHCvbamf4So3y7f+CVGNu4Ky0laJr1iqpmdjzbJ0GOyHxBbAh2wQa4MKdIkYcLlrR33E/nnKCydr/v21ac0HxiU06iR23LjF1CDEwZlt0EcUAH3e+biMxUpYJ+ySdfLq1QVLD2/IcYTayPnRjw+/Tor+difccfattyDchYVBs992LkfxyFXAxpCR1ZTXEpAQjsxjJPnSKavoYDdmBurHTlmey/vLzbDwrtWRiIAezDgNLjOX6HC3p37EEMJH/aOJDeIlyxXoRchOO4INglP6g3DD1qcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pJWoCvygYR6bKzG7W2ZTlcUVdE9vB+lWCQmINAp1IA=;
 b=ixhAj/QEE4bXz7/Sit0VV/UfwelJ7cZHaeD3nf1SSJ8gQJmy6iVELfrvrsp2Di6h/RcMQEkN2CKc8ZlNsNdkLC2ngX39FScZnOmD6LPhMrJ5vnxBXxOTYaGrr1zJLZca/jJqMC+6XjnXiRA3Cd/54Q5Xs/jFNSZIXS+yWyKD4E0jcB6DEgXl+72DUhC7SpHBfrvM4ZKQvNkIhCz/BsdDiheO58TJZNeBjek7V19YbDAAnnlmFfe3bxtPGWL86Bo2te2isc8EwadEXqwPIO2MO8wWUTcprDitJx19lRX+cw84kFzBXhKIwoGNH4if+ZmCGgajemUX7eQh5IJBRyMryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pJWoCvygYR6bKzG7W2ZTlcUVdE9vB+lWCQmINAp1IA=;
 b=DbVqV53caJS/kYClFTT/2uSC5Wfl3x4tpByRWa5K5fU3KWsyto1iGuj4n2QHPJl9yYb1geVtpgLw3YBgwXDhQSFRkVbisE9kmL2mFlBRFps9w/VUzCFW/qiJhcwnimMwD6AGOCqGh+ATEfV3ZSAjoYLTA2XJoh/HzTMWSvQai71tgcMhLDGSC67WG4coTT3WPnFIhFI57mzxygacakFzJMxfPiosQ1fwj5f2JY05gFtOirMvhJvQcz5zfHxWcO2zthTO0B0iqrlIKnIrR+pwDoiKFr40q5AG35Z5bnyAJUEzy5Tk7WPCLwrUJF3XiOKgbWc+HEv1FrlYpj1rwltPOg==
Received: from BL0PR0102CA0025.prod.exchangelabs.com (2603:10b6:207:18::38) by
 IA0PR12MB7651.namprd12.prod.outlook.com (2603:10b6:208:435::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.28; Thu, 14 Nov 2024 04:02:39 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:207:18:cafe::66) by BL0PR0102CA0025.outlook.office365.com
 (2603:10b6:207:18::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22 via Frontend
 Transport; Thu, 14 Nov 2024 04:02:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.1 via Frontend Transport; Thu, 14 Nov 2024 04:02:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 13 Nov
 2024 20:02:22 -0800
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 13 Nov
 2024 20:02:21 -0800
Message-ID: <0124e8c9-20c5-4177-b8b1-a4f94220f86f@nvidia.com>
Date: Wed, 13 Nov 2024 20:02:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/10] mm: Introduce and use folio_owner_ops
To: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Fuad Tabba <tabba@google.com>,
 <linux-mm@kvack.org>, <kvm@vger.kernel.org>, <nouveau@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <rppt@kernel.org>, <jglisse@redhat.com>,
 <akpm@linux-foundation.org>, <muchun.song@linux.dev>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <pbonzini@redhat.com>, <seanjc@google.com>,
 <ackerleytng@google.com>, <vannapurve@google.com>,
 <mail@maciej.szmigiero.name>, <kirill.shutemov@linux.intel.com>,
 <quic_eberman@quicinc.com>, <maz@kernel.org>, <will@kernel.org>,
 <qperret@google.com>, <keirf@google.com>, <roypat@amazon.co.uk>
References: <20241108162040.159038-1-tabba@google.com>
 <20241108170501.GI539304@nvidia.com>
 <9dc212ac-c4c3-40f2-9feb-a8bcf71a1246@redhat.com>
 <CA+EHjTy3kNdg7pfN9HufgibE7qY1S+WdMZfRFRiF5sHtMzo64w@mail.gmail.com>
 <ZzLnFh1_4yYao_Yz@casper.infradead.org>
 <e82d7a46-8749-429c-82fa-0c996c858f4a@redhat.com>
 <20241112135348.GA28228@nvidia.com>
 <430b6a38-facf-4127-b1ef-5cfe7c495d63@redhat.com>
 <ZzQxuAiJLbqm5xGO@casper.infradead.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ZzQxuAiJLbqm5xGO@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|IA0PR12MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f02474-3c43-4e17-0078-08dd04612e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEc4NTNUK2ZQc1ZVb0dxb0tVQm5odEErb3hLUWdkVDNRSk5ZbFdjNCtDZDA0?=
 =?utf-8?B?amM4YVQ2SVhSdmkyQ0U1TW1kRWd4Q0g4cFJuL1RiczVQaWxlYjZxZlFQZnh6?=
 =?utf-8?B?N0JPZlY0aEwyaWJSM2FJTGxqVXZZcDR1NHZCUXY2V1hLK3RIR0JyL1VicUx6?=
 =?utf-8?B?T3g5VXpCVDRUbTZ0MFVkd3k3cEFVS3B2TlNmNkUrNEZOU2JZOThON1RvTllk?=
 =?utf-8?B?THBWdUtMRzRXeVdaWVpiODhYd2hiUm9Kay9DOHBET1BGd1dWYWh3N0dJOGow?=
 =?utf-8?B?eDVxaytQNndIeEtHeWxQZm5EOWRFbEpETmtrYnNHQXFDU3JWdThzNmh2N0Fu?=
 =?utf-8?B?cHpKME9BcVlQcSsvQ2xURXluYlQ5U1Y0VzlmaDZHSFdMYnFmcDNDaHRlOGtw?=
 =?utf-8?B?UUs5UHhVM21HejBYd0lzK2dQVnliTHY2YnVYVWJ6eHhFa3JWWkhGem5OR1VP?=
 =?utf-8?B?RDR1MHI4TEJoTUJBb0ppemFaeFZSY2FDbzdvbDB1WFJGdWdzZXBHUUwxQmVk?=
 =?utf-8?B?NUp0VEdoSk4yYkl5bVE2L20vVDF4bkVBWE1SZFNkU2wwaVIvK0Erd0tsL21x?=
 =?utf-8?B?QkIrc0pTK3k4eWZrWVRkT2RTVzFFM2FUS1BOc0NJWEhuOXQ2ditRODhESDVB?=
 =?utf-8?B?R2dpTXVFc3pWQlh1Z2kzT2xsWlFEcENtZkxBT1VPTkQ2REwwNitRTmk3Mlk1?=
 =?utf-8?B?VFR5b1FLbWhPUExGRENQT1dpNmtiQXBjUlRlaG1xZE00MVIvVlZOZ3UzVFNm?=
 =?utf-8?B?WVcrbWhIMklEeDZEbUlEQ0tqMVU3QmJZcisrUm1aYklhenVGU1BxOVQzajIz?=
 =?utf-8?B?OUxXZ1YrWHF0b0tPY2VCQlpaRUp5d1hOb2M1NFVGaGYrbU15bFllWUUxQ1kv?=
 =?utf-8?B?ODNSU1NETnhHRjM1U2VwdEFtendSVWpLUzRaaVcwSHhmeHNDeFB5cnFvZ2VX?=
 =?utf-8?B?eUVlUG1MUGFnUnJZMmdCTExiSGlQempQTUpwUkdVRTFWUzl5TVY0d1FWeHI0?=
 =?utf-8?B?YnBXVEorcmpXWC85K1V4VzYyaE1xTFlRMk4wRnQ4QUFTeG54RFFtdHFmQUNG?=
 =?utf-8?B?L3JpQjJiODhaT1ZtbTJqcFJqWFhSaWEyRjRjVW9FS0daZ1ROK0FhejlXNjhI?=
 =?utf-8?B?aHlHc0NpbHEzSS9lSmdkQVhNQ0xIQjhObGtpTzhzZHFTR29EYnVTa1F1WnN2?=
 =?utf-8?B?N0pBNS80U2tGMmdDSWNGbVN1Y1U4VUFmc3NIYk9IbGt2WjQ5L0c3RTc3dHo3?=
 =?utf-8?B?L21YbXhjMXZpYjNabUI3NzJSVHQ3dzhnZ0dMeHd6UFZVbXdVeWI3Yk9LVHdW?=
 =?utf-8?B?bzMwVjdoNmtNY3gzaGJsbm9QbjR1QlA4VmpxTlJDZVJBZEc4TXhiZEoxK0Jm?=
 =?utf-8?B?S1VRUVdUaStEZGpaTFN0dDg0Y2lvM0E1U0pKalRHd3RXUE1ONTVRTVQ0bmZ3?=
 =?utf-8?B?c1RaZzFiTmZDdXYwaEJCeHRpTXF2RiswWi8yOGo1QTFJQlVZOWpDTGFyc1gr?=
 =?utf-8?B?blYzTmZON3F1NWxKTHgvZkc1SzhOdFJwSlYrTVNCUGR6eXpvT0MvVmdVV0Fj?=
 =?utf-8?B?NzJzTVVrTVBGUWl6dFpNZTI1dTFlS0k1UWx5aS9wcWlTN0RpTExCZnZERVFt?=
 =?utf-8?B?cGp5UkxqaWs4T3BWZGQwKzYwUE5tQlNTaGhSNncwcWFsbFZzZldpNk01RWFj?=
 =?utf-8?B?eEFYdzZhcnV2eE5sZGM0cnlub1FkQ2Y2Wnl4S3g4VzJSdkREdDVWais1cmZm?=
 =?utf-8?B?dndXTnBiaW9zVFQ0UGY5cmRKdW1HYlBKUmdIaE45NE9GWDMvNU1Mb1VydnRq?=
 =?utf-8?B?SWNXZXErTnRnZGkvWThadStaSC9aeEIwc2lpOWFDTHJyNVpQcG9xRzZ3aDc3?=
 =?utf-8?B?NlF2ZjRDQXhxWnlZVm0xaDNaSVErY0Y3Qll5WENRVnVYU2c9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 04:02:38.5924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f02474-3c43-4e17-0078-08dd04612e2d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7651
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

On 11/12/24 8:57 PM, Matthew Wilcox wrote:
> On Tue, Nov 12, 2024 at 03:22:46PM +0100, David Hildenbrand wrote:
>> On 12.11.24 14:53, Jason Gunthorpe wrote:
>>> On Tue, Nov 12, 2024 at 10:10:06AM +0100, David Hildenbrand wrote:
>>>> On 12.11.24 06:26, Matthew Wilcox wrote:
...
> I've certainly considered going so far as a per-fs folio.  So we'd
> have an ext4_folio, an btrfs_folio, an iomap_folio, etc.  That'd let us
> get rid of folio->private, but I'm not sure that C's type system can
> really handle this nicely.  Maybe in a Rust world ;-)
> 
> What I'm thinking about is that I'd really like to be able to declare
> that all the functions in ext4_aops only accept pointers to ext4_folio,
> so ext4_dirty_folio() can't be called with pointers to _any_ folio,
> but specifically folios which were previously allocated for ext4.
> 
> I don't know if Rust lets you do something like that.
> 

As Rust-for-Linux student, I can answer that one: "yes".

Some combination of "newtypes" and Traits will provide exactly what you
need here. newtypes provide a zero-overhead type safe way of specifying
a type, and Traits can be used to require that only types that support
specific operations are accepted in foo().

(Rust at the language level looks a lot more like a replacement for C++,
than a replacement for C, imho. By which I mean, it has lots of goodies
for expressing things, built right into the language.)


thanks,
-- 
John Hubbard

