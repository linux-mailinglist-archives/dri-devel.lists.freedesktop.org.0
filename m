Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5FE36B8FC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 20:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482976E157;
	Mon, 26 Apr 2021 18:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEC989CDF;
 Mon, 26 Apr 2021 18:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9gjogxHI8/sE5cutrq41fjqgN/GvozWAj/HRyQWkz7Oun5jAG1C6rB67Ot+fZfnEdH9G3B2QQoYjJupGmBb5xoSW2ga/lUfWhXrhOY7tu8qwDAeRAHt/UbLwfnI5ZjE9AjaypF+bzCz8Gumhc3SWraN7ZvKmtuhptSzaxE4hA0Fk3wVwrq5wKYuFEecnBlRx90/fHi7sDz0yjTmEfpGR7CD+Mpi6RkY1nFZMB4WUxlUChP6BnNT6HjMDFhaulQkS2syvB2YG7gyXvlbeYkgcQz2eerW1mb513ZIC5lT/01aDPYDqfltU4K9cAJe3blJwwRnVfGBuI1ljYbb6Y4VFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUdY7wsveP90wwdl3/Gv4B/OmIMBzc1i+O5/HfspH+U=;
 b=BZjvl1PDz25V7Y4oUu/4HqjHhSsu2tV0k99gxuIwxfX19cUE2BOrQC5FyGMqlSBTEb8B13STck1M41bdemXarZz7Al6IsKOrQ/lDi9LOZpns3Ggtpp9yAdAdL2pCLwm5nGhfJ15+U63qxJ51p7PyuQPl7oJO1ekBGRRgJTZvUU+tBm/7p1lVyFlRIDAglAIpnPtSb4NziiZjkD4c6Cn2RFgffSE9jCr2YJawBjIL/YUkawUkjYqZbu2vgG6r8/gaxOmKtxDOGSUtyUWmDJBuoQY8pK1A03hkRfKHLY4TehZF3qnL6jv7XKV7Ko6IZRKF3p8nMWo21T6srZOqWF38Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUdY7wsveP90wwdl3/Gv4B/OmIMBzc1i+O5/HfspH+U=;
 b=q3Njayb71U9PtjlR9Cjmml4DMgbZHzKYSIh0kPEfISja700SPSStk0XgGeyzqKvL1B6JqrFaaNu7v+83ePLbp+Wyc1EA/wfBWuuvXbbn0PKZebCG5o2vZheb9XmX8BOAH60d8Wh65/XGUecgvBCBaUJG8IwPJnUw8lSe4p3EgOttjdUUIgsgFdFsaOZxKPDSyYbUe/39baZnanePuAAogx7u+4+1MTfn9p+5X9keTthva9iCD8dGc4ZRzpTMaxj8O6LrtCfcCcdibYaSb1nYW3d4u6sgWi2nViGvFGtl+Lk9Z+H/vxzU6Cmr7ewGYA2Pq4VnZ8IS0m3D7SYr/f0Wng==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2938.namprd12.prod.outlook.com (2603:10b6:5:18a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 18:33:12 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 18:33:11 +0000
Date: Mon, 26 Apr 2021 15:33:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/12] vfio/mdev: Remove mdev_parent_ops
Message-ID: <20210426183309.GZ1370958@nvidia.com>
References: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <10-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <20210426141911.GH15209@lst.de>
Content-Disposition: inline
In-Reply-To: <20210426141911.GH15209@lst.de>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:208:2be::9) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0184.namprd13.prod.outlook.com (2603:10b6:208:2be::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.16 via Frontend Transport; Mon, 26 Apr 2021 18:33:11 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lb62f-00DAKp-Tb; Mon, 26 Apr 2021 15:33:09 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7224c7-21fb-4825-343e-08d908e1bf05
X-MS-TrafficTypeDiagnostic: DM6PR12MB2938:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2938F50D85659760862C8A86C2429@DM6PR12MB2938.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pI5tMz07zGKnaG3o6aj5if1tgGtp72+yqVS+UWTBcvEuOA0gGl5Jynm9MZvgl7mMIQLZyB6DscntMLTxJPq0zbpz0BLbspA4Fbupklw78gGFVgyTBzQY9tWmySPh4niMVjUFpgOeBas718ELPbFJFiXNpGVXgenXOxkIjmLu6Q4cmyB+a55DyQWoXyK78EUh+RePH2aMUy2hTU8ECLuCEuKe9UHYMJnqUWc8EEqAuNKcimXgDIv7G+PmG5SWZk7ULiNaRfHdw8OF6YllIpOM1JPMXQhVYwZIOtN/tThXs5kmU9hRqdGlx8G/MeH5pQeWUw3LkKgwpL6rkH5/BQVFAogXrd6y4GbQBXHqUjGF1Q6kbqIm4oP6tfficUVTcsdbA66L3dry6f0AefH5ntvvSlDf1shR1N+HOPuIjTxNCg+hvlC/le3e3SU9lWcbIZQNtG/a3+hNHAlaHkRHUGe5uEJzbPqc0EA5/AErDewEjcwzqN4Bl3/7jj0JkX+Z8aYTkF4EJ1Yv9p2lQ/jXfdfdK5Xyk3CDrUIMED1vt9m8gDM+8fIJZMdekROlFcIcdhSsYHro0gBjWYkOi2UHvwOgbuv8En7uJj4Pl3DCB7zYp8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(9746002)(38100700002)(86362001)(36756003)(8936002)(4326008)(33656002)(66556008)(66946007)(66476007)(9786002)(478600001)(8676002)(6916009)(7416002)(316002)(107886003)(5660300002)(186003)(2616005)(26005)(1076003)(4744005)(426003)(2906002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JFs7CquhCCbhsQZiiePOuj6lwEwPW4gHFm+q5FVFjM/FwCsfNvwJFfyFdAJW?=
 =?us-ascii?Q?JFHgOIJBG4E0wjV1wSxbQ9pDEaAAscVuQ2UN1DtqSXK8pwwRjOn4+fV6vwFa?=
 =?us-ascii?Q?d+vKpoMH+aInaSyU7y+hiqmn8YCIk4FzZTI9J1aiyAT8S+nRLyOVDvkNyv0E?=
 =?us-ascii?Q?q0Rn0fTo/Ctxfe6jToUKgJgG/Lk8Ern07qWkfZJqRgBVt30927zY4ktvA9mb?=
 =?us-ascii?Q?Mh9dMog51+E8K8zfI7Mj6RMODhOkpudDHBmiPuXIhlRKtG5F9G0oVkFOGk+8?=
 =?us-ascii?Q?T+wiWxbhJAF+Y0iXX8Fusz6Yyu/Vtb/ULTCln012rJwkSsela5CDTz6DaTAO?=
 =?us-ascii?Q?XfQgEHXlVEPiDbpsq0/5b1IGsQ4bkhQM1YQNgwZNyQBF5R6kK9IxeJ9N69mS?=
 =?us-ascii?Q?msp1DVenWtKt3jW89mWZNbAZRRQNorvcprRAmyfB03Z/RE/tyDIXNm7G6I8U?=
 =?us-ascii?Q?XxAWr0+yFYxQ8MWaB+MBJNGImikf3sY1DxeS4unDj6soGN/0siHTd7KeTPrx?=
 =?us-ascii?Q?/6rF9bL8IvQ3EVmeNY+ocb1um6N/IR7ZFHp4ZXaE+d141xUSBYRF7sfNtHhd?=
 =?us-ascii?Q?GtP8ga+ZVkC9ineIvXqEzcMeXAGa2cK94NBpAXPZLiqi2qDndFa+Ajp4PMll?=
 =?us-ascii?Q?cS0ECq14A3yx4XIKiBatf+KHGULE9jNDiJpL3Z2Mjsdb/JIu1WriCYuPFI5k?=
 =?us-ascii?Q?D6uUBNN0ixZrHfswkYNWAMn7IEioLB9q6iEPI+I8+ccR4sU5MCE9GcJM47Lc?=
 =?us-ascii?Q?cW0lVrwVumTCahux+V4cUPSgJ6E1l2oxSCfvUtXlRZhTM+SsW1hhXdPVmWer?=
 =?us-ascii?Q?T1HafQHD7lPZKhbqaW+7wJIo6M13GGX66lPJGOSRAqBCnizdHtsb5nDZxa0r?=
 =?us-ascii?Q?zmkz8DgOhG8Jwjc5fMyJtcSA4ZpEK6xCFk5eRnGNpt3h6pu+/SS0U0hCCXL2?=
 =?us-ascii?Q?KTA9vCtt3Tm/EGvH3JyAS9qJNu/s0Pe8lsoMilbBUZZqcGH5I65HDYgErpef?=
 =?us-ascii?Q?lp3mOGjo2QYYTDhTOEgq9e5tUeeWSKCvwI47antljTwmdeDoVr/O/QJZVpQc?=
 =?us-ascii?Q?fRTtBciBeHWVgd98/t+lb3/M+eU6RcozHFLrdTgwwwv0wp50Edc4lxgqswzR?=
 =?us-ascii?Q?IchyioItpNQwmnVaPbgd7qliX0pteS2+un1vnkS15bqRVvOprugGkt0ih8sr?=
 =?us-ascii?Q?/T0lRNpoXZx1qRKYy05jyRLIbK9btIHvKlWz5T+YR0S270O2Zt1U82KbqM5s?=
 =?us-ascii?Q?z3qTJD6cMk9BlaCnCN9VydZCw+qtp/aQrv2v0Q7c72ugaMZ92BNGqu2oqUuZ?=
 =?us-ascii?Q?mWkeJsXMKTO96ySqnWzUNkck?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7224c7-21fb-4825-343e-08d908e1bf05
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 18:33:11.8417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDO/5JRh9WEp+ZU+CQyCYt6zAOCtVhx88Xx8hFMR2Tf5rPPGYmhiBTJSQ1W9hx76
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2938
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, linux-s390@vger.kernel.org, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 04:19:11PM +0200, Christoph Hellwig wrote:
> > +The mediated bus driver's probe function should create a vfio_device on top of
> > +the mdev_device and connect it to an appropriate implementation of vfio_device_ops.
> 
> Overly long line.
> 
> > +This will provide the 'mdev_supported_types/XX/create' files which can then be used
> > +to trigger the creation of a mdev_device. The created mdev_device will be attached
> 
> Two more.

Got it, thanks

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
