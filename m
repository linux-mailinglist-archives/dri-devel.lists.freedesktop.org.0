Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06427494EC2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CA510E6BD;
	Thu, 20 Jan 2022 13:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F4F10E6BD;
 Thu, 20 Jan 2022 13:18:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJt+t/E+W1oizAjojUlEhPRL35vHO+rO/EeAt7FDX4Mk61xVLGQ2tUqxoUbj2tdmytwRDRCI+//WsZTG8eUfTyNHA6K4rR8UYNWhnvr3TuOWuXrntOqklJqeaH8JMpRVVru6gwci7sF9chN2JPYMbI1vxDA4GhxhJyua39nbFJRvU6QAz+kJV8mTt3SnccrcA8KGaPLciNw8PxMlNt5wvmrZtsLqlY0exmJgZpsaiCNsLFp5KiOSMHSTC7ffGrq6uy84l1PGVWBpDSayuRBXImp5Z2LfeVC0wEmRG6LqJxkL+mfebG5p2AmrUq9kMsIqpodWeNqHe7PJU/4SW2pWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nepc3Y2HTNDMj+dBQ9ABzJu2k/FiUKmg30JJbke4DBY=;
 b=VgGpHr9Gqg7Vqf96xiwqK8dR3ehtJOi5F8/nYZzMTa9NeJS0OYyIz1XxAy7LnpYezzqEB4Q6i3pUv/GPemI/w6xpkY/6dOxROurGYW7yAQ52PE/DvW/j9RcKr7nMQ6KNyNjcQcDqucm+MsK6fr4/3L3w+/ugX8Dl8pfZ7Z75REjvxkduRZ3QWL/hDgzUigLKlHRlXrA9wpzTJShOOWwHPzqfwYOeJDLwjV8VsH9b0HHrNSoL0NY9oD0LqjKf/Ci5EqEPJDVYdWV19PxRP8FJCtEtH8Jtmqsc/CbOt+9xhSk381z0xW3CRxLTEXNLIvUIBczgKoczdcFZVsM88hUFDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nepc3Y2HTNDMj+dBQ9ABzJu2k/FiUKmg30JJbke4DBY=;
 b=AkLc0cWQ2a2H/2ilprYU5oWbHCF06FwBzHWKq1AAshQo4Je0y/UJFvQuoCMXtCNVPiEKECdiKrmywBEjs+kJ0KBMCSIywf9GReIPsbsdgJ6uNA0jh81xwWX6bQf0v8KNGEJZZ1YNt7E5hu4KsD7Hv8GdPHqjvyplHOFOVq9WG6O6FLaceF16WxVTuWvdznEsSIMmAMu63qUCCuaK6OgV+0vVENLTNnzbs/wqPtuIFO1Cdr59kCgCgsxvfXCo5JDZRtTa+afjgjSuaoYwN2234flRxe6Z5Enr1NiDPCoYoTb1rr8BGIpIrjxeMOBiHn6XTAVTNtJ5wCWM4K6B7hgXFQ==
Received: from BN6PR14CA0038.namprd14.prod.outlook.com (2603:10b6:404:13f::24)
 by CH0PR12MB5043.namprd12.prod.outlook.com (2603:10b6:610:e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 13:18:21 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::f4) by BN6PR14CA0038.outlook.office365.com
 (2603:10b6:404:13f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Thu, 20 Jan 2022 13:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 13:18:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 20 Jan 2022 13:18:20 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Thu, 20 Jan 2022
 05:18:17 -0800
From: Alistair Popple <apopple@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 03/10] mm/gup: fail get_user_pages for LONGTERM dev
 coherent type
Date: Fri, 21 Jan 2022 00:18:15 +1100
Message-ID: <2432841.uOC12ROH9Y@nvdebian>
In-Reply-To: <008b5ff4-dd53-d652-46dd-5ce771c69a0a@oracle.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <20220110223201.31024-4-alex.sierra@amd.com>
 <008b5ff4-dd53-d652-46dd-5ce771c69a0a@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c433adb-d488-4440-8849-08d9dc1754f9
X-MS-TrafficTypeDiagnostic: CH0PR12MB5043:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB504351A69486B9972E11DF0FDF5A9@CH0PR12MB5043.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIxsW9LG0yM6CIPdXy9Qtde2yw6axnIR8idS5AiQQSsP3Sy7caeHVIWEAOCZOBVAHbCiFGkFJbE3DQuq6HzDx+JqbvIGwj8L1P6hRUsKAF1Oryx1p/2eK4eSjML6yBrxZYx7g4fbA4+iru1BJRO4NPRvL4CoQmQijzaSVfEMhXepOMnTHvpjXAXp4Dh8izgIWBW8FZCtMgMb9qGpMOGhqppBWaObezuuuSVQn8xhWI1dVr+ctB4PE0W6ZpU+A1KmRMfpKFJVsCu5q7aBmnXw8RsvwZ0BJvRgXOSExx1/S7yRl9qb8Lo96EQllLTpmElN8uCqET2ZoHsuHV2cYGeAlSdH3SbhgQmnldAYjdBJt7uOfth3nKP3jFiw7+zEvD7UfI62WUZ++zPOUTYw4KwROrkc7qparsper8FiZZ1ZjXhmKFNeiq2PY/Ed840LFJv7Fq2qDP9NRnfZMhtOkDXR2jz0L6qkXgdXW11f2q2xSBR2zs8B9irveuAKTLIAn4N4TGafGiMedhQOXaDuLReQLZUTvv1douAF3LhdKf4JXppFCN8Fl3zMTFfEPf/lyfXgdJajW36DS3tzh8/GJFEqEaxD+wGiPNATtUWDM9V/25Kb5npDHC7PEIEYVhDUtdErqdyMEhEUUjCQleP1q0maSUdWlji0Mk8tKxa+TWOu1WwGI0ZMyLyO9PoSYI2LZIhnr4mcmu5lYtA+zKhdGoVQfprk2Ot7s4MHpwHPU8O5aJtg+iVGLanBZjcR1mhPrtOcYM2pVOBC9cuYv5U2Sim9NV6o6fgvunbHBRjPC4W3JHzDihOv1ReGAdlp5HxDTcmOOFwhYnBClnduJZz0g2eHQQBYRGtYT0Fm0oWMQ9xcbMurRMYOnB6lzevIceQyyzHi1bFtyEMseHQbF0ghpbhRRzDGDnW4LnMlP7soOyqa7tsV1wRlr/SczVdUzP410mbt
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(8676002)(26005)(107886003)(53546011)(5660300002)(110136005)(83380400001)(54906003)(426003)(9686003)(8936002)(70586007)(86362001)(336012)(316002)(70206006)(9576002)(4326008)(966005)(82310400004)(186003)(36860700001)(16526019)(7416002)(81166007)(47076005)(40460700001)(33716001)(2906002)(508600001)(356005)(39026012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 13:18:21.6071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c433adb-d488-4440-8849-08d9dc1754f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5043
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
Cc: rcampbell@nvidia.com, amd-gfx@lists.freedesktop.org, Felix.Kuehling@amd.com,
 willy@infradead.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 20 January 2022 11:36:21 PM AEDT Joao Martins wrote:
> On 1/10/22 22:31, Alex Sierra wrote:
> > Avoid long term pinning for Coherent device type pages. This could
> > interfere with their own device memory manager. For now, we are just
> > returning error for PIN_LONGTERM Coherent device type pages. Eventually,
> > these type of pages will get migrated to system memory, once the device
> > migration pages support is added.
> > 
> > Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> > ---
> >  mm/gup.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 886d6148d3d0..9c8a075d862d 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -1720,6 +1720,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
> >  		 * If we get a movable page, since we are going to be pinning
> >  		 * these entries, try to move them out if possible.
> >  		 */
> > +		if (is_device_page(head)) {
> > +			WARN_ON_ONCE(is_device_private_page(head));
> > +			ret = -EFAULT;
> > +			goto unpin_pages;
> > +		}
> > +
> 
> Wouldn't be more efficient for you failing earlier instead of after all the pages are pinned?

Rather than failing I think the plan is to migrate the device coherent pages
like we do for ZONE_MOVABLE, so leaving this here is a good place holder until
that is done. Currently we are missing some functionality required to do that
but I am hoping to post a series fixing that soon.

> Filesystem DAX suffers from a somewhat similar issue[0] -- albeit it's more related to
> blocking FOLL_LONGTERM in gup-fast while gup-slow can still do it. Coherent devmap appears
> to want to block it in all gup.
> 
> On another thread Jason was suggesting about having different pgmap::flags to capture
> these special cases[1] instead of selecting what different pgmap types can do in various
> different places.
> 
> [0] https://lore.kernel.org/linux-mm/6a18179e-65f7-367d-89a9-d5162f10fef0@oracle.com/
> [1] https://lore.kernel.org/linux-mm/20211019160136.GH3686969@ziepe.ca/
> 




