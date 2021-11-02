Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F42443284
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F92D73175;
	Tue,  2 Nov 2021 16:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9AB6E990;
 Tue,  2 Nov 2021 16:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kyxc/+IMG6qeRbZOXjNVGJJJ9Rs5rZJF1GX8nOdMGBoBYvkdij2XBkXWnEaYOs/3eeUKt3BhsFErWiv11La9uS/KnsQ3HG+bYlq62PKKuCiRrW3JJSW2AFjMjmSsCq2HTgYYY9Fs+ZTQ3LNbvM9O2ZNFZKmBxYgiL+ftdyP8U5iM+KYBpRxDXIRXuE9cKFUfxy//NiiI4LgbNHLRCOIYIP86SXeCm8bC4oF2x+H/zqnWz+2vbW1e1uFETAkVEmlik9pdDcPnarKFGRxqDn2uTUDkeepgDPkUw5zhIQFMhKc7nFfVtp6iwgKjVJzx6fFFqb4cl/X4jckEk5QqRdm/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eg1oW+2DfvsGKdTOf6hsSHFOqDjMjhE2MEwoOP9QZ5A=;
 b=AvL7HlpKw4TKldYowTj4XMMCEQow7NY0Xpskro63Yt+UYlXCWpl+29WXjXYlxclec24wXzBGmYzP2d8+dmm8p0TYem4KGE1RTpo3pDR+QCW5lYVn3TXQzvzu84kwBtIK7A3DN1w6X3lEPvS6anJh1Tflvu/+2CERXMr+4w8fcq1E8hJco5JOFWlE53KkiKg8BLB6pFuXcSGmlnI0a5qeLKW/webB39nu7AY0tAPvUQajkNoxxkVGuuljHlNx5rymWVM22O14lzXjX60NMYHIxsrNbAGaoe/mqvDnwRMueaVXyaY2j5hCmh+3I/yP9SwxdvmBrBYT6ZvNqF9coplNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eg1oW+2DfvsGKdTOf6hsSHFOqDjMjhE2MEwoOP9QZ5A=;
 b=QK2LojhuraFjJgbmDOPld1sCGPXwNktASchzNYheLWoX6+hP7VopdodKQBNzn1beLEvwYuGROIjl8CifZx8jArZ8mzqedqje4/XFYhC9mo+f7uQIaEdJOTv7WFBzAMLzZlxWAhwcUwsBxI+c1I3VfhoTPKhL9qMswZGBnVY4FfinOLR3thlHA3g92tBVIVt1rgRGNzOs9/s+ekLxMRIz1YBlZrzGJ1q3igEEOAgnZNiE6aQRcu9KNQGbdgmRmHG5Fz+hNbMvX7HEOiiyxiqHv1Qy+2S01khjrLACR115uD1oFhzwe5Ta88pLksdOvSYhDiT0W/aODR5EdA6gPSWBOw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5208.namprd12.prod.outlook.com (2603:10b6:208:311::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 16:15:33 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:15:33 +0000
Date: Tue, 2 Nov 2021 13:15:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/29] drm/i915/gvt: devirtualize
 ->{enable,disable}_page_track
Message-ID: <20211102161532.GZ2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-21-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-21-hch@lst.de>
X-ClientProxiedBy: MN2PR11CA0028.namprd11.prod.outlook.com
 (2603:10b6:208:23b::33) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR11CA0028.namprd11.prod.outlook.com (2603:10b6:208:23b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 16:15:33 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwRg-005AWY-Ew; Tue, 02 Nov 2021 13:15:32 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bba03eb2-bc09-4190-5160-08d99e1bff49
X-MS-TrafficTypeDiagnostic: BL1PR12MB5208:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5208310C430B9AA16A3D2CF2C28B9@BL1PR12MB5208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QKzUR77RAaiePvvoSitU6yo0lxkRvxcvQ38S/z0jxtG+kL02nPxJmNQObV8FKMtRQNVV1RhuDkeFjXOwPQbSMCVgeJJZM21NGbmuSklrmADoTZ8OGa5Wt/jJ+KtI3mhbxsaRuwzkgpsAysqkpZtqv/kixv8T/ZTDdGgirqDcqqgJvXxZFvdbXX6ZtE3QcmWu3lF9omtrFDsTrtRse32R+NPWfCoTePBQFY8yN/tVeiJpv5ZYXFr1XEaT2eUZPgMwJbwXpuCY0ho5HLUNmxqhqAzFAh7lKOAqg6TYi93aqAglZEIUQ2MSgYqW4NtxJow+3mL3IaDqKaFgAc3ULtkb10Cmi6JTHdZk7EZpWJCxcjyK6cCB1oS4GMDf3311RmXnE46g9CwVxgeci3SM8UmTv35BH18T3uLzHN/MV3m2DN8pcpYJ9oPA02ovRBCpdC7UOFQGPmpLWxgpr5YCqiJhRImnVp4L7/HGfrNqrGy8CEB+Cb3buGiVnvggyz4pr9k3V+fid7z3amlPJeobYrE19LGt7/3dgCGDLevT7Z9TCbiO/Dcg0j5ip7X1yFtPoluUDFENp0l+zZxFfVJfSrOCrrE/SXZdV/38C0f4idJkf7OfysDsqEGRgbXgQEkYVsNYwDTC57lWSJGm8spsHJ2kHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6916009)(83380400001)(5660300002)(54906003)(8936002)(66556008)(66476007)(4326008)(508600001)(36756003)(2616005)(7416002)(4744005)(2906002)(316002)(8676002)(1076003)(426003)(66946007)(26005)(38100700002)(9746002)(9786002)(86362001)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s3HUXmSA68fcWy9OujwWt7XqFK8aYXRtnDDJC6Bs5vMJPaT6vFef3vVvM+PL?=
 =?us-ascii?Q?xly1xQPZDRI4D9Ffln8W+txAbyK91XFmVpPTWO4ZfRPo4hMyx3dmK0HB+qSG?=
 =?us-ascii?Q?E59hEtLjACqqfhJFacXd8zKcH08mXdc7HuSN6ROhVtxs0jQF3/Is+7C5CSWx?=
 =?us-ascii?Q?HWILO27SqO6FJQUPmGF2b8RH1TDJvsXeBEmHRIpIvVWZMwarohquvwU3XA9e?=
 =?us-ascii?Q?p+0D1/fn+R3atUs7whFolE2xTaK2Qa7C7zQZBk2cts353pC+KblvRPH7+RNn?=
 =?us-ascii?Q?Jy3NBXzhmdA83q3g2m6jcsSWnfe96/J1zB/VZYL6xNntZytEzMMgNn3a4f2r?=
 =?us-ascii?Q?ReGf9StQglQXdNFiqtQznxol8H+RFWzuFf/5uarH7rjyRpEVbL/Dlgqf2jap?=
 =?us-ascii?Q?HoHrhcGH9kOFR3fsZMaXfdOQcMdsGfsF/WrgOzos7erYTy851K8lPHPZ+76m?=
 =?us-ascii?Q?j+h8fm7E4vv0qkSV90WtSVHn7So/W5Mlmdzc71tm61jZrndLvb+XSWDzAMGx?=
 =?us-ascii?Q?GJ9pLxk8GKXOyaOqGYCeSrPxDUqYoHmB/DDtMeH749ikHaMSI+yuFomDfDJC?=
 =?us-ascii?Q?JYFQgvJ1YLpEVI7zZM/puSeBTa1HDB7svydUYU7xM5YsAuqkRvje7gh2uwGO?=
 =?us-ascii?Q?H/KPRtVK4LaXFvdCJZazFKPJnUoncuMKgW6vemY+k+iC+KXWB6hjPExql70/?=
 =?us-ascii?Q?ldrRJwXXq6sXet0zIedrf/WrYX+ppD/FP/wXMnwZd3/O9DQ55ygWjNn/BPx8?=
 =?us-ascii?Q?KXEKnxRxUzxNW1ljsQIX0ZAAVPyNFEUadJy9Hdt6MLzRchiVwDu+6XNAlkt1?=
 =?us-ascii?Q?F595uJ8EB7Dn6eUK4kbhkeAqR79GK4apWeMTYRAeeqggWfg2X1kLeH9bTXN0?=
 =?us-ascii?Q?6IRZrl4zWaXffdV4sxR/UMIAfjyY16QGwCLKj6FjSwS86HNSw48SW9Nw7VFM?=
 =?us-ascii?Q?WS0V/r1OAPa95NMaEvEx1Xr+TtvsH9cLjA2S3NcMeZ0CT1yRXuipf9mxDWfv?=
 =?us-ascii?Q?L9i+dxsoO3BerbbuSWUDcSDV8l5Sswlk3iP9xUT8c5rJJy8H9J0O/o1x+FMX?=
 =?us-ascii?Q?fdZ2K3DQFvWTB/spGg4nSiA7aQOZMYb8B7HH65EF3oGrhRiqKxyG7gc2wfOX?=
 =?us-ascii?Q?x7nZ6f2WZ9PCfeG7Ys7skay1PgLCs+upH1Tj1fPMh0/5E6Vr717FcgSc3ac3?=
 =?us-ascii?Q?MgMBLNaPCbJ3bhCquwJwNDXIDucPGvCb1R6krf5hP0FzqrE1hIB7rgXByT9p?=
 =?us-ascii?Q?8lvN/mIZSOygnjnM7rTCSA9MgsvNWFm4gaGDCbVjK84liEeJ1/0/lnycGe8S?=
 =?us-ascii?Q?wXDJMSW2OuUduWx+T8IMzDmMPnpF7NexG810HFADqssRidmM7vegCV4F/U3A?=
 =?us-ascii?Q?fQaNZj2SDXN9CncUycXVMKLLjlWcaRsgpJTp2jdHnEZeMJISK4NYHe7jzK01?=
 =?us-ascii?Q?5WlTnmqFFuC30j9bHjqA8XnwJNQWegZUeM/yVVlVrdCGj1HUdRrSXlyjOZiX?=
 =?us-ascii?Q?D4SfjpNb9FXJeFVfDUojYcbQjwA+UkSR/+FE4RPiaLCnzOUV7GQ63vgHOBeH?=
 =?us-ascii?Q?v6vpVtYkm71XniWDM+Q=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba03eb2-bc09-4190-5160-08d99e1bff49
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:15:33.5340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPuIQWt10gNclfwnmO7poaj9S06xYb+4tLKUIutxRWJsbp4FsjIkLp4F+8IgkBMH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5208
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

On Tue, Nov 02, 2021 at 08:05:52AM +0100, Christoph Hellwig wrote:
> Just call the kvmgt functions directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h        |  3 +++
>  drivers/gpu/drm/i915/gvt/hypercall.h  |  2 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c      |  6 ++----
>  drivers/gpu/drm/i915/gvt/mpt.h        | 28 ---------------------------
>  drivers/gpu/drm/i915/gvt/page_track.c |  8 ++++----
>  5 files changed, 9 insertions(+), 38 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
