Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0FB3F6EA8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76DE897E8;
	Wed, 25 Aug 2021 04:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F69897E8;
 Wed, 25 Aug 2021 04:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoGDFMtKWH1zft6TWE8S3Q5fOoSC2NKX3k/6Rhd2LgObYR03stzaKWIq+g5UGuUcolRiti63GL+HmzE58TbZP7OMFtUMgTMU9AJikFIwgle1Jn6eh33wrlVOmrAgVHVRtK9MowJIIAjC+h7k9LzcAKR0yBw+OtyOOwyXHdrZNMnb9qy6LFH3wpAtmODBFsoPchaaw/4uuFlcBpK4ViTBD0G3VIjHCmoyLLh5Nv01RYivj1FoB8K6/eVDLTrfx1CVl7Ai8vP1Fu/ompOJKOozMTfW0YwH+9oV7VExVB62OrMclg2R1N5RUXxkg5HMrQlG7wsqSwUK4P2Nd6e7cdh5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwVIaxXKv3fJz+93sMHCMr2vU11fxAj9MPbC2Ej7rKA=;
 b=lzjQ+Z+GqX4i3/pwTUxR9ECFoVjq36fvAYJ8XoYvXx1dKZ3z1gZpS2TAhldxH2jfmQIBhSL1liySMeQiKSk0HY/aCOQd5T92K+aovkJzNerEB8dw0nvV1U8kQ30JTlmvt/lyg2vQXOo8ZoHPdNTFfJCRHTq7dG1p1PwZkdQpdzxsXp+ZY0GWrnaCc3tOHLk69iRILN947wCpoYpfAVLzNmc/WS+cVcj+dIwWmu1LVB+xzso1oZp8bu7mczEcnpmMZA12aI8QIsWXMr9Mb9ZB0IcS+2S4nfxBZ7KYOUrMIECZALHgeCws7eC/Fu5nkadn2aAG7sbQ7jkguLJhvgdVIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwVIaxXKv3fJz+93sMHCMr2vU11fxAj9MPbC2Ej7rKA=;
 b=gV/YAMXQbRqNCyvse4MIc3aLb/TWCu0LvwE8NenN4RNtr6NgdU98qA/VHWGhu7oh379yY1rj7qZJtkNpRsK39TUW6VYaI8mYaIsjrXDA3AqKS8bCdc84QRHA/r8Va7dpUS+MbknmhUQAr1YdqXP50Bhu6ouuM1MFQmyBweUcQpiM0nDLSRyzFLu9zhuR5KGtPtPOclbDvxkV9M1VEy83S0hhWojOR7Naz05obL4dhPWlrBcI5JofP+aU0UWUFJ5SEEvZKBp0JZ+0KPOLGmuziWsDt+CtCJ2/M4yZqLgTdwMvGMFJyP44A3HyvI/QN9gYhfEliQnXkied/vzDm6ktog==
Received: from BN6PR1101CA0006.namprd11.prod.outlook.com
 (2603:10b6:405:4a::16) by MN2PR12MB4238.namprd12.prod.outlook.com
 (2603:10b6:208:199::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 04:59:40 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::99) by BN6PR1101CA0006.outlook.office365.com
 (2603:10b6:405:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 04:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 04:59:39 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 04:59:39 +0000
Received: from [172.27.1.233] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 04:59:30 +0000
Subject: Re: [PATCH rdma-next v4 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <dledford@redhat.com>, <hch@infradead.org>, <leonro@nvidia.com>,
 <aelior@marvell.com>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <dennis.dalessandro@cornelisnetworks.com>, <dri-devel@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <mkalderon@marvell.com>,
 <mike.marciniszyn@cornelisnetworks.com>, <mustafa.ismail@intel.com>,
 <rodrigo.vivi@intel.com>, <sroland@vmware.com>, <shiraz.saleem@intel.com>,
 <tzimmermann@suse.de>, <linux-graphics-maintainer@vmware.com>,
 <liweihang@huawei.com>, <liangwenpeng@huawei.com>, <yishaih@nvidia.com>,
 <zackr@vmware.com>, <zyjzyj2000@gmail.com>
References: <20210824142531.3877007-1-maorg@nvidia.com>
 <20210824142531.3877007-3-maorg@nvidia.com>
 <20210824191248.GY1721383@nvidia.com>
From: Maor Gottlieb <maorg@nvidia.com>
Message-ID: <4f4a712a-71d4-ebac-48f2-766bfda61f1e@nvidia.com>
Date: Wed, 25 Aug 2021 07:59:27 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824191248.GY1721383@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f39f0131-c144-4fd0-b0b4-08d96785251d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4238:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42386FECB83F27F6AD3CB806DEC69@MN2PR12MB4238.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXeyH08UT4Q8Kaa1gJtE26DT8pMv+813A7QaSqE9pFbeA4LiuutJhnEGj/iC2q9J2vwmGs7m8u+hfBwc2Ox0HYcW4nVDjslE3M2n/vMQhS4F92mF+WCMRx99RULm4sM9mAiTIWCU/CFXA6d6yNjofACun5NrvxXK2+B4pVj29BLWFP8RAohk73lABpzIYTiFf+MUxu8VRxQQeS6/6rwP+S4E1ti+1l67+kwWgnAtoyKjbZHzIk5Q83ipPMXnxUFii5Fho9OEzmGMmJWqo3Mz6bGGbwSAVrprEExRzTqEKeMN24HQ0C5aAoXd4ZKk6eg9HS41O0wM1LUp20hKmF5H3+GiJ7isjgJO7HIgqVPVA2ay+a9GKyCNWBkaINmlad1VCc71ElW+YmM9HPAYvRbTSvQeJzFRYO+Ha8qbj3LsC9UJcx65D5J7tGrujrS/GAsu9znBi1esjNjg5pmAke6VqIIA1qLEM0/2tlagAyMiQLpJUCxEqmlFYy2anCgt+pSt6l4RDsL9tmy5cZNWDeCjL0VZBWXwGR5lkxXMjYGzuBuTQWocViapWcU3BZoztwj+3B8GRb0/J8xmSHK/sIyv6f/1k/p70STKxoJfzZvs7FvLzQ+TWvDDez99+VLXiQF4/Sm4VNpClnkS1IEeW4x6DLAwGS95dDBMTGuanOGf4hz82QngKCAITvytR3HxpSkVPMkKdyzTBOh38WSMLIQgeQNy3uy1YMW67IkB4D4uz5I=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(36840700001)(54906003)(7636003)(2906002)(82740400003)(16526019)(8676002)(53546011)(86362001)(36756003)(356005)(5660300002)(82310400003)(47076005)(316002)(7416002)(186003)(6666004)(16576012)(36906005)(26005)(37006003)(70206006)(6862004)(426003)(8936002)(6636002)(478600001)(83380400001)(4326008)(2616005)(15650500001)(70586007)(36860700001)(336012)(31686004)(4744005)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 04:59:39.8920 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f39f0131-c144-4fd0-b0b4-08d96785251d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4238
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


On 8/24/2021 10:12 PM, Jason Gunthorpe wrote:
> On Tue, Aug 24, 2021 at 05:25:30PM +0300, Maor Gottlieb wrote:
>> @@ -514,11 +531,13 @@ struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
>>   		offset = 0;
>>   		cur_page = j;
>>   	}
>> -	sgt->nents += added_nents;
>> +	sgt_append->sgt.nents += added_nents;
>> +	sgt_append->sgt.orig_nents = sgt_append->sgt.nents;
>> +	sgt_append->prv = s;
> Why is nents being touched here?
>
> Shouldn't it just be
>
>      sgt_append->sgt.orig_nents += added_nents;
>      sgt_append->prv = s;
>
> ?

In general yes, but all the sg_alloc_* functions update both orig_nents 
and nents (to same value). May be drivers that pass nents instead of 
orig_nents to dma_map_sg* (like umem did before this patch set). So I 
prefer to set it here as well, also not to break 
sg_alloc_table_from_pages_segment which use the same path. This kind of 
change could be done very carefully next cycle for all sg_alloc_*.

>
> Let me know I can fix it
>
> Jason
