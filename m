Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8624334F466
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 00:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B996E98B;
	Tue, 30 Mar 2021 22:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922946E989;
 Tue, 30 Mar 2021 22:43:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktJgiPkMuYh75SbjMbqzJQDTZIwwYpADt8X2x1sgXfq3TTCrTnPIj92pv0zVqlOU6z86EK/z3DNoQY0tk5RMHcsFNP7BgfM0AG90Veg40tNYQldF2jeGjBw9kwd4LbgU5FQukWHVNU47HQiscxK1ai6IPlGjK5/EN/H5QvebkZY+pt2ovPljwDSUam8nDpOgjRHtNgKho8Q5/gpLFXBWZXGra3mXyPyo2h/25MHSxKr8W+ib8rDpExsmbdXmz0jFxpUrg0fCESP5/vGW9kzEnYrlImrE/Ytkc75YsRcfVIOsazOtYXB2ox70l/VeGJuytsD1DBlF54sRYUIqFSZHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNLphClAq7f+HN0c4BR9sHNfWb2MbBIS5R+KGKXClNQ=;
 b=IE1Zq7Z13WLSZJSCacjXjXg05mfPgwNdYiO9vjyZ+Ueyx0vXKf2J/43SYlRWyAmIqItFHJoo8rZLCY+w84JbzKhNLVE3MENS53EPPxW4Cub1EwzbYgQnzS99XCsd3xWuUHAMn/S3171WiHr6Z7S8ZH6lh3TMlf1Cdsz3W73ZLyah7E8JwCPJq8fOrRW+Rgb+ZlN4ZgsnhH6ZOjaXBQzICLwgfsKnczySEqFjhNyyKbjWoDbEmygJQZbHSneK2eYi9leRS/MoGd2fnPh2TBQQVXtKMmZflQjeStJEZPUYs78jDyRgs7mx5j8WJ3mY2HjfZoQaWIYabwQHhjeZtbjJ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNLphClAq7f+HN0c4BR9sHNfWb2MbBIS5R+KGKXClNQ=;
 b=OY0tuy2zncszr861bsNbSGLklMsXHIIyOWUEKKEqNLaPwsB5GYRW7ZdptuOxJj8f4RLoctXscvrd8WmbpWs78u3qMd64sF/dr40qDLGOamwtiDmzBt5a7eIaM3knz8UQvlmvz48ADgBqu8Fg7tRohtxm8Qi7z8dYaGdPkPTpyIgI2OAfS+nTkc7VKlFv5e8anuH2hzOs5sqq2Fd3cM8xcB/KVdGKdd54ShaFw81cszanHwHd9gL9yMkt6Rf4AsSCAFAFN8v4JwUxEnDPIs5dyKNx+w3c1lkgxXLlpqyKezgMOaZkcJktHZkW9k/7QlQ+cHc6ZaGYnAXlOegORNg7gA==
Received: from DM5PR13CA0059.namprd13.prod.outlook.com (2603:10b6:3:117::21)
 by MN2PR12MB3439.namprd12.prod.outlook.com (2603:10b6:208:cf::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 22:43:49 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:117:cafe::3c) by DM5PR13CA0059.outlook.office365.com
 (2603:10b6:3:117::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Tue, 30 Mar 2021 22:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux-foundation.org; dkim=none (message not
 signed) header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 30 Mar 2021 22:43:49 +0000
Received: from [10.2.63.109] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar
 2021 22:43:20 +0000
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
To: Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210326000805.2518-4-apopple@nvidia.com>
 <20210330184903.GZ2356281@nvidia.com> <12442194.rtmf8Ope3M@nvdebian>
 <20210330222440.GC2356281@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <bce0605a-336f-99ba-5b65-a8e5a7e49e00@nvidia.com>
Date: Tue, 30 Mar 2021 15:43:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330222440.GC2356281@nvidia.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d0370a3-da74-4c03-9f36-08d8f3cd494a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3439:
X-Microsoft-Antispam-PRVS: <MN2PR12MB34390BCA725A6B05EDAA4C50A87D9@MN2PR12MB3439.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yZoVVOIK+PbS8rTDmsqj9Nsrzi2ZWycM/4WXmljItK7pGeL9tNCF1Tw5rmY9zBSZqs5m12QV402mu10jNuLsm27HWtVTSUnQkOdJXl0O3f54gxnfU/2PSDpSB0vrv46uK1+RudQz0PqzyNRZzovoN626cfruycxGzyryhGcyZgJ8Y1+zrztMMLFtJayfRSJQVkGZ5xeOi4pcHy6hxFV6I35jrazjnOuJCyMPeye9tscuGNMXR6y8PqpBs0S4Rv3Sqf43Y+dAIBp4NFl7pePA18QpMykRU5YfhMHHU9nuEXCe2ezWRBc3Pq0CQVAL18+Nm3W2RzMgTVMpqxbSucHahiceG0KZNR7BCkDSTPhVF7IaiKfrHtwWqwGFzSeBHRlXRQKHyJJ9+6nMxp6bKHrJBITxgfGXS/9zoTKGBynOtxMK46IqwPjazPkFvKMupbXf0o8RRaEJO51nkUyIuNoqmGLgcQoWVLJ8z7+v+Zp6DnByyWIucTyN1Gm22q+pszcxYhF0lFns8sLwtb9yqj9iZslINaNVFAG5Tl8lZ922GzhYzEkQBzW6UqdTmxA7yNI/l5T5OZFFZ8lId0vbl7dLEShGa+LMikOYtirxK9t1zajIrvJ5XtQ+QmR7LGlmpQFU4cSZsaOQUlsn4YaGYD7NUfGWIxkxXRgGPnOu7KpFj0Xo1CgvdlPPILXnQrQNWMrS
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(36840700001)(46966006)(2906002)(36756003)(70586007)(26005)(186003)(426003)(86362001)(336012)(16526019)(6636002)(478600001)(356005)(4326008)(83380400001)(36860700001)(7636003)(31696002)(82310400003)(2616005)(47076005)(53546011)(54906003)(31686004)(70206006)(16576012)(316002)(5660300002)(110136005)(8676002)(82740400003)(7416002)(36906005)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 22:43:49.5218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0370a3-da74-4c03-9f36-08d8f3cd494a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3439
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/21 3:24 PM, Jason Gunthorpe wrote:
...
>> As far as I can tell this has always been called try_to_munlock() even though
>> it appears to do the opposite.
> 
> Maybe we should change it then?
> 
>>> /**
>>>   * try_to_munlock - try to munlock a page
>>>   * @page: the page to be munlocked
>>>   *
>>>   * Called from munlock code.  Checks all of the VMAs mapping the page
>>>   * to make sure nobody else has this page mlocked. The page will be
>>>   * returned with PG_mlocked cleared if no other vmas have it mlocked.
>>>   */
>>
>> In other words it sets PG_mlocked if one or more vmas has it mlocked. So
>> try_to_mlock() might be a better name, except that seems to have the potential
>> for confusion as well because it's only called from the munlock code path and
>> never for mlock.
> 
> That explanation makes more sense.. This function looks like it is
> 'set PG_mlocked of the page if any vm->flags has VM_LOCKED'
> 
> Maybe call it check_vm_locked or something then and reword the above
> comment?
> 
> (and why is it OK to read vm->flags for this without any locking?)
> 
>>> Something needs attention here..
>>
>> I think the code is correct, but perhaps the naming could be better. Would be
>> interested hearing any thoughts on renaming try_to_munlock() to try_to_mlock()
>> as the current name appears based on the context it is called from (munlock)
>> rather than what it does (mlock).
> 
> The point of this patch is to make it clearer, after all, so I'd
> change something and maybe slightly clarify the comment.
> 

I'd add that, after looking around the calling code, this is a really unhappy
pre-existing situation. Anyone reading this has to remember at which point in the
call stack the naming transitions from "do the opposite of what the name says",
to "do what the name says".

+1 for renaming "munlock*" items to "mlock*", where applicable. good grief.

Although, it seems reasonable to tack such renaming patches onto the tail end
of this series. But whatever works.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
