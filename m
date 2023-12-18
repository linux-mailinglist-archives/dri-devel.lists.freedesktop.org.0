Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3536A81797D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A7B10E249;
	Mon, 18 Dec 2023 18:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAA310E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:19:25 +0000 (UTC)
Received: from DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 16:31:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoY6Q4J59kuhgCJXZYf5woohgUcmN0+v1rNgpjBf67A/ucwSThSsFsIF1xvs8FUVTw5oBQzGFoBoJSbW5y6FWwblvTXxXwvCaJYGczSZtgyy673vrl2jCHt9YUKpmfE3+zPExjWSJKIZ0FbV90vaoqraQK8KRozOsRYEd6FC52f4yOEOzAiQp6BF1e4ygtgTuAWYYGxubPCPkZPtBhcZgPmCa9zZC8XaSV3zJWdMXq2CDr9Y0nQ6AEI3ApmFl4kNT7IbDOxo54BsvQZkGQU8vzZR7cixBvyBceCC6s6BYlw0Xd4J5YrfrP7qrabNvqColui3dT7m06tsevI2pN3oSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWIolyEP0YV6kZ598cmZFNzsxYYq8H2XW72mdEnyYRU=;
 b=lld6SucgIUc/MC0ggILWdPEuf+OTZj6RFIecUoFQsfrWxPgVIZYZLNeZB41wzXLaI1w3WfGpy9BuGdsi7iWplnfy1JvsA9lRGFyyIibq67bnYPPv024VXkqZxYprPZcJi/4sw2yZ5BjTCgfsZbZ3XLcA0zxSNgGR9YFFgT/vfsHUnGSemMij2+NxUbKim6bbJUqLXvzYJUlaEalEzHU0batzjxeF+Hr0VoTuPnBDGxLRRkr+u1Ga8od/A5s+OsBr7tmKzZ5TQKIC/yWPHbTEXYtA8OXX56RHQtjOZ4/t/hD0dlhgtU2Zao/cMiUhg3iE2U+iTR1v8+Ax5h1PwoBZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWIolyEP0YV6kZ598cmZFNzsxYYq8H2XW72mdEnyYRU=;
 b=iYfc9FbtauqqoOaxfdZ2h8ODTA6ov4ndkSHrQvGBCLDPc7o1NwWsQ8wwfbqKClX/uPHkQ2voslWeMZBE+BnChgKJGg7aueT0PPQOIcd83jGhpbZhIwfDI2b4g79bN8bzSXAzHPuQvt6G7iRk14SVFafat2Xc0YKbFsGu2kouQis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 05:30:19 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::87d4:680b:51ef:181]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::87d4:680b:51ef:181%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 05:30:18 +0000
Date: Mon, 18 Dec 2023 13:29:57 +0800
From: Huang Rui <ray.huang@amd.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH] drm/virtio: add definition for venus capset
Message-ID: <ZX/Y1Rp0RoFdpi1Q@amd.com>
References: <20230915105918.3763061-1-ray.huang@amd.com>
 <a7b783c8-b1c8-90e3-b6c7-7fa8c6d24d21@collabora.com>
 <68470997-bb4c-3c11-98b5-aa75c52cbaea@collabora.com>
 <b79dcf75-c9e8-490e-644f-3b97d95f7397@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b79dcf75-c9e8-490e-644f-3b97d95f7397@collabora.com>
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS0PR12MB9422:EE_|CH2PR12MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c788d9-e276-40cf-b6cb-08dbff8a6c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNXpqQ9CiSL+3JbK7ax/+0CwHVA1YSMQOJ9E4LCjpcYnuGQr+5YXVpPbSRGeMoYcvAik5xTpUEdlbC8fzxTmBBddq29P9g/Ycr+2C5SJ2cRFyZgz+EllhZ+Z2LhjznbGiu9bpqj5tnzBbEw0V1MoeLTxtKCu6n9GsC7GYYEVokUfHZmEy9xXANZwMjXFW+FlQj5oIZ+CiWirDCZEvhTR5YmvbU1T/lF/IQHkHWRECZnsa8ptZeDtouYDGCwxe07jzi+qNRa7sgveVYP6JadTLp+8Y3cs10AtoZRZyI6IDYGZclZHVcuMVwK337ATCZUdUcmjlMzFp4uhR0rcLcwyhiO6bLFjb3LcLPCDvAv8uk6Vx7e/ookN09J16nKfuvM9/SDv8ZiKi7kNc239RAdweUcNCFNa28NfqvIo3oRn/KTmaOrgNnAONNJ5krgT1Wy1nhzksxCJoYW94iBRp/NiQZkmfe1HMqwhdj1czWfKW+/PGBNcRFr5cv5TgT4WWfPV8HjMu1MP5zfFPwXMOCQg1QAjNPAjMNsleyqrKKNPJafXubXFb/vq0pNh+TFDv98++ZQrWC+Y86ZOX4oo4lNsug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8690.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(5660300002)(38100700002)(86362001)(2906002)(2616005)(26005)(83380400001)(6506007)(53546011)(6512007)(6666004)(316002)(66556008)(66476007)(966005)(6486002)(36756003)(41300700001)(54906003)(6916009)(478600001)(66946007)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WsWxN8OiZ8CN80qBLhy/CnCG1uvnHi7CwX6hwY7wzVQCnDf+6oWEpGnFGq7g?=
 =?us-ascii?Q?O/8UBq8kC5gs8RLKx2iqyC+hzGvksFlClI051B5Of6zi6N/BxB+8lBa5HKcF?=
 =?us-ascii?Q?3KZYT1VSf0taISbwEIqb7nskRiBODS1a0I50XYzdSGs+O6488nlbJTxKd/66?=
 =?us-ascii?Q?YbSMaZIkNBsrmsRqc1wC7M91iy/3V0mcQyE+CU19vnMyWtR/UzJciwX1GjIG?=
 =?us-ascii?Q?5IX2E2jIHI+BWlOkG/j2Tn5h+TGta2wefve8HHHNpylLDXLiHW4JGaGqO7kn?=
 =?us-ascii?Q?hHTJJOvH8btqhN0FdAaI/y5mcYPkH7JpSEa+YiB/QgB1lGRxkhek1pEwVS0K?=
 =?us-ascii?Q?x8FXXe70mKWXHixIWewpE6qd9e602nGoTTQy5aeUVwM+TDaL22qLHnJSJKGD?=
 =?us-ascii?Q?Pm1tqCvu9WupcB8+LkwvnFDYYAs6q1P7noASaDpYuCRi9gwSZyiWIskIK79W?=
 =?us-ascii?Q?EA1XTk1A1RGJ5cK0xkrh1zjjEt5E2PpyVxrNmAxQQWC9qbQ0NYDS8eYUqdca?=
 =?us-ascii?Q?ljL0O47oCvNlEv60YejQaxvmJ5X8UyZ7Aylq6zTPKaThybsOOz4Oa0fYozO1?=
 =?us-ascii?Q?/hLpqV7VHHC6xEhxtWH3m69Yj2roObhYBP/Jvtn/Hq7Db5x9jpnXDe89dD1m?=
 =?us-ascii?Q?NN97qGDYfwF9tZcJUBlQabWLSJxAhGR1HpU8ADsZeefN3+AtZOBJRWKqFSJY?=
 =?us-ascii?Q?uzXstvn6SSc/WTpBZNFpCLUdBs8+cV4juHUxFDXlSAgwC3Pc+iQxh+NS6act?=
 =?us-ascii?Q?P+uC2DK9EEWGXc7yT8GX0gscUVNbXdBo5COTE4tcKxwv/iUncM8LIEyoDu0c?=
 =?us-ascii?Q?kQozQ8WWZ2wb7U0LR40Lqe3wjum4agwjmGg/xzGlexNB1/mckEsgl7f89MQw?=
 =?us-ascii?Q?z2M3sHhv3lGg3s1lcH3Ax2X4FjpPtxeya9KsJxfHOthorJX3TUsiBu7pq3qB?=
 =?us-ascii?Q?qF0lsQlU6bHTlSs1PHpAAPXSWmYdOmdNeuLr9gfqsnzw7E2RDbC7t27dBon8?=
 =?us-ascii?Q?CvBzjFGmUAhXHohcyTAvACaEJldkiF8N3Of6NRqPUC5t3bIRoOmaj9od/iBf?=
 =?us-ascii?Q?FK0fn/KgpupMcCBcjgXSzr5SOI90WGAXTNV40VV3/wTo0coOqhz7Pb0nT62p?=
 =?us-ascii?Q?XnllUvQ4CvMQ9S0htfbISHRamtkF/esiRU37TzOoYBZ+EMDM5BQLEuUOjx21?=
 =?us-ascii?Q?m2smQHq0Kt3+lg+m9tFXTPEZ+6kXjMdaJs4P8480E7PsgldGR3LiVrfKkCAi?=
 =?us-ascii?Q?PEqiSrXZiihdRII1lysqKKNDyBN1lSN4bSI2mlo88x05BssBpG0vXsWRsYWr?=
 =?us-ascii?Q?W4jlxIg4hO0rtMTsWZwlBQW/M/Rqwu/qfOSiGsb3WW8aDD87KX2QrwTYNP9X?=
 =?us-ascii?Q?QKVVVIVu6aDtrWeumGU4OFxm06AVw3AE9dqtCX4rYfg5vMDF83CLa3mMjoYc?=
 =?us-ascii?Q?nF1EcyZazXxjxSMUdfa2sifcD7mHjC1KoOOCnl+3m56vJbGYnZbX+5jQfYeR?=
 =?us-ascii?Q?91wH4JhWQ68Mptn10bsRnKfMKCq10/0/g+pYT1xzoC76tTlSgojMTjK/eHLt?=
 =?us-ascii?Q?VkgkIrnApI9fvnLJZD7WngV2Cy6uRlJA2r93JwCT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c788d9-e276-40cf-b6cb-08dbff8a6c0a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 05:30:18.7558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YwqD54XtJKOw8EZdVa1Mo13dHI+jj6boHuaeOeZ5EQ353f1Zdp61XleT+aEL2mMcRFp7jOcaQQFiR/+du8cUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9422
X-OriginatorOrg: amd.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, David Airlie <airlied@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 16, 2023 at 12:45:32AM +0800, Dmitry Osipenko wrote:
> On 11/19/23 06:46, Dmitry Osipenko wrote:
> > On 9/21/23 00:16, Dmitry Osipenko wrote:
> >> On 9/15/23 13:59, Huang Rui wrote:
> >>> This definition is used fro qemu, and qemu imports this marco in the
> >>> headers to enable venus for virtio gpu. So it should add it even kernel
> >>> doesn't use this.
> >>>
> >>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>> ---
> >>>
> >>> Hi all,
> >>>
> >>> We would like to add a new definition for venus capset, it will be used for
> >>> qemu. Please see details on below discussion:
> >>>
> >>> https://lore.kernel.org/qemu-devel/b82982aa-5b9e-481e-9491-b9313877bcaa@daynix.com/
> >>>
> >>> Thanks,
> >>> Ray
> >>>
> >>>  include/uapi/linux/virtio_gpu.h | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> >>> index f556fde07b76..0e21f3998108 100644
> >>> --- a/include/uapi/linux/virtio_gpu.h
> >>> +++ b/include/uapi/linux/virtio_gpu.h
> >>> @@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
> >>>  
> >>>  #define VIRTIO_GPU_CAPSET_VIRGL 1
> >>>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> >>> +/* 3 is reserved for gfxstream */
> >>> +#define VIRTIO_GPU_CAPSET_VENUS 4
> >>
> >> Could you please add all other capsets, so we won't needed to do it
> >> again in the future
> > 
> > I've opened request to update virtio-spec with the corrected/updated
> > capsets https://github.com/oasis-tcs/virtio-spec/issues/182. I'm
> > expecting that it will take some time until spec change will be merged
> > and now leaning to apply this v1 patch to not hold the Venus work.
> > 
> > Gerd, do you have objections? R-b/ack?
> 
> Applied patch to misc-next with edited commit message. Updating spec
> taking much time, not worth to hold this change longer. We'll add the
> rest of capsets later on. Thanks, Rui!
> 

Thank you, Dmitry! I will update corresponding patch in qemu, and send v6
qemu patches.

Best Regards,
Ray
