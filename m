Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD144FF80A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 15:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74F410FD04;
	Wed, 13 Apr 2022 13:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665BB10FD04;
 Wed, 13 Apr 2022 13:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEfpxHeDsUIhb6I/oqPYSYSNwb6SQlJmCPYP7CiEAS/SgksEgeo9RyDBEjKpDMxYiOWinFdl8p4tR1ehLbeyJZjPjFsbq9pHTbMn/eqgk5Ee0KsQsZrkkmVtO+bR2kwaX4YmIC+h0QL8DwhPZoQetGOoR62h6DYd7j2SPgbfB953CeSbUBHEFtJUPYR3282WfnFkgO6edtTVPy3uftZrEKn2tlGzrWKbgoI1WLyFA5MH946CP4Jqgn/96iGFA1vEobMYKH4j/aAElnFErcnaU9/iXFrRBmiUoKC7+NK6vknWb3sVz1zIPYx2SaYxfFjsTJvI8wSCPsvtk5JdDCQhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRx4H9opX7UXPtztSb1BIApszX80GbtnjZ1tB41tWgk=;
 b=Mlh1/JbLuncTo+dIoWT47AzvbPRzuSjfYeTHKLEokwBhx4Kz/jWKbFXZbNA9HB0p2l4FT5Yrj00sMSlqQ5NrDcFf2BbYXDYMvT2vZFMNvMAOA82lgLlxuN74mB8mO6orAl6XaPSxU3bQBMtWhtb2wa05xpc4EMHCoUQBGbYfv87rVrxcc1AR456HcxrEPQSUZjUdguHcQ4o6ITToj6+DK8JqR5XUAHFLO73bhhXyd5N2QooDuIU1kLeKOm67Hm+F8vNp6uIZm9yT8WCqhi2mT5K9It0uA+g675ujvA3Zp5qaLH/pwNSooq+oa1LbaDRufM8L3hW4/IJpy1zRKOrmOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRx4H9opX7UXPtztSb1BIApszX80GbtnjZ1tB41tWgk=;
 b=J5ZTR8HnnEHg8tyCyl0rui14lxIESjajsqmL6Y3HsyIF7Qq655xXxEQawZZP/C38xWyA0zQYnsWJ5K7WZdCly1xwUNxWyx4lLED3Nu2Dj5KzwkfNhJJCeBR1ZwDbs3myf0VM37QHZbVe1Z4uNAuxhwmwIxOsc0X4qSDu3F6v6u2D219p0GOmym+j5wfjoUj7dl0szjY0vPIxfHtL2Rz8WV2hnFmhqXSeq1HtSdJPD8YIWYu1lX7ozsEH+hDyzGEKW0+09ZnKMKj0P76JtIE8rE1Pd50230DoAOsktgceH6UQF+9Om5t2sBzlT76rtGinw5z+xIh3QdYP8QvlnDw84Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR12MB1616.namprd12.prod.outlook.com (2603:10b6:301:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 13:43:08 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 13:43:08 +0000
Date: Wed, 13 Apr 2022 10:43:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH 05/34] drm/i915/gvt: cleanup the Makefile
Message-ID: <20220413134307.GC368031@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-6-hch@lst.de>
 <20220411152508.GH2120790@nvidia.com> <87zgkrha7c.fsf@intel.com>
 <20220411165121.GA26801@lst.de> <877d7tgo33.fsf@intel.com>
 <e8cdc103-f683-0b73-70a7-807f6fee0280@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8cdc103-f683-0b73-70a7-807f6fee0280@intel.com>
X-ClientProxiedBy: BL1PR13CA0357.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::32) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a428c69-e2a5-4f7d-65ef-08da1d538b22
X-MS-TrafficTypeDiagnostic: MWHPR12MB1616:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB16164F6B1B31FD078825348BC2EC9@MWHPR12MB1616.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zwDgFcoywlRVTx+oLK9T5IzrAJ2E1ahZhZpe4QeyyEvzjfki2Z2H8lMSo1AXGjpRd5/fHI13NAG6Fewa7abnbvFHky7iAJg49GF9SqBsrP2F5BHf6fjs8O0gInHZssnxsQMITD4b2fLvfrIqzu1ZnNv6dWEjKD2x+H/rDy+/MMdlKgWjZwpduTLHHkcoSoTxu+y/QyqbNM0eXbuRoaNY2jHZT/+Ox6KMMgPMgenKYmO6Z04W4I4had9OmLpbWVgK00g7e1AE58HczdR5a+kGtGxmvvqvVd9/+7arEx8sqdbaAEFkA0/ah6VCHkM1XXAwF4yAXEwYirDaEc5yVPr0QelmMF1EU1La8UtnE+TpFq16j55R/LHgz58+dfvR0psORX+dHnqMxjeL1CJZ06rPtyLplz1vB8QwJmIO8YiJUjfgdSPBKn+54yVzqhMPo5i8U9eLs/26R8r1/KtfAU0Ricy/bVc9Tw9AcZ/XWcFpMwLS/1ZaxUpgZQC5idtYSHYuakyTRj5QsX9Z2sOq8ay8usBX3IoIcOu2FoRjWEqHgWTK20tcNLf04jb82Ou5ClbJtF30BnDh+4YHAGC2cRD22tSuTT2ACyuZ/wMfNI90LqavrR4ElsShcBjCGYXKDL9yz7m8hAHZPzj9bd5n2TOz1wOyiOsGrF2yNeW8T6J+/4vHu1WCQtNymi+SpKZwAZThtY9oemK8sdHuaQibCQhueQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(38100700002)(6916009)(54906003)(4744005)(66556008)(66946007)(186003)(508600001)(8676002)(4326008)(2616005)(66476007)(1076003)(86362001)(26005)(83380400001)(316002)(6512007)(6506007)(2906002)(8936002)(5660300002)(36756003)(7416002)(6486002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kr2hw/s+PMZtuaHT9gYHPqBVGHYPuljeq85DKGb+aWFnh78n3AbYWf0dV2/7?=
 =?us-ascii?Q?Ec+Y37IbBRRBs0TVhKgxwUbna3RMy3FeeERMEO3rKMaAkHOtFdfy3L8KjLi5?=
 =?us-ascii?Q?VlHBaJiYykLh+KhH0kPyIQGmrnZCi245fHsi3tSTGBIQMKMf4JjJdecMRWDw?=
 =?us-ascii?Q?+EBXDmx21fTAaR/IQlTkbdzpBFNHVnwbbFl4C1JgyComPK2Y1vYNys1V+dle?=
 =?us-ascii?Q?k9PF0SuuVaUSZHqKQfmAEbJfrbuWPFMeBJOOXyhEwKEmXxSXxZxgvBpxVp2R?=
 =?us-ascii?Q?XoSYs4E1Rcpoy1OjD6kv1OGyQcVGNOycgA2YPreA5DRwTSVsccwYfo+hGyC7?=
 =?us-ascii?Q?thVDzby2MQY2luw6paFPRPOTsDMA2PN7/iF+fQ7Y3o/R4mP3rG94oUS9vHet?=
 =?us-ascii?Q?I7sOyGqEmEGM11V5H7twHTqQpb7unDY6Ri7NuMeuC35VR/czM2YJnXUPUR45?=
 =?us-ascii?Q?5BlY/wO1+QuU9Hxrd4xLMJDXyweKqzVg0MLYl5kp3CXiCeQ5cWpM5Rxyp1CO?=
 =?us-ascii?Q?GpgjWcis26/xk0UEOdKVLgFRtNEl7Xs81EKPXt+NF1e3yJuK+BJHiHsnxYY5?=
 =?us-ascii?Q?Mn8/dRrNELJq1Cj8DEApiE8RubFjQ5jwkZdrqLc+8gHGooSO7JQo0qOH8tM2?=
 =?us-ascii?Q?APkiy2Bwywhk1gJcQprmlB6jUOe7Z2IubXM897qgdGW3WZt5pExw8wzhv9tq?=
 =?us-ascii?Q?jjpOorqygzr+u97Nr805Ct+mbuvAFehfhHA79mrNSG8ZabqXJ21xBZB1jXmu?=
 =?us-ascii?Q?A/jNt6V1yf9laA4YU9ow4v8ji+KVCUyMkpbdeoiimFpNoi1VmCbQ652RA0d+?=
 =?us-ascii?Q?o53N4YSi0IyrJxUuVguRvY+KS+IsWgEkcO2I8I8/WtAy2pRcjMPtxhxgBppA?=
 =?us-ascii?Q?N087EH/dv44PpDMWAJqKA1FlN0DDUM3jJGonxkwtcrS9IxMMWKO3evh9eNhB?=
 =?us-ascii?Q?gEfnzlAh/61U7hrBek3Yjo5K8CgkUB+QAE/ARAzYy7BvSWlruB6/mLcwkaCb?=
 =?us-ascii?Q?FS2SDtmJ4rq5R0YAzD91EDutLjkaZMWQHa3LC4vF+m17MaHXhMV0ycFJHxhC?=
 =?us-ascii?Q?HfdTHs1zqhPriu01Iw4s9ILQ4md08vxfkCiaI1O5nVX4teXktD7lGfAMLdsf?=
 =?us-ascii?Q?2Vc/h6cPSEywlz5junCDLaXeIWqLLJk5mM+Ah5JnLdZVj9jSIwNl0kayQOhd?=
 =?us-ascii?Q?Iv/JRMdFUP+GFcUId8G40MurIWD8yXCGcBoSH1jr3fy7I2or6Ho+wHAC+WAz?=
 =?us-ascii?Q?IYNkPmSYQ0vlZF85FYzjTpSidF44F4vt7rRvFhPUFRF+RQhDAwA2fuz/+gHR?=
 =?us-ascii?Q?Nkz0VkMke3sfugWroo3eIY1/FhkpU0slpGrmPGUAAbkT2WFEpBBYaRKHkL5a?=
 =?us-ascii?Q?sX5T66Z2nis7KqutetwcW8lRZHERFECcsalj6z3Qy2AtI3XqH2l9GZKF5vhU?=
 =?us-ascii?Q?LBMqvlNwl0R+iqMrB0OR1M0lxSD2nNvDcNwcleBk+00Qxflz/YS5DYbBM1wl?=
 =?us-ascii?Q?JxJpRIMvU8n9rcx1kFj0tg0rBV9Dup+POCtPTYW5HiEUUly4dMuxFbCj0Uss?=
 =?us-ascii?Q?Ca/v98iwTMkGYkTiaOusFU/W6e6W+JLek3mTrFdRg/WOXGmKInhvq47rRhpG?=
 =?us-ascii?Q?OwoQaqg548JAsmU3qroyORJZsY2LEKEu398Bt3a7dVKQ/fgSkQTTMAItE4Ya?=
 =?us-ascii?Q?HckR78zGA9uSoQFVSvPdXG0+TOwvm/fTUTCI0DqYQm3MFejnhLhIwRBdvgDf?=
 =?us-ascii?Q?JVSyfoxOIA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a428c69-e2a5-4f7d-65ef-08da1d538b22
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 13:43:08.1530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m84xDoR34/Uk8PLDa2ccgaRARfxNdO6cxx0Fb18g4QQX03kWJBRj78zXnpeJ/rb/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1616
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 01:39:35PM +0000, Wang, Zhi A wrote:

> It seems Jani's makefile clean patch has already included this one, I can
> just simply drop this one so that Christoph won't need to re-send everything.
> 
> For the branch to move on, I am merging the patches and will re-generate the
> gvt-staging branch, which combines the newest drm-tip vfio-upstream and other
> gvt branches.
> 
> If you are in a rush of re-basing the patches of non-GVT-g stuff, you can use
> gvt-staging branch until my pull request landed in drm-intel-next.
> 
> Also our QA will test gvt-staging-branch before the pull request. I suppose
> it will take one or two days.

When you are wrangling the branches it would be great if Christoph's
series and it's minimal dependencies could be on a single branch that
could reasonably be pulled to the VFIO tree too, thanks

Jason
