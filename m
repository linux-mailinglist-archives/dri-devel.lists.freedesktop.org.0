Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FA3F77A8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D556E25B;
	Wed, 25 Aug 2021 14:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F166E25B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 14:47:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wl2zgmw13tb72fdsBWUsaSDtsXE7IjWzk1hgabBbTCEo5AILqaSnCFWmOea2NmlnlxhjxzruKCbNlmg1IIZya5QzeHERPkSVsWfQD1yaN9Ri/BV0zBBQ9U0LoQZdr0QG/JZ4znUmGyJ/W7DojOm2VK4hJ9wBKaLHz+CSVG5bYXOCPU/Y6quKzdCh+8+vBb42T5Lxma7PyF9b7jfTmjZUI7hUoPKtGUY0hGNgPOvEyNdWEuOpGx1/tg5yCLHl8nNZ8IH775/YiFiofZLjbx0el+JQ+6dZuPsr2kGXltOq6rEONPtqYiTTzxf9ITsb0GofX/gfvf5ftz0FeBCJbxRfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9usUQVVSLpEN01n/8TGbIBlPwvUIE4fz7IBLssLkPM=;
 b=T8Pl0SrdRYze/MiicZmWqpXmh1jIkDiFUGmVAphtLp8C9Exx0Lq5+9mWcpr1OayMYG5lOhK7esRiYqyy89xLsoMs0fnIsur60eAkK5Sk7lshbSwX3Cbh7gYjzGLGkddP7ZKYFGIBHEmNQXamJiTvYSdoblIwfbWl4NOjepg82O+pNyl5A9PAV0n0gWbO7XQVasLf/KO4XZDC3Ic59xjSxwmo8vPqN/Ov6CGJ5Bs5wcQGbcBzIgOdMu/HfyU29MTeN6IHO8eMhC80pW5TaJGp8rZ/VfblEMI/m70OBgwpKM4sSJaUgWNhTbKfx2U+kB6a1CUN5+rivug6VQ3i61eV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9usUQVVSLpEN01n/8TGbIBlPwvUIE4fz7IBLssLkPM=;
 b=BmeOQbzzgVU6BQO2iBcPp1R53uzk+jWmgL+7UtUQid097GZtqb+6V8GsUkwgWMEwt9/z+rVN3cIRA6V3S6xHn7qO7ATb2z396CSA3tFOoM3PqzIFJD1ONlgYf+9dcEm0vK9muO0NFr3wV+i1mlvpeCJXH7LwytCEtt2G4tVW7u4xFicX1ogt3u3YtxI+a5hOmeFOh65UXErHRHrFMiYrjaK4Uey4/2glVdkMkYa/QrLJRkDJhktxx+g0U2wBxys35/Xoh/leQJQd96rBaMeXLLO9vz0YB2iA0AXf2ItNeQaUuCGx6vq3E2kg5Qxjcld89s5J0ZjSHJ5RLsqAtIyr+g==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5109.namprd12.prod.outlook.com (2603:10b6:208:309::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 14:47:38 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 14:47:38 +0000
Date: Wed, 25 Aug 2021 11:47:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Gal Pressman <galpress@amazon.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
Message-ID: <20210825144736.GG1721383@nvidia.com>
References: <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
 <20210825121832.GA1162709@nvidia.com>
 <fa22a1f9-fee6-21ea-3377-3ba99e9eb309@amd.com>
 <20210825123802.GD1721383@nvidia.com>
 <9c9ebc3b-44d0-0a81-04cc-d500e7f6da8d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c9ebc3b-44d0-0a81-04cc-d500e7f6da8d@amd.com>
X-ClientProxiedBy: MN2PR01CA0024.prod.exchangelabs.com (2603:10b6:208:10c::37)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR01CA0024.prod.exchangelabs.com (2603:10b6:208:10c::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 14:47:37 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mIuBk-004xEK-EZ; Wed, 25 Aug 2021 11:47:36 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fe70839-2c66-43f4-27c3-08d967d74865
X-MS-TrafficTypeDiagnostic: BL1PR12MB5109:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5109ED95FB6750366D472A96C2C69@BL1PR12MB5109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zG70OUz9glOSKZenPVPwXm4TsI1360ZsviyxU8H+bODl0z1EGrO8bsgYXZJyurTF8s55lFqO0VZwmlxCjdpWRRpAusygFD37+hl7qkqbiSXsQ5tWpGVwdYkANtLd1x3lMjFZNwrRAJw9pxbFzgbRCmjpZ1tWNcJMS9931IrN9k3e7/pukNRYl94NxJaNw88bd3cY6so2q5ZUybpuxraIWRiBJQKMOP4om/kIlVx82rebe9HVFhxtSCJ1T6acKA3rQ9dvKS27Xncpc7muEtfarWjSjj1Pk3UjEhQkbVXYgpy9KxyCkEPzVvSb5Fy//r8+O+btq65TBlaTvs+h5vIrtQiOQt7fFdvUjqCG5eowLNkDAxlTIeOqD3P2xP3QMrSuhxS7xzsyVfD9ynsg/kvEL0w/KEjcjPsmoMtgfUSp0WmsP7Vd1YKhSsLLQytZV65nu/9Na1pOJ+v4hs+RYKhlCgZSJnm8NcnTB3kvnK5y4hj2T90qyWh32eGkXz0cxOLWBsAd68hPYOKq0GWOVXb154bw+LkBt+fSxJiEn+fXGb6PD729gGqx8DTsTcgqrMzk3Yuh4UHlftXQsBIGwNZ9GWOAenAg0RhS7RUJwjNH00jnIXXZdqOkw7hFRW8SfCCDzbffEX3MovcfDhguEj/UAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(2906002)(8936002)(7416002)(66556008)(33656002)(38100700002)(86362001)(66946007)(36756003)(478600001)(1076003)(6916009)(5660300002)(83380400001)(4326008)(316002)(426003)(9746002)(54906003)(9786002)(186003)(2616005)(8676002)(26005)(66476007)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1ZBVE93bThPR2p3RG9hUzRCdituVU9ieHVhQVZvUHE1K1F4dkpPQzBHdWRY?=
 =?utf-8?B?ZEJWdGVjRkZIWlJwWDlKRklpTHdod21XcFlHSG9adHdNcjAwR2RVQytobVU5?=
 =?utf-8?B?cm1ZSjFvQWxTWFNvUGw3a2VSWGN6aFo1cnpyL2k3ZUtvY1g0cDdoRXZRQ3J3?=
 =?utf-8?B?SVFINm5pMEJvQ2RDaVAwK3VvRFdveVFDcnVjcDdrSGNRbHk3RGlNaVBkdklX?=
 =?utf-8?B?VlIyWE83U09GVXJTRWdkR3lNQnU5bGk4L0oyc0FiYnRKdWtwY2prcUkvelJ5?=
 =?utf-8?B?MVJDaDBqdWJ3S1RkN3hHdm5Kckk2aGhJTjlTUlFpTEVzYUdGcHZYQ3V4M2lt?=
 =?utf-8?B?L3o2YUtWNk9USFI5UG5qOWRmVHJ1cG1aTUdYaVVuY0ZtQjloL2Q4NCt3ZFNX?=
 =?utf-8?B?aUx4eWN3dHBpU0RjK083eVVscGovMkt2R3dCaTdHaWU2cEorQ3pwck1OTFJ0?=
 =?utf-8?B?QTRMM0xZcUpqSkt5NG1UVG5uRStmQzJmMlJwN0d2cmZmT0dmcC9vN2VER01a?=
 =?utf-8?B?Q0lBeGVwSy9YYlZ6YTIzVnUySXNpVDlNNm55UmNEcExJZElLUE5WbzBLK3pz?=
 =?utf-8?B?Sm50N2YzaXNHRWpGQ2cyeHQzNEJJNmRPQmhWUHhBdUMzN1NIK2tHTFhZZ0E1?=
 =?utf-8?B?aEsrWjdFNXdYdkd0cVdiUkVJNmI4dzgvTi93K1pZa3VIZUZoL0NZQmJlNG1I?=
 =?utf-8?B?S01teVQxdFVkR0ttTFAvOThmU2lqT3BBRVBtWUxxWGw0bUZ4T1BiZUUrUlpj?=
 =?utf-8?B?UjFUSE9mWE82YVF3U2FmZEEvY0hiK3dBWjhOMzRBa0lwMXdDTDVSYk1tYkxq?=
 =?utf-8?B?dGhZSUNuNVMyYkFCdysyT1dEN3daZzJqUFdMZVlVUnNLNjErQVdTeWdTYlVS?=
 =?utf-8?B?VkRYak9OTG5BM0x6SHNJZ1lFQjdzMC9uWlpmY1ZjbVpSV2tCaHNsMG96NTN6?=
 =?utf-8?B?RGpYTWsrSjBucVQ5dlJEaXFFWVpOM3M3MzgzTXBrazdQenlKOHk0UFU0THla?=
 =?utf-8?B?MDRhcWpqYk84KytFSDNST1QxZmJTaWkrV1pWS2lLNHRtWTc1TXdPejhXN2Jl?=
 =?utf-8?B?eDc2QTVTR1JJdzZDVWJnaWg4YSszRmhSVVg4U2haVThlTnhaSWlDY3J1UkVo?=
 =?utf-8?B?b3ArVHRTM2hMNEl4eE1TNGtNcnVUdlNtaVg1SHA0Nk1EMEsrbjZuR2ROOXNT?=
 =?utf-8?B?bnRDNWhwMDJJMmVEQzAvU01KVDVkOCtqaHVCUlR4Qjg1VDBZUGsxMTFjdUlE?=
 =?utf-8?B?RVRrbGR6a2hSTWpRU0FuWHUyYlY4YkRNRFA2UGk3ZVZoLzJOc3BiMTRPRWxE?=
 =?utf-8?B?ZCtnak8rMHNCaTFQRHBCV1UzQ1kxRXdPS1JJZ3lPOWxTNHBWNkxMenMvT29X?=
 =?utf-8?B?M2ZhVHhWbmRhREhkSnFsSTFYSFlUTnBFVXdGNFVtY05LN01BbkRDOW9OdnBv?=
 =?utf-8?B?QWJoQloyTlprczFZZ0ZLZzZCRFJiengwUUFuY2NZVU5URmlaUisya3lmMkhU?=
 =?utf-8?B?ZTd4dVYvSXdEbVBsaHU1Y1FjQTBnOWV1d2h4OW9tUGNaM2hjaitQR0hJdTQ5?=
 =?utf-8?B?NGNleUZ0VTBjMGVPS0tBc0dXeUVXem5WK1RFcGIwOFBlaUQ3ZGM0YmNrTkF1?=
 =?utf-8?B?VXVpZ0l4RGdtR0JhZUxPYVpRWGFoUUZSUE05MFZkUE5XdzFIR1RrOU9GbVl4?=
 =?utf-8?B?Qys1L0d0UlF1aUV2V2FVRFZOOHFFRC92cG1icHRzOUVSYm93K0pwQzBzNUQ5?=
 =?utf-8?Q?J2+rF6SEEpuOiIXsu+fIicJ9NueZj+mfnIQPppS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe70839-2c66-43f4-27c3-08d967d74865
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:47:38.2024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3iOKJINpcYpd2WfwHR3DIAlJH7ChcaNGk/YODoDpKqkJ1ogGe+voyWcDZkpXAts
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5109
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

On Wed, Aug 25, 2021 at 03:51:14PM +0200, Christian König wrote:
> Am 25.08.21 um 14:38 schrieb Jason Gunthorpe:
> > On Wed, Aug 25, 2021 at 02:27:08PM +0200, Christian König wrote:
> > > Am 25.08.21 um 14:18 schrieb Jason Gunthorpe:
> > > > On Wed, Aug 25, 2021 at 08:17:51AM +0200, Christian König wrote:
> > > > 
> > > > > The only real option where you could do P2P with buffer pinning are those
> > > > > compute boards where we know that everything is always accessible to
> > > > > everybody and we will never need to migrate anything. But even then you want
> > > > > some mechanism like cgroups to take care of limiting this. Otherwise any
> > > > > runaway process can bring down your whole system.
> > > > Why? It is not the pin that is the problem, it was allocating GPU
> > > > dedicated memory in the first place. pinning it just changes the
> > > > sequence to free it. No different than CPU memory.
> > > Pinning makes the memory un-evictable.
> > > 
> > > In other words as long as we don't pin anything we can support as many
> > > processes as we want until we run out of swap space. Swapping sucks badly
> > > because your applications become pretty much unuseable, but you can easily
> > > recover from it by killing some process.
> > > 
> > > With pinning on the other hand somebody sooner or later receives an -ENOMEM
> > > or -ENOSPC and there is no guarantee that this goes to the right process.
> > It is not really different - you have the same failure mode once the
> > system runs out of swap.
> > 
> > This is really the kernel side trying to push a policy to the user
> > side that the user side doesn't want..
> 
> But which is still the right thing to do as far as I can see. See userspace
> also doesn't want proper process isolation since it takes extra time.

Why? You are pushing a policy of resource allocation/usage which
more properly belongs in userspace.

> Kernel development is driven by exposing the hardware functionality in a
> save and manageable manner to userspace, and not by fulfilling userspace
> requirements.

I don't agree with this, that is a 1980's view of OS design. So much
these days in the kernel is driven entirely by boutique userspace
requirements and is very much not about the classical abstract role of
an OS.

> > Dedicated systems are a significant use case here and should be
> > supported, even if the same solution wouldn't be applicable to someone
> > running a desktop.
> 
> And exactly that approach is not acceptable.

We have knobs and settings all over the place to allow Linux to
support a broad set of use cases from Android to servers, to HPC. So
long as they can co-exist and the various optional modes do not
critically undermine the security of the kernel, it is well in line
with how things have been evolving in the last 15 years.

Here you are talking entirely about policy to control memory
allocation, which is already well trodden ground for CPU memory. 

There are now endless boutique ways to deal with this, it is a very
narrow view to say that GPU memory is so special and different that
only one way can be the correct/allowed way.

Jason
