Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F936993A4B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 00:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CDB10E43D;
	Mon,  7 Oct 2024 22:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WK/lGi6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C69310E28D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 22:35:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/UrArEnOF806vvaoSiWxZ1Xv7TF29j4A7ww444H+YRBr4udHQWJVhGt0hl6zdFZjFqpbKDdqE9t/zvAVcCAQ+G09trgMHZSbCRbZh1pi26yrVaDOv0GU0QYWAY6JQ1mY7xcWombGvDEjNL8chpIb/d6LxYWFQgnzCJQhLWWCFzSMC6J2zC0Sx0cIIQqKrEqrF5CiotNGnNGTRLvz4dK+t5OFL2UCMp7w9FURJC9DCBM2rP+tEQR6VSFra0ErQw8qP40y8nJSA615nOgYoS/6fvs2kl8A1RiyWlUh8JU9u8GGrun/3ANZcdWxspFyiDpW6gXf7vTzFzbbGt8Vh0FmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcppHKC0MLmSgSeLAMoTkpEL86/01Mb89N9u8GeO4m8=;
 b=EUL5wnBLb6BJYGJTEp+rdEdTNpC7UobMx1ZrZjmK22yx4WsBg0HYRH13AooF39enienX5x3ruV4yhnZvnHOFdusLCAsxA7vbc7rwNU0LdtLtGNcPuDwTWwptwzB762jcD9rAECgAHbt3LACTTZiIHNFywB5cGEx/jN2r5u9Q7MLrodZRhyaTosToxt3jOw9To1iGpKv/eftLig2WkVFOMgYvINenQAHO5RMgmCEH+M0n71Tpw4Qq0gf02ZW8nlf5i71ARPzZlx4HpR61vwCom+LZIQ7lOUd6aWPZmWlMKXjFSEJiv4fjwpXX/+/o9XsQiT7glM+5/ke6ziXAg3z6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcppHKC0MLmSgSeLAMoTkpEL86/01Mb89N9u8GeO4m8=;
 b=WK/lGi6cxwGLNGV4q4Dzx8iPiSVsJZRn8Io5/+dEXAMZuEc7BfZ9bCLCZYd87OTuKfMCsQ7vGFOsw8i8L1VQ+AsXzgeowL0g2g1pvZ9BeI62QPuOASb8NiVDtdnbdqo91iGmy7wotLVuQdqmz9DhLEZeVUH5pHuXdv+8TiAPIMc=
Received: from SA0PR11CA0168.namprd11.prod.outlook.com (2603:10b6:806:1bb::23)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 22:35:47 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:806:1bb:cafe::53) by SA0PR11CA0168.outlook.office365.com
 (2603:10b6:806:1bb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 22:35:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 22:35:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 17:35:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 17:35:45 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 17:35:44 -0500
Message-ID: <77ad50fa-5c94-a93b-a123-48f653291f51@amd.com>
Date: Mon, 7 Oct 2024 15:35:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 06/11] accel/amdxdna: Add GEM buffer object management
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-7-lizhi.hou@amd.com>
 <d5694bb9-e035-c4ba-392e-ca06562355d1@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <d5694bb9-e035-c4ba-392e-ca06562355d1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|PH8PR12MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 778cce66-e192-43e5-d52b-08dce7206302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0RaRStRU0dmR3Q3TWI3TEU4YU1vaWEzRmFSOU9tL1o0SmhGOGRxemhGeTFv?=
 =?utf-8?B?WHB3NFNQVy9LbUwvSWRVcFgyKy9sYWZleVVNMEFYYkJzL2NlRFRnU1RPQVFt?=
 =?utf-8?B?cWo4TWdxdWptaUkzdFg1QjhVSFFUZmF3Qno2R3N1bEJ4bk5PYXFsQ254MmJF?=
 =?utf-8?B?Mm5vYldZWXdreHgreTZ6VlJNN0tSYUVLNiswN1dlVjNsSDlxK1ZXdjVqSmNL?=
 =?utf-8?B?UXgvcitJSDBzV2dxOUFUdnF6Y1NLVTErMnBpaDZqbGZOWWhRZDlrODBmeUdM?=
 =?utf-8?B?NXZxcTdYVTR6ZEdBQWsrK0hxZ3V2dC9tanFpYTlRQmtRYks4ckY1Q2tQaU9n?=
 =?utf-8?B?SnZhN0t3ZTFWVDd6S04xSml1SkM5T1BOdW90ek5acnMyWUgzMDNtQ0c0MmRj?=
 =?utf-8?B?OXA1N0xjOHJkZC9qQ211dWUycUFGOEpVaUNGQU94V3BGNkU5dnNVRXJabDBh?=
 =?utf-8?B?YTdCRTF6cDRGQTVGKzFUbFBmSUU4T3VzNldmLzVJeitDQjRsU1ZCcVlZZnVu?=
 =?utf-8?B?eEMzbG1lbWd6dmZXNjROVzE5QTQrSVlFOFJ2YjcxOWdpeGpNZUhZWGcxbG5q?=
 =?utf-8?B?djRXdTFuRmM0R1VuR0Rvc1BUQnExQXl2ZndlODdpeWY4QWVhTEc0bVdiTjNF?=
 =?utf-8?B?ZEJFT3JCVVU5djJZSWQ1TDdpanVMeFhPbTZzd3NJOC84VThocUFaNml5SWR0?=
 =?utf-8?B?RjhYbFBQUVluVlYwd1NhNGpoUFBENThadW9SS3kwdkxlWkg4MGZIdVlHYlZN?=
 =?utf-8?B?VzczZTZEVkpxSHoxVjF6L1ZteFozcTZ5aUxRQWhLN1J4dldqTzl3c215R0dp?=
 =?utf-8?B?T1g5YzAwc2RFWmhlUE5EN0oyYWVjWk9OU0NlOHprUk5sRnBncFE3VWx0bzNB?=
 =?utf-8?B?MHV3anhua2JXLzBIeU0rUms5a1NSeXd0UkcwRU1sZzQ5N3RvUnN5KzVreU1Y?=
 =?utf-8?B?bG0yaGc2alhCWmpsQlQreUVYdnVUYkozZGxTcjZabjNnQUZGcElYRjNtN09D?=
 =?utf-8?B?WXNPUXNwV2FvLzIxcDlCVTB6VU5KSnJaUElBdElBcmxSaGZ5OVhxVzUzemhl?=
 =?utf-8?B?Yk9RUC9sVndKeTVubVNkL2xJWTRjbkt4bnpBZXEwdU5oTk5CR1RScmpBQWFy?=
 =?utf-8?B?aktrZFJDcUNKZHNKK1oyZW5Wd0VKL3V3WVlobk1HZGhYTzdLY2JpNnpuYjRw?=
 =?utf-8?B?N216aG5KYmRXNFdhUEM0U3UrS0x0eHhvUDVzQWYxV2dISjZ0YWFLZ05oR2lB?=
 =?utf-8?B?a25PRlFYZXF1QjF1YTBLRmtTR0lTWlU2SFZBeUdUbU1sSkkxQ0dWQ1BmNlV0?=
 =?utf-8?B?L2pkK3dNOHdyVjYwOGl4UVFIazRBWU1ZbUNWY3BDUmlQc0JKMHBJN2gyQjlH?=
 =?utf-8?B?ZENnUkxCZm91Skd4WCtZZDBQMVN2TGhRdzRCdGQ3d3BxRzJQVFBiTXJSQjNC?=
 =?utf-8?B?QVpyU0VVY3B0d2haMTYybGNqZG8vNHFRUC8vS25LWS9KckYzbCtXNnFpaGF5?=
 =?utf-8?B?NC9uUnUzLzZZcGxlbm12SGZrTmFYZFZWVml1QU9iTkJOQjlVdHQyQlZSa3A1?=
 =?utf-8?B?WTc5V0lwcGtJZjdoT0dhL1dFUmV3NzdLTEJuRzJzVUtPTW9GOC85S2ZudkFO?=
 =?utf-8?B?YWhjK1NLMVZCeVgwNGY3SUdSck53bFFnOXlBU3djSjZKZjY2VzhTQzBCN0tV?=
 =?utf-8?B?YStETFBHeXJrK1FHMmN5di9SN3d3OEhMT3YzTlZaek51M0hiMzhGczBja1VI?=
 =?utf-8?B?WTBhcGJrdjRxMWtEYVl4TG5BSkU4U0tPUWliUU9hTWlPSDQ3Ym1qNUJ6Nmh0?=
 =?utf-8?B?NTVSOEZSUGwyemZUMWdtSlNoQnUycE9UQjkzUzJGMEdZQVhTUmNVUEg0dWkv?=
 =?utf-8?Q?Er7HGNrDWe3Se?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 22:35:46.4930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 778cce66-e192-43e5-d52b-08dce7206302
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916
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


On 10/4/24 10:56, Jeffrey Hugo wrote:
> On 9/11/2024 12:05 PM, Lizhi Hou wrote:
>> +/**
>> + * struct amdxdna_drm_create_bo - Create a buffer object.
>> + * @flags: Buffer flags. MBZ.
>> + * @type: Buffer type.
>> + * @pad1: MBZ.
>> + * @vaddr: User VA of buffer if applied. MBZ.
>> + * @size: Size in bytes.
>> + * @handle: Returned DRM buffer object handle.
>> + * @pad2: MBZ.
>> + */
>> +struct amdxdna_drm_create_bo {
>> +    __u64    flags;
>> +    __u32    type;
>> +    __u32    pad1;
>> +    __u64    vaddr;
>> +    __u64    size;
>> +    __u32    handle;
>> +    __u32    pad2;
>> +};
>
> Why not eliminate both padding fields by either moving "handle" up, or 
> "type" down?

Ok. I will change this.


Thanks,

Lizhi

