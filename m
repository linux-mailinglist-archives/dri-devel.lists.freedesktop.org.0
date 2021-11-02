Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77196443267
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C62F7314B;
	Tue,  2 Nov 2021 16:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B857314B;
 Tue,  2 Nov 2021 16:12:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L50zvlS3R0uJRbdXfVvU2ERornkZlT1CUXly8aHdlf6xTtAhGVx7F6GLT8X1vtY/vaNoAPY5Y26Szx+hGn/lRkQDBrZQmfDOKPITeQffMhleNG4W/lZ44ViqmGKOAY12iNW7o6qP29KkxlYQLN4Y8CttXE0LkXvw1JfluAUPdDrp3PHLtPsw2F8v+wFbcJ40QYNKVAac4sqmnu8clnDvFZQUaWQDXlM5/eXWom2J8IYVb2/hf8K/z3RAoE6EjlVAbVdZHCN9one5+BinhS/fqtZ0Y53y7FmqJVQ7r1uYyZe8Pghx3FsUMwjvFqaOny9CjdjVP4RLIaX5cHyYYgst8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fF/DPyr5F4UIVcCILEFrxI8XZnH/+e84dooQDgrngW8=;
 b=XW5smkEx7knSzHWBJ55QUYxdN5po4rtv6dtdmGghdULJ/5CXi/gkERFo35Ldt8U7MjfQTgy5qWx0QjAqafqxeVtTz9PPb8wOvr2oUlsRC5fM0cNV3caPh1rrYcTQnfqJq4Iup0a6w26de6pHURIt5+Ur5GKAvCv6jfTPtXNHqFSlTTZw/AvKE5MBn979PSSL26lGATT1+h0p2ILdqnYeBNj5tbeoF9gKVLaNL48TgOG39YwOSykg3EBaw/sit1pwkUTKmDglfVuORt9/+xE/qPGb09JiO89TKB79IpWo07OVTwyOWRUDebJJZ6QAm44hl1gDMmpGD4xEhFINYgkHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fF/DPyr5F4UIVcCILEFrxI8XZnH/+e84dooQDgrngW8=;
 b=ukAOq6U2gTPELQjWTBQFFPWxw1JTagOIBGEuXAWZLmEWi5OiQ8PqAfRHTBXGalyue0OOtjh0+P3UjoFMcgjFzIKj+1wJcPmmsyvnMmGYIzaKk5eWo3vomRDmk/nUwuubgIsPbSeL5qj9twZ73OsS/x5ZbC40caYZdk1ZBeWr2z8fdDYXoZyYOwBnBnp+BLZZaN85Ri4qFqyWIdyylV6J0FwnJyBm+SKVKRXD/6i+pdobOmjMQtG9aojPCbn+jyuaDXk0bK1xgsXEYKo1nrOsfMmMGRop55lRtNATajsSpp/Ze5f+tkExnsCSVycD1RGTJiSnoG/Ozbb1bR2MIW4FxQ==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:12:13 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:12:12 +0000
Date: Tue, 2 Nov 2021 13:12:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/29] drm/i915/gvt: devirtualize ->{get,put}_vfio_device
Message-ID: <20211102161211.GT2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-15-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-15-hch@lst.de>
X-ClientProxiedBy: MN2PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:208:160::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR13CA0022.namprd13.prod.outlook.com (2603:10b6:208:160::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Tue, 2 Nov 2021 16:12:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwOR-005ARL-Ln; Tue, 02 Nov 2021 13:12:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dc1eb46-6452-4174-e470-08d99e1b87a5
X-MS-TrafficTypeDiagnostic: BL1PR12MB5286:
X-Microsoft-Antispam-PRVS: <BL1PR12MB52864C4CE4EF921F5224BDC9C28B9@BL1PR12MB5286.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QCaL7uAsseydF5ROPHkRmCY1UNQXZdXFdnfi53OKt5cUZ2PEPH6xEN2bAjEih857woJRI408B80hORZExegui4jUxnsG0aPL8h+d4G3L06At3iYZt1mV5yMu0VtK483+h+sKPJ3i7+CrFbEXiceovfN6jR5h6YoLYbSkpTdaHdbr8nXrcJ/ANshED7H7Q8B4cYhVwqSrfjDMqzXOmyjS92XCkrMoabr0HY4PQxuXaAJpUzrwwp+Jruka/syKDYhQt+45zR/Am1QCqSROw1uu0PcZyKNbJgsJFshwdNNdhy9ee/WCD8aHALod1Z3MmUFPH9dgvugalEEqUzMkzReoE+nWz3FEcfcZyq3sdej3K0A8r7WP2Kmembwr+CJnMTZjSbocujbJHNJW3WQvq9l9AzEL8Gr/xB4K5h0qs4VqCOikQMkikA/X2HxW1r5xG9DMYURgsu+J6w7A+t+02WBnOWZMMFbxqcXJ0My5NqoRCNigS9wd7IC1qUIJ/RqRktDTOUi4aXrqg6JJjrs3cLT2guM8Tpe6lXHGIJ8YeqO9eLoSvUibZ7fV55tqGQK/dcRBeEria70siWs5yYbUOt5UlWIK3fz//RyOC0Y85GPp/PXzYprqC6IMayM59UMumm2f1hXcO2BrUE239ZnWIEHKZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(508600001)(8936002)(2616005)(83380400001)(8676002)(7416002)(5660300002)(426003)(36756003)(66946007)(186003)(9786002)(38100700002)(4326008)(86362001)(6916009)(4744005)(1076003)(26005)(9746002)(66556008)(54906003)(66476007)(33656002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F9Younx7ZJcHVzUhHsbnIXImfQWIcf0wv1qKA3v8zXcw8ytKudBLStHnY4wY?=
 =?us-ascii?Q?wHeqGln6zB+PUfWqzAYD+nCLmxwTZ4/KVlYML93myb8rQuGk/cLFDLsttbRT?=
 =?us-ascii?Q?X86YoAsvR30bs9jyllfzKjgTvSRb31Sa0uur86X6GugxOk2NEfAKxWoArNfp?=
 =?us-ascii?Q?/KCROB8I768d4UVNcwCDeZ1JDtFt25A3kFsGaEw60Zce9Vr9YAyvpnJ53xD+?=
 =?us-ascii?Q?PgBNJzlHuYZvwI6schrCqvaLqsPH2CAh4MvGUQPetxyCrSG0/eqxREljFNGh?=
 =?us-ascii?Q?lLvneBswMX1R0FrHCF59yu3OGPPwG0imbDkHeOj/Qb0qNv/EiHiyyol5sqwq?=
 =?us-ascii?Q?pGeG7kEzjziUKc0C0RoNYu1GJfiQ77JH6dkx7iINX2f6y5wM387yjq5v6VM0?=
 =?us-ascii?Q?0KGHCOXoi5/MQPbtm57UZy8fUR+VUsnylxrQEVFDcapviLsy89nPU7RMHELQ?=
 =?us-ascii?Q?qt3OJGeJLc43TOuPZbo6snMk7vovAIO61v2BT86t4cZV7i3O00/6Fh4SG2lD?=
 =?us-ascii?Q?6MSj5ulsR4/4IeMpkl7ktdKQAGwpG2s/iHZTgzBLcnqi86mB0X4MziIvSVNw?=
 =?us-ascii?Q?UvPun+9RAIWA33lOQBsvRMHCS/+BH2ZeaggVW6REcpMk3oPSR7RwCEKJadqB?=
 =?us-ascii?Q?kNm9jG3z9lS7nD3o9GbLHBn816mpxY/Etkmqc30/UIeHeoSXRbMZU9UiZF8Z?=
 =?us-ascii?Q?vA3fx8rgVl9vD/uNRt8URCjDRwO7UInc8jo0bMZyJcQ5lRBoylMVo3iVsNOu?=
 =?us-ascii?Q?xIsP4z5zTWwSTh6OIBskBDe4/1tQOaJcPLEeZQrPKWFGH9k8b/mf57i1HOlR?=
 =?us-ascii?Q?uVicmBve106EGOvSoZoUBi5uacjCjNZ/+047+o9xHR69QXbb9THsOKr+6qys?=
 =?us-ascii?Q?6gqREu1I+c7O8M16e0SlWT9SvwMWvipmQ7GWLsBHYLVrjZu+j+VuMqMopqPp?=
 =?us-ascii?Q?rpo9tdPgX3t5893sh08+955oZQ7o1iHHvpmW5asGYvDXKlI7f21gepTF2ln/?=
 =?us-ascii?Q?SmjbTMzeWrcbuz29FaorSGZepKdlaZ76oUQPTOA+3gCM92jcmtexSB9LKKuU?=
 =?us-ascii?Q?AZ6ZTXDGlMUtWoYpJWng3DDUPIrWYV7qVNvkAq7GsuAYVhGRPEVl/ppUDGSQ?=
 =?us-ascii?Q?pYej1G8M8ArQ+5dpJz68fcqBxbsZlhBGoUfiVuUa/+1COIN4iJzZLjeNVhO1?=
 =?us-ascii?Q?6BHvUYmKZ5LPeYt3e+fqvquIA7QytUTqPtnsu0dHvexip0HL+g6DJgZti75Y?=
 =?us-ascii?Q?lZHgUcIbfARtbiAtc6HAtwpUp5Zoz6afaBlAVSmkRwe8emQujhBJfQxpGtq2?=
 =?us-ascii?Q?PWYzxaRKrshB/fbqpsgJp65VtejbS6WTVieU/Gc2tdRTbNpFc7tHtGUPZbHq?=
 =?us-ascii?Q?BH8NGTPgjl+0U04Hp4mIc/TOknJBrZ1kVWqh0G29Xir+U2B8e5gkb132HMyl?=
 =?us-ascii?Q?gLI0nVMgJ9whAdhq0giBYyZKp1bv06B5Xbxr9tobzdc4BGws3cSmOaZQl6hK?=
 =?us-ascii?Q?beQneSfrFgyfz6DQq4weWGxL5hDuNW9Vo/Z/L3qt26eWoUZymSVE26+DkjqA?=
 =?us-ascii?Q?CAXRTrWPmw9Gb1n90JM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc1eb46-6452-4174-e470-08d99e1b87a5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:12:12.8151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24R3dsD0KsqWXS9J7JiiVEHihIudtfFqB+4DQDDQmIpBVl8eeOlhP4a4wk2oWo0l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5286
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 08:05:46AM +0100, Christoph Hellwig wrote:
> Just open code the calls to the VFIO APIs.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
>  drivers/gpu/drm/i915/gvt/dmabuf.c    | 12 ++++++-----
>  drivers/gpu/drm/i915/gvt/hypercall.h |  2 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 22 --------------------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 30 ----------------------------
>  4 files changed, 7 insertions(+), 59 deletions(-)

I suspect the use of get/put here is very questionable

It only prevents the vfio_device from becoming unregistered, but the
main thing a mdev should care about is if it is still beween
opne_device() / close_device() - ie the FD is open, there is a SW
IOMMU available, and memory pins can be made.

Still, not for this patch

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
