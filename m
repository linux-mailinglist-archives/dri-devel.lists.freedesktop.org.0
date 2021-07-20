Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A453CFF3D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 18:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70176E2D7;
	Tue, 20 Jul 2021 16:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A796E408;
 Tue, 20 Jul 2021 16:25:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWvNZdraR7WU+d5394CpDCi0aHMxf1VqzSOD5jmUueChURr78S+nOaBBQSQrLNdtWztWnlIyetQOgF6Qwj6AOxGw1Qfbb3a+6wX50f3P9cDplnc/wslbhBaduna08sTvTokv+W1dOPZuQHf+1bldgAEzmed4lC4eW3xrNyhLeIGIt+v4+CV8TXYsFL4QEFoejVcxjgc3ybUplo4O7YWTg0C9HZgAXJmF+cAxSJSoVxIaKwTl6zyctZzwdvbShMEU05KpTiTlO+G1hR1WYgi+xmJ69vlAg92qCIJgXE9VR73y3Z4D+xDm/hOYutYo7dpxejKaCzWMtrstUVfgUTrNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXhr7NBtAh2g1mdiedm7a00Qpu1WBxx3T+l9CwzOyVc=;
 b=lROAeYD5Ip17BIC8WgcoTx6XXkktk3MFSVciF6tpWbYIRVx8jzUtS78DGY1u+QuZZ9hYodsek5XucFglfVeV43WB9qpJgyR9+322TLcoQmRLe54c6jVVd0oQxWbzvyNEawk5L3RXXwh8dswCDPEGgiyqowC3IK61qt9GaMEqQ+9qCKyu13rrKVdRH+wT0sgeTtXpQN1KvFrE+K7I4yLEqmFBhxEYFUlU+AhIU0dxCRGXL0hcTVw8vhp1rTXJWSTFy/ZUhPflMiR8DPUdKATJgZpUo8eSogvSVuS7EI2nDRINVF1kdAVJoWFcGjsyknhNICb+PutOgpH3hBLQvJ4kVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXhr7NBtAh2g1mdiedm7a00Qpu1WBxx3T+l9CwzOyVc=;
 b=guFPICwIMBUQ+bEfPicT/GzHw+ii4l/AAlwvi/OFAYhYuCcP2TD9Hj+DY3rNPpO6rvMixYw5Byo0/X4iHbd906wNLwmf+mjBUuwpEt9DaHo+uN4uQUwEOap5Tn0MrR6vgjbEqhYZGd5bvNyeAtsaLee/JZMSFY17XdKwZjRsVvs6aD2WiSDv7CXTncqZQx2bIuGuHffNAMoxhn7nruPxio6qLrWM7cx3OWRdYJ6EZ8sDFpZLVukkWZ/PG+B9YaJSBSRRySBWGWe/9E96yml8dULG9gSoJT8i+XS+35Wm98zE4yWWny2tVuVeNPtZdD0STqNBVrpLh/60MQFpUtI7pw==
Authentication-Results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 16:25:09 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 16:25:09 +0000
Date: Tue, 20 Jul 2021 13:25:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Subject: Re: [PATCH 05/13] vfio/fsl: Move to the device set infrastructure
Message-ID: <20210720162507.GC1117491@nvidia.com>
References: <5-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <44639398-d50f-ac6a-d52b-4e964465ca6f@oss.nxp.com>
 <20210720161713.GB1117491@nvidia.com>
 <5181d7f9-0a4f-c594-c5e9-820bdf97f6f2@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5181d7f9-0a4f-c594-c5e9-820bdf97f6f2@oss.nxp.com>
X-ClientProxiedBy: BL1PR13CA0368.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::13) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0368.namprd13.prod.outlook.com (2603:10b6:208:2c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.11 via Frontend
 Transport; Tue, 20 Jul 2021 16:25:09 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5sYN-004z4U-Vr; Tue, 20 Jul 2021 13:25:08 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5b23f0a-22a7-4b7c-f0e4-08d94b9af100
X-MS-TrafficTypeDiagnostic: BL1PR12MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB503260152401C8A62F71F4A8C2E29@BL1PR12MB5032.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDIbS/xyqPxpEW23U+JZTvpVnNKBILzbuTBgH387MIDXQZ9dY6PgU0wjUi91BV1z7uDojIJlMO4LZB636x1WU45PGR+fCkesA6Xjcg1xFZilrpZpnrn+IybEgGcLYi2/pHSGKBm9644k66vjWReTvefFrb0fLZqfI2uFSfd0etDgE/7UnoP94hrLnRa1aXn6zAQZwW59xgYNbv0tqTGf7GC/LA9x2h4zWVJ0TWCtOOlZrATTqYCHszS30hZJpTg5bPR+pHuQqdiYRcsVcIW3jH0MyPkcouoQW1dKpZq3G57M+o4IPk0/gSBpGxOH5FKi3nUgKUO9b645vTv5v55Z7qkf44MMHdKnQFfAQpTW8IZXiz1MbHxfsTV6R1NzOHVIoI5Co1r1na2B0SRVnVn0iVEQNucz5jd5itfO3WaPMFcOur5bEFDdfHiGYUfRmv+gbepdwz5jGYyUxchlmSR/QeQxvVEoe1zfV0ZcuRdFa5/K8ls8mz4b5O0eOUX44HZvYFjeMVdtn0/hYsWQrPWUpYR8RRM8bxvAFIRGR3IWu/EWmn9cOEH67fj8NNhWoNredRRBCjv7x7LVSf/NOhGYvwUFb6TiaRzDcExU9IGbsQT6jpri8J82uz9RxLxGhv8PdGLrXQKvrzP24hPuqZCm5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(8676002)(5660300002)(36756003)(33656002)(38100700002)(8936002)(426003)(2616005)(66946007)(26005)(9746002)(86362001)(2906002)(6916009)(107886003)(558084003)(66556008)(66476007)(9786002)(54906003)(1076003)(186003)(4326008)(478600001)(7416002)(7406005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wde9/8ozJXweuptQVF+V//lJxYFKqGMYXaUJl+YrSWEFx2je/8GZehwPN5ge?=
 =?us-ascii?Q?+mw7r/suLrUae66qbhDF63JZ1poBQQcNjE5QQZy9tYmnV6hoZMgR+U1voU6x?=
 =?us-ascii?Q?nkOlHwlYCchfUb6KOXvI65hJH8mQmayDnnw9jMdkfTpSnjDY3n7se+CnWb8f?=
 =?us-ascii?Q?0uLDcyFuVqCeA0sH61LCfCKSsnmetoygLOvmK0knzycfMIFdWmP9S9tfaCPx?=
 =?us-ascii?Q?2VN7T63mc13Zpb23c4C+7xDXHpk68kU/6qGM8Mrjp9tRbU2pLobo2GdDJ3wH?=
 =?us-ascii?Q?vysR1KWWn9W9kdD59IrrHvuFtgGWAnZtF0KLxZmQYFUUOlmqo53qjxby/CPX?=
 =?us-ascii?Q?v5/9RWQaVwed98Qr6eW3VKeg+wxg2NfFoel45IK0fqTeoTPEoS0vprIZJ95/?=
 =?us-ascii?Q?Ed2NzTR10O57AQPfesoy9kketjrpDFqCVmiPu5RkvlAgyu6/jOza0iwq1dwk?=
 =?us-ascii?Q?eHdthldYdA8/pmxLiW9RZJj5XQ2mYDkvubxBryE3ItHLdO3dm6zLFUNJECEY?=
 =?us-ascii?Q?O0f7NSbnK0bE43nVR8WNghSBrk9Uj+Mjx7JxBr1ce/HGdX0UR4JVphvJHaaz?=
 =?us-ascii?Q?sGU7sRTWPHC6wJ9LY8EFspOtnJnY9wTYxoXc3s3ZgkTOVAYYmpVbQCg8MNQP?=
 =?us-ascii?Q?jZuuP26nZXV3l4xiqDNoQCq+tSKXNOs67Oi2HAXyLT7RsPKTUGTidmZ6yaz2?=
 =?us-ascii?Q?NEicZ/YFwlefQdDFVIFvivOQhd9YyxpVKGvnk4KYb5pJ/oh4voJ1EqLKCRIk?=
 =?us-ascii?Q?zBdRIPnfGN5CXG8jZwVhGrZajuIUjVLRD5c4qKkRD43PPBKKH4gMszaaIwSC?=
 =?us-ascii?Q?WiVbpVdIY+ZkfqYZTiH1ZbdvR1nVVQsQLlZRHC/7k9DMTA+2RnTpQKKSIxgL?=
 =?us-ascii?Q?JktLPalP2Qeu/a+KjbW4rGr6tfVlzb81/Slo2Hv4I/P00Z8IGpqSNKY9QTTu?=
 =?us-ascii?Q?Msqb+VLoszk4p5wsE5ImklB3t36bMaLqcV0SLNL64MBz71ja8CkWKjpJUint?=
 =?us-ascii?Q?m2JQIXOHRW1JLqrU8qXSLds0tDLnJ5GkAhrmAJlVenclSKvuJdAisYznTnmD?=
 =?us-ascii?Q?GjQG7nlxmb+ds/ioYVRPJCSDZfVUTQcPciqt+zgxIwVrZejoCsL1LxCQqIIX?=
 =?us-ascii?Q?wkWITJ8LmSMDUQN7BUuDZMTB7AiRjxwpaxsWGu29svXRluoTxBDui7/ehncF?=
 =?us-ascii?Q?OSpYsZvJtghI2KGMe+2w+oExIwMY7DekPf++sLl5s6XDL6ZtDs7rqv1kDlHq?=
 =?us-ascii?Q?qYePcABufU7synqjMZ8PIaEIj5macbL//Hhf50/WECfX3MYsk1PHxMxUrNrG?=
 =?us-ascii?Q?1hBa0DHtQGQqp4E5/oi4gKU4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b23f0a-22a7-4b7c-f0e4-08d94b9af100
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:25:09.2482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXliKp6dUsJ/NZsxaIYirzdXmQmwhJZA1kWJrgpjuNcZta5Btld/v07RFWsyr6Qw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5032
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
 Kirti Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 07:23:35PM +0300, Diana Craciun OSS wrote:
> I have tested the changes and everything works as expected.

Great, thanks, I added a Tested-by for you

Jason
