Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FBB16FA6F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 10:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A7C6E25A;
	Wed, 26 Feb 2020 09:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5866E25A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 09:16:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxQgYtpReySaNIbskEmp8IP2RpJ7zmUDD0co4oD7VIqiaBDedYNefGnZHpmKAYdtK9IWAY7y8zTxQL0n1dEDM99N6RTgO3+IW1iTiRVj0ixYyqiIiFEqwLI8YQjn6iNIal33fJGokwOk9E3nlU/BVdj0+zZpPbYpB1GfiaIOn5J7XSpy3Kjdr31V+XbtTfoYyzy0ojwtRSorbYleSdAm1RQiV4+ko0bQv7ny0iFEG5MhiYHqMNtIa2hLxI+hgew57QMWCJ49Tk8jrgznVWNrfWFmcXHIZnOk53bTsEblPZiF2VRFaem9+MUk9eT1MyyMc027/rPzqjZ57qwmPjVsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phV13SyoWkujoJh1MRguXHI+RpYvMI44zkgV4V7TfFY=;
 b=KVNj3tzMKhTsWoaOBVXWqzq8AXktX2OrG3//5Zi/1daJLW/Wwj9u8o0hd89RDCUnrWJa/CpTEseFzQsOOPFVsyzfivUvql9e1bGrGELTOo1bqD9sHaWEl0TqJNW8icp23j1jJR3usG2kwqvmxrK3WjRixUU8EzohJOyYD2dT/rGvT9z7j/6SuSh84RaD1MRWT0LZ+t0jNhYkW1tSaxobXodPQrXeJTHiMA1655bYOtmr1U1EIV4ufaVoyT7tivGKncDQvFJaiKMjX2Tj1myc0jrCWQTDJalxWhMXobWWGk700Tqwa409oUb2wbWMFBfapvl8A0HL/TEuKPSqqPS+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phV13SyoWkujoJh1MRguXHI+RpYvMI44zkgV4V7TfFY=;
 b=pyyjLL0u5o6fVim7nJ5jLjqI18fSUvxRk6kqFV7639EmYYuRgl3BlOwXIZw1oKArbFh1YUbp2EeHZ/uozoSOyvHruT+YhkiEHEDCXgZJcK8Mhp445UsufTvGOfVSyl/A5GdSmiwp1YQ0drgI/0aAlq0DpTyTO0MEFFHjt+pg8jM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1660.namprd12.prod.outlook.com (2603:10b6:4:9::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Wed, 26 Feb 2020 09:16:14 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Wed, 26 Feb
 2020 09:16:14 +0000
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20200225235856.975366-1-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
Date: Wed, 26 Feb 2020 10:16:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200225235856.975366-1-jason@jlekstrand.net>
Content-Language: en-US
X-ClientProxiedBy: AM4PR08CA0045.eurprd08.prod.outlook.com
 (2603:10a6:205:2::16) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR08CA0045.eurprd08.prod.outlook.com (2603:10a6:205:2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 09:16:11 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92608199-adcf-4fcc-2424-08d7ba9c86c4
X-MS-TrafficTypeDiagnostic: DM5PR12MB1660:
X-Microsoft-Antispam-PRVS: <DM5PR12MB166002845D83D1CED29B7FCE83EA0@DM5PR12MB1660.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(199004)(189003)(4326008)(2616005)(478600001)(54906003)(6666004)(31686004)(66556008)(7416002)(66946007)(66476007)(6916009)(8936002)(36756003)(2906002)(186003)(16526019)(8676002)(81156014)(81166006)(6486002)(316002)(52116002)(31696002)(5660300002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1660;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q+raHDIhfQbYiDD5qJjXTbM3JX5JN1OoRKraXRT3LPzbMNzuFnDvZKRIqKp8oLFocZwzxkjGSkSd8Mz/tMig4IZbVfwsIaHLpdm/IPqYG3wJt2R1IGifYGzGSwhnJ4Ap5yq2EKpyGzHmu1XrL/LJ7Pr9Z5YqBWCXMpbM4TzqwLQJfND+0235tI1XQtmnTHv2al/k37Qd9b2OltBfwTF7sPAvMCRv1uF24jUqyekf7Oc0T2N1ZChfgcLJBgzabh2XZGGe1gXhtq3YRWVET6ECdCMP1SRg/2NW/JNIg9hnInwAYSV6ddRkl63i587T96NVLW/8pDapGFZfO37a4ewbXKAo+NY4MTTK4Q5hZzAdVTtSgPO9vvFdj5rSJX8Zm0hBs69OPp/tSc6GgyrswXlfoSngCAn1V/ab9osJDMhbhoaffIg6yG1fIMHb6p9I8s5S
X-MS-Exchange-AntiSpam-MessageData: wlvReezp6C6J+EB2yej848xzPLINVNAa3mwDscgYogrTyjEPj6SfNikZEABeRz4gqBK9CWiH3wTRXD68nsHsEbYv3zXEbibjabxh4MlIzu4d8aYiT1n4EyGm79UouaGioAD6WBUb2gf0d/U8Z11as1TPy4G0gXchvd1ES80wwF7RQ6Vq2QrJMcJo2v7cgarUkQPN/Tx2l1tDxBoQurvlyg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92608199-adcf-4fcc-2424-08d7ba9c86c4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 09:16:13.8618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kU3QvkAdPKu1RVhO3S9vsGI64Al1Jt2QJUGLr3XumYxxMm/d/JSw4bUf3dr9fNSg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1660
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
Cc: Chenbo Feng <fengc@google.com>, daniels@collabora.com,
 daniel.vetter@ffwll.ch, jajones@nvidia.com, linux-kernel@vger.kernel.org,
 Greg Hackmann <ghackmann@google.com>, linaro-mm-sig@lists.linaro.org,
 hoegsberg@google.com, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 jessehall@google.com, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

Am 26.02.20 um 00:58 schrieb Jason Ekstrand:
> Explicit synchronization is the future.  At least, that seems to be what
> most userspace APIs are agreeing on at this point.  However, most of our
> Linux APIs (both userspace and kernel UAPI) are currently built around
> implicit synchronization with dma-buf.  While work is ongoing to change
> many of the userspace APIs and protocols to an explicit synchronization
> model, switching over piecemeal is difficult due to the number of
> potential components involved.  On the kernel side, many drivers use
> dma-buf including GPU (3D/compute), display, v4l, and others.  In
> userspace, we have X11, several Wayland compositors, 3D drivers, compute
> drivers (OpenCL etc.), media encode/decode, and the list goes on.
>
> This patch provides a path forward by allowing userspace to manually
> manage the fences attached to a dma-buf.  Alternatively, one can think
> of this as making dma-buf's implicit synchronization simply a carrier
> for an explicit fence.  This is accomplished by adding two IOCTLs to
> dma-buf for importing and exporting a sync file to/from the dma-buf.
> This way a userspace component which is uses explicit synchronization,
> such as a Vulkan driver, can manually set the write fence on a buffer
> before handing it off to an implicitly synchronized component such as a
> Wayland compositor or video encoder.  In this way, each of the different
> components can be upgraded to an explicit synchronization model one at a
> time as long as the userspace pieces connecting them are aware of it and
> import/export fences at the right times.
>
> There is a potential race condition with this API if userspace is not
> careful.  A typical use case for implicit synchronization is to wait for
> the dma-buf to be ready, use it, and then signal it for some other
> component.  Because a sync_file cannot be created until it is guaranteed
> to complete in finite time, userspace can only signal the dma-buf after
> it has already submitted the work which uses it to the kernel and has
> received a sync_file back.  There is no way to atomically submit a
> wait-use-signal operation.  This is not, however, really a problem with
> this API so much as it is a problem with explicit synchronization
> itself.  The way this is typically handled is to have very explicit
> ownership transfer points in the API or protocol which ensure that only
> one component is using it at any given time.  Both X11 (via the PRESENT
> extension) and Wayland provide such ownership transfer points via
> explicit present and idle messages.
>
> The decision was intentionally made in this patch to make the import and
> export operations IOCTLs on the dma-buf itself rather than as a DRM
> IOCTL.  This makes it the import/export operation universal across all
> components which use dma-buf including GPU, display, v4l, and others.
> It also means that a userspace component can do the import/export
> without access to the DRM fd which may be tricky to get in cases where
> the client communicates with DRM via a userspace API such as OpenGL or
> Vulkan.  At a future date we may choose to add direct import/export APIs
> to components such as drm_syncobj to avoid allocating a file descriptor
> and going through two ioctls.  However, that seems to be something of a
> micro-optimization as import/export operations are likely to happen at a
> rate of a few per frame of rendered or decoded video.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>
> This is marked as an RFC because I intend it to start a discussion about
> how to solve a problem.  The current patch compiles but that's it for now.
> I'll be writing IGT tests and Vulkan driver patches which exercise it over
> the next couple of days.  In the mean time, feel free to tell me why you
> think this is a great and/or terrible idea. :-)

For the exporting part I think it is an absolutely great idea because it 
simplifies compatibility with explicit sync quite a bit.

But for the importing part it is a clear NAK at the moment. See we can't 
allow userspace to mess with DMA-buf fences in that way because it rips 
open a security hole you can push an elephant through.

Just imagine that you access some DMA-buf with a shader and that 
operation is presented as a fence on the DMA-bufs reservation object. 
And now you can go ahead and replace that fence and free up the memory.

Tricking the Linux kernel into allocating page tables in that freed 
memory is trivial and that's basically it you can overwrite page tables 
with your shader and gain access to all of system memory :)

What we could do is to always make sure that the added fences will 
complete later than the already existing ones, but that is also rather 
tricky to get right. I wouldn't do that if we don't have a rather big 
use case for this.

Regards,
Christian.

>
> --Jason
[SNIP]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
