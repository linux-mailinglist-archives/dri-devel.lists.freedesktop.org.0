Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FB94FC24A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A09B10E987;
	Mon, 11 Apr 2022 16:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2055.outbound.protection.outlook.com [40.107.96.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9765210E987;
 Mon, 11 Apr 2022 16:27:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8vwzFM3IS/H+hw6bL7lbJlML5oRqX6nd7suVweYs5hkSYZ0Qhmh0XJENMAQEFwVwI87j5IzJmECsbdru91SCcLrSUqAisCNpobHQJAc/ztgCRSIevumkn0ju1EgfAFq+xRnSwhcQcsRc9BJrWUcoTBf8d0L2Aq2ZYqJtzIbOPAosZCRppqz3tQvFJi6DCMWEXVXleGAjdLba03p0M1RWbuDOTlZpFs+46q7WE4db7t34l4O/u8deWxje31RERUDJKUNuvYCjQhNnVQcp8MTNt+ycGxpKfAI94ZQhge5mA2lvpe50N1PCDrwMLT3ngl5/D3FrvEQyxLbWeOdC6op5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAdwS1+bQQrcRPVOC81cfwxqjhdixpIdPPU9oSrnmA0=;
 b=b6HNaKpIlCKCaJieWZfj7BJF8AndgNO09GIsqHQL2znNSZD4lV8f8CTVP3B8p0RpriKKSjbPuJzi5LKfhpdz65/LF3EJebqA4xjQHTc3F1/HV+Vo63rE6OY/aEfZbkii5MAernp5s6f8TQe1XEtf59uG6njutZVlYAKJNmJvFd8Ote7NYEPC+QOSnspBpPilLDBO89A8uEQ596ahWhenYDdDVSGSxaqg5J/whl5QvcRbQ5hri+/SED1W7k/UAh/fvHtssXvNBs0hAG7Lj3wX1dNSwQ24YkZicaY7geChpU7SdtJlzPniIzb/I9DNH1XRUnQYjm+RLwkLIl4l7/jRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAdwS1+bQQrcRPVOC81cfwxqjhdixpIdPPU9oSrnmA0=;
 b=ZbeOAehQwI384rHWPVwBJv81DepzFPl5Gm2LD6fnJg7OQCH+9Pg1fPlN1yPuCGtnQQMDkUsLvBfAtVjH81ORDPATzSxIkp8ONyX6u619V2juwtatx1OEOR8iCQn2Y3hbxVmIG4kSssUSWPTCK4CEnCqgq7PFMbeDc6bRbLYryeR9FV4EIbJ5hbmeb3gjySQt0xkSuAAxcnVrA8CnWoZ7q7jwfPPoWlX6liXNiHYd6ChoyzMEXeMhHxNG7lj3hGTGV1nuevxxiNYA0chmf/y3PBIF542rbywqWEbSGx5KfdRgEH1ToJ/Cv3XX3mDx3ZcuwxtSmjW+xKlK37VbvGGCtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN0PR12MB5906.namprd12.prod.outlook.com (2603:10b6:208:37a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:27:50 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:27:50 +0000
Date: Mon, 11 Apr 2022 13:27:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 16/34] drm/i915/gvt: devirtualize ->detach_vgpu
Message-ID: <20220411162749.GR2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-17-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-17-hch@lst.de>
X-ClientProxiedBy: BLAP220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::16) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 477faa4e-2127-4610-88fe-08da1bd838e0
X-MS-TrafficTypeDiagnostic: MN0PR12MB5906:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB5906ADDCEDB6257177367973C2EA9@MN0PR12MB5906.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMxmDWWkP6MWoRsrOXJozjj0xlBpSoSoYAs3iQDVeCBi6JAWSKbF5W+Xnco34nknzCTQB6oW2xfTXrk9wGLmZ2gR71lEHDfHAz2gHHRuNkAJhsQdGWoE6/vBw674EOaA4nziPfHK8+T/ZS7uasyWitv3pHTfYGgkZToK4cuh5XCm5pOBd0OZqt5pnnXSQk5oMx1r9BoGgIYPVoEcl7dddZCF4AIQEWNQgrQGPno14GqAbkgxYatBNVwabqrqeK2WKz98t1001EFJo1CuNVj7lv+J6RA+6IwYU1j9pFWjedi9RfxmieJLWQZr2SkazAp9ZGKRkt0aZkl3G+CvKmre0MwCpjgQT1nW54C3QsM8bU5PKmwYWbhI7DSBrmeJZgjPyPhAdcSyddioYF8yPQ41nAGBGvMRc8chb8wl8usKGxwdTQxqZzDpxanqlMoiorWnFhgX9YbsOWWKgLjcMiKowTHXpuAaCpeXUFjFIC8lTEQdrgze4zpS2lgkypHr+uRA2YIvguA8mhxTlWAz35DYzBuVCspuz/zuSfDe45dfwKedBWDhaDVta+20h/EEBNZbpb4rVOZf+UoJm7RXDz1C/TI6gt/+18Wjiawgbvl/mFueI+cHJlE3AMe0RPZJs6DQFZM1l6/OtJZsHE2S3er8KA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(4326008)(66946007)(54906003)(6916009)(8676002)(316002)(508600001)(6486002)(36756003)(86362001)(33656002)(38100700002)(66556008)(83380400001)(6506007)(7416002)(1076003)(2616005)(2906002)(5660300002)(4744005)(26005)(186003)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bTXXdbTLlsk+p9mYC7JAJzX4emIU/vcVjp0O/HIpHBypbb7+vZuQMNLoy1vh?=
 =?us-ascii?Q?WJTHDVcx5Lf5tAd9qY7v8mfxRKz8YARrG+r1qdnYYL/O2EzidZCLSq4MSe0w?=
 =?us-ascii?Q?K276zUhYqwKWhZmwxdQ2OvmYGrp2jtIoEq4Ot64c5+3nQoGyC+gDHs3Iq3FT?=
 =?us-ascii?Q?M93tS1UQWSyn/CTHFs76cpXPauSv9HVUMbAlQpQrGzzN09qNampIuFcZnHVz?=
 =?us-ascii?Q?vxH54/dl/pCLQblnFxRmeTf223kSSrJrT6owcn08KkR0AOE74axG6g+lH7cq?=
 =?us-ascii?Q?h8caw6F6syOnfburEsTcpzNxhJBKZCaFD8HQzFpW7Wbstd40jV9eI0qgLy77?=
 =?us-ascii?Q?bm22LhN6tvZZC6JnxMHI3dFCrEa9XUG3CkrzcETS+NWcGjk6sIG9np33gjEK?=
 =?us-ascii?Q?QDh8E6nGxWoYHAuebLTb9g+m71ObhomHHcFjleuKyazbmcOQd6Cdp4I/Wp5k?=
 =?us-ascii?Q?IWNEXC1qDgKCQ6X0IqQZt6m8eX1pdiPK39sCZtemLm9P9RQ90D8KAFKtKzLI?=
 =?us-ascii?Q?Xx+FbOVNRILe9E/11WyTO8dVOXINIXPwHcyxww6xlQLIyvgJuMKeaIOBtf2D?=
 =?us-ascii?Q?ZDet1Bapqj3s9CnM1hcUTrT5Tv+MU2p/yTSSpGQ7cjcdmdFNug0U73K4zeda?=
 =?us-ascii?Q?7GqvipNEzCGWDdN+J9YiZN0g/wZ2LfE444rc/Ltt9m+qIDZ7izCoHw9EoMhF?=
 =?us-ascii?Q?gWqnBBaoZIPaUT8eCp6agMFqs8hVV/bA1q8HW8FpVaGz7C2xXf0r3rgOAIf/?=
 =?us-ascii?Q?KYNhPd8vcCoLi3MG1X5j6y1RPCWpPNViKRMg45FzMhvBtrzcgX4048LFvHcJ?=
 =?us-ascii?Q?TSDpgsF36f1kxAjUb0g1neIBwl4S1t1ww5RzwRauE5gV5fPwJC8vffI/L8l0?=
 =?us-ascii?Q?chNnrGLqYKnjSXHBmjqteOGd5enpbpRrMGGKuEV0OsZueq2bCq237wnyTKl9?=
 =?us-ascii?Q?OmcDCWFcP277GnP1oBLZ9YmF9mjLinegW7K4aCIuPCmn98Vmq0bbcFZ4TDsi?=
 =?us-ascii?Q?dlnuXOnSosHXy84QDszlXJmA1vQsE1LM/ogSSuTE5fZqXpXY93VNx7EarfVK?=
 =?us-ascii?Q?ovwBFWoa+iozHiUuLxeau0jU9F3yV8t7MrIJbXc/jOXM03sOwu///XhAy+fK?=
 =?us-ascii?Q?qg34h0IZOsKI0LBk8rfUWA2/Gh4h414w+ObV+LWbs4/72gKIOTdry92xN2iL?=
 =?us-ascii?Q?Lk5409mZz1zn8NasaxvfgAVHwskrQr8JC/WEH6DU+WDFj4A28Lip8ePCE9Ol?=
 =?us-ascii?Q?Jfyjgho3Mw5fDfpPEmR4fVgfeKtlmei7AVrcieC5K7t3DIiTeuqR17q1blbh?=
 =?us-ascii?Q?ieafx+ELNGAq3IDIjEyC5I4pL9HcRfZRD4nT9N8z2IMjeDXvqACaPjA3WwIU?=
 =?us-ascii?Q?ACSQLfO+kTWcW8UbRES2pO4r2Gl94GEk+6EP2F+xVLU/s0DEO7MuoxV8xepM?=
 =?us-ascii?Q?eNGw4MwPg8yJzvsju8r83VQCEaSzZHksWqY9x8gxsZH6F1THXY0GSDLPAiG/?=
 =?us-ascii?Q?zWe+api0uOgFJvSt3bgbPwRx6sXuKQY/4QAX7LL+62fGE6MzrBcefqHbRGk2?=
 =?us-ascii?Q?/iQu8axw59Goq+an8QuLx+7L+5psO8OG7E6xg86sfnjjTq90oVghJuSyjTAL?=
 =?us-ascii?Q?UjHoJsjbxtIhutCmDZazfNJdmZW8ZJoTqF8lOzPPmZ5TMwSG8QL3QBkBRNkP?=
 =?us-ascii?Q?IGBUKCmcNW5v7+F//Z4DDiugqr6J1A2uGx0QFDQMCDS4u5s/M8+9tlJBN0XT?=
 =?us-ascii?Q?kB6DSMSLtw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 477faa4e-2127-4610-88fe-08da1bd838e0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:27:50.8565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3CRJhIKvMMRRRGtMhLbLXMpqj5V97Pc9c/Ny+VmSWaw7jkwfEVDX3x0D6tViYBO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5906
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

On Mon, Apr 11, 2022 at 04:13:45PM +0200, Christoph Hellwig wrote:
> Just call the function directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h       |  1 +
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  3 +--
>  drivers/gpu/drm/i915/gvt/mpt.h       | 16 ----------------
>  drivers/gpu/drm/i915/gvt/vgpu.c      |  2 +-
>  5 files changed, 3 insertions(+), 20 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
