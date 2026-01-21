Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGqOMYSacGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:21:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5BF5443B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D814410E72A;
	Wed, 21 Jan 2026 09:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WZrBwJ3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012006.outbound.protection.outlook.com
 [40.93.195.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF6410E720;
 Wed, 21 Jan 2026 09:21:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MR0eobPTNM/GFFBB5T+jh0526GKg+0YnGhp21PNGoLMBiWYPID0D1eXK7M+7l2AC3T0k9vTTNGH2RBEAEWjjRyAYYKouzpScJ4Pf2vsaSlBO0uGZlMMNO5Utf8bU/Mpe1GjRFA1KqaVQyQszGctXkfq45qpEkbIfE/UFC/SqOFf9H72awMV7nzNOM9lOz+EZRMJ/WF2RHBfmNXuHr0rNlfu9OrZ/yIw6wS+E5Xzewj8L6uYruGK1nMk58lTyhyzDblLhD/DDeIwMUWa1T/uY5fLErDYWcBzu7ZnTBtDK8OtJYpIs35CUa3jCRF7xJ7fvaGZM/jiBgDsYpEfsIBIEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBdVVc00gX6DwmK7nGDf/MmpFSpx4YcH6yme/DoxmCA=;
 b=FdGWt3gkAcqR5OQA2esqCtBPtywH+0SbKRCCA+VGOMIY29PXzru/7CzuZyHVNGOO0CxZZx5io0DdZCg7wsHlpWzxLUyylk0mojTWCfN7ZrZ9edV9hQqwr2YmJf0S2epKibyEF69XmwBXJfDTHi4KGGa/BITcSlw+6SPMtM72FbOKfSWKE4IZUOMNzRgYRlKCVDKUgYAJSTxBJBHbF7QucAtvmdVEPHhTMStEmHqwBWFTHv1vyL24ILP2a48GZH27AUtGGR/sj8LKAer0P0Fj2pdXrwmDMPLd3DIZ9S5ULfTsbHdL4poayn9OSLBtK+xL1wS0wI+LQCnMMMGp54ja2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBdVVc00gX6DwmK7nGDf/MmpFSpx4YcH6yme/DoxmCA=;
 b=WZrBwJ3P5WF5HpcAbMTp91768A2fEDKkCqnLxVfvZFbrkNueL3USDZU+YuNf4mgIcA//jk/hBimTkSxnU7UV0QAeoM1jkpWgLxKcY1UUp6aVNGLNgM52J2GNsnww5yoVCMVhG0RznUQJU0PNMYIvUdbmGU4DPCIoIbMvyBWVF70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7191.namprd12.prod.outlook.com (2603:10b6:303:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:21:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 09:21:00 +0000
Message-ID: <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
Date: Wed, 21 Jan 2026 10:20:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] vfio: Wait for dma-buf invalidation to complete
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:408:ea::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: d83a5719-8f57-4dd9-021d-08de58ce6474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1ozMks5Q2tub1RXZm9LQWgzQmhpdkRFNmdVdE5MWGVDUmFja0RZejFXYis5?=
 =?utf-8?B?UE9RcUxXeHBPbldpZHBieFdLSTVhTFd1WHNXVytoUEtRbDV3dzQ0ZUVlSVR1?=
 =?utf-8?B?V3NPRnlDRU1sUGd1N21TQzZGVGM5VTlMbmYrSUZ6bEUrVFl2RWlKREtTd2cy?=
 =?utf-8?B?OUxoWko1ZmZSeVBSSzZDbkhaT1Jkeko1TmxJUjliSmJUUjNocU01NWxrSDBZ?=
 =?utf-8?B?QWh0TE9EVjRsTlJrQlExNXNiN0kzR2l3d0lWNHNqTE1sNFVNNzI5K0loSmtO?=
 =?utf-8?B?Ym1sQ3FVZmNJdHpXbGVSOE5JZE9FUFRMV09TaGxhVTNDYitFcDB3a096d0lI?=
 =?utf-8?B?amsvVjBvNW1iUVBnZS9VSHVCWTFFYnJPcFk0NUJlK1BMcWowVENyMVdUMVBP?=
 =?utf-8?B?T1pqWlFPYTM2Z0pnYW9uUlNjUHNPTFdGcmJIS0FkZ01UdUNmZEkyS3Uranpv?=
 =?utf-8?B?Qzg2eFVqVG1NOGtwdWY1NFdla2lDOEMzK0VlWGhZd1B6MitLcG9BSlpUVE80?=
 =?utf-8?B?b3hNb2FKL0lKNW9OMitmYzNRMytEbmFObXl2OHVjSXplc2w2TmRjcFJ1UnBB?=
 =?utf-8?B?Zm9YRkxBZmllYVA2Slg1YU1XZndYNXUvMUx1THVLUzZxc0FpMkJHQk5obWVs?=
 =?utf-8?B?bkttSkhwVXlzU2RPZXVOQnJFZmExSlpXcXlDbDJDYTlsSWpGM09xSkJVT0kw?=
 =?utf-8?B?Mm1rVHpzVFRudXFkTkU3SkU5d280YzhER1lIdGxNb3lzSlhrN21USHlDZGZz?=
 =?utf-8?B?bE5acFE0OHlmeVd6VERzZWVBQk9PbFNrZjFvQ1RLeTk2UVNvaE5seU4rUjZZ?=
 =?utf-8?B?Qmtob2tnMUpSY0ZNNm9PdFo0ZTQyNmR2QXhFN3FFVUdWdUoyT0ZqdnBUMlJJ?=
 =?utf-8?B?NUI1Z2J5TEFBNmRRaXhjeTJZVElqL3J0UGtaQ1dnS2VvZTZLK3NLYUdrQjRh?=
 =?utf-8?B?c0hJQkJrY2padHdYRTlpbDVQU3BJSlZSQmpKTE9OYXhVK2xmZkpBNFVJTm0y?=
 =?utf-8?B?RlpGUnhYWjc5Kzl3bG92bDhmaEFoNysrQ1gwQi80OS95VU53MU80WnlmZXBx?=
 =?utf-8?B?alFqNXphamFxWmxMdmk4NXM5REZNRVJ6SW9uMVVvNEUya0U5ajJBSlQxbmNI?=
 =?utf-8?B?bTE4QS9yZmRIYzdFMVJQWlQzOGI1Q3J0VW9BVlNCQXRoaEFGeHVXQS9vQXRy?=
 =?utf-8?B?TWF3RnBPbmJtai84aGkzd2V6Q25wZ0o5ZTJDdktZSUxET2R5ZHVrYm1VbGFp?=
 =?utf-8?B?N1dsczJ4RkFxWjRjQnBsak9jdThXOGkrUXpmUmJtbStIeWIrVmZnTEUxSmZt?=
 =?utf-8?B?K0Q3WUlETVc2VTREU0pjLzNZVk1EVDFiUHZoNFE3a1N1endrb1BhSzd6ZnhH?=
 =?utf-8?B?R3BYd3ZyQWQxNGVxOERaemwxSGRXUDBtR0tuNHdYMGNxUXljRmFYcGFJa0Rw?=
 =?utf-8?B?WG5FSzVhTW5VOVVvcUJaTFRBY2V4aWJYalN5aExPL3hzNjVJRzNrMTFyR2xo?=
 =?utf-8?B?Y1M0N25GSG5EWVlvOWtmVjdPQTlYalViaG45YlU2SS8zSFQ4OW45cCswQVpT?=
 =?utf-8?B?M1hzUGhUTVRMbmpTR2pGVnpIamg4ZDNwN1U5OWZ3YVVSY0FlelhmVUwxVGxG?=
 =?utf-8?B?WmIzSHF2M3dFMWg2VW9zQkZKdVplUWpTK1M0UGtySmlJZWdzN3E3WldWTDJS?=
 =?utf-8?B?UVptTkQ1VEJvZ1RGT2xpcVEwVUNsOGQxNUpZNS9JU3huUDhlOHdnNklWbVk4?=
 =?utf-8?B?WmxpYURRSDFacjlBTGFZUGRQY2xhVFcwSjA2NTJERkk3OFpJQmt6QUpKL3ZN?=
 =?utf-8?B?M1N3eFQ1bEhISys2V05rSGNKVmRLSXc3RzZqWGVlT0dTdHY1MURDWkJSU2tK?=
 =?utf-8?B?aWtIZFk2VjhTOThUenQrVUMydWFzRkRXMWRlQ2FoLzlDaEd3NjdIQ21JZmFC?=
 =?utf-8?B?K25BRWR1d09UN084cGJjeXJpNnlnMGY0VHV5Q3NvUG9sM1ZpbTZCVXU4M2RJ?=
 =?utf-8?B?bi9RamVhQy9YNncwdHpNcGZYMW0rNDhlYi9rYTVQQUVZSFJHYUt0THZOY3Nk?=
 =?utf-8?B?MWpUK3cyK2c2Zm9XWkJZaGJPRVNYRUtjajlnTkZWcFpkUzFyWlB4MDJIRTJE?=
 =?utf-8?B?TmFiUVJXWkg5Y0ZQVU15em5ELzZnckhtMnVpY3dKMmNCQlZieDY4aEMyTFo5?=
 =?utf-8?B?L0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWhBOHU2djF6djZKOWQwYk9ObnVXQy9GMVhQWnVaMFVXTGtXdGllbGV4ejha?=
 =?utf-8?B?UVlGdjdDL0lTQjRXNmJtb0I4bk8wNFMyQml5MDVlRGN2WDB2ZG5xbVVyWlV5?=
 =?utf-8?B?V1dnWFJ0S09RbGc2eGY1d3E1ZGw0eTVOd1grb29hWVBaY25seVp0YisrcmZq?=
 =?utf-8?B?dVp4NEFLVkwwSDBKMUNPV1BWR3lNN2puQm94VmNhTUpxK2p1RkFNZUNBbzhB?=
 =?utf-8?B?djg4aXM2QXl0WWp1Q0FUdkFnQzNQbWJvaWkvTUF5WDFSV21NU1NmOXFtcjFo?=
 =?utf-8?B?RTJGU2gxZFRZZVQvVVowa0UySXJFaXRmWUlySFhBTGdMTTEvV01jUXRibW1T?=
 =?utf-8?B?dmJNK3hySURNbFlFTDBSWWxyQzRheGRtVGszeEJFV3VENnZuY3phUXQyMndD?=
 =?utf-8?B?aWxLa0RIck11eUNOamphMVJ2MFRQbzhGTjFFOFZuOFZFNUg5UXc3b2swNU9s?=
 =?utf-8?B?TUxDcWVhVVRab1AvTGh3VlFwTzBKTGd0SUU0UmduZTAxOHZBNU81WFlwWTFD?=
 =?utf-8?B?ZU5LZzZ5VzltNFJoaDgrZWlrQ3pENWh6ZjFFN096UXlrRUN1M21LMnQ5NGVw?=
 =?utf-8?B?VnJYQjRIaFh3M1dONDY5NkdNbm5WMmxJcUsxUEtVWDZWenNDZml4Vk9RYk0r?=
 =?utf-8?B?eEE1TkkvSEVTWnlFekNXb2JscG9kYTdQRzNTUGZLRW1ScVJreDBSVXJ0aWlH?=
 =?utf-8?B?dnJMTDFFWG5SOERuNUJvZHQ5SFNmeGNkUlowYlpkOGY5cElIdEUxK2g4bmNT?=
 =?utf-8?B?QVhZdHgvUmFYMncwdk5JMDhsWkh5TWw3UDFDb2ZEdllnZXFtOHgrQkNYREFP?=
 =?utf-8?B?cnZyYVhZNDdFajc3M2p5bnJSZW5mWDQ0Qll4Zm5VaDZzRnJLMWhFQmk5N2xG?=
 =?utf-8?B?Zm9qUFhRN2FyK0hmYk5Id3Z1NGE5VHVXYTFJUy9lYW1EM2lmbWQxaGJUNzdI?=
 =?utf-8?B?eW00ZGJabTlScXZmeFR4M0lRTHFpMVdxdXhiS2NGVnQ4TDAxN2FUWWY0dkto?=
 =?utf-8?B?cnljeDNYRTV1Q1FVSGJvclZwTStJYW1NKzBXUGNldDgxUzJYTVR3UFI4Q0Vo?=
 =?utf-8?B?d29qOE5PUWQwRk9zUjN3M3JXM1E1a1Rvb1JOK2sycmludnVjenV2VlZtNWlN?=
 =?utf-8?B?WmN1ZlV2Ui9xQS8wQWtCaXQrRkpTZzJMSms2aTVpQWN5WXhHWkNjb0xCajRV?=
 =?utf-8?B?aDNaRWRIYWEzZ0dHWUtlbmFMRWNFTkk5SDJRbFdydlJWRFkvK2lCVXREWHNQ?=
 =?utf-8?B?aEhWcGZuckVZMjBDOXBHeG1BWkVsY0tEL1lTWUIxRXNRcHZjbVZTbEFEZVBJ?=
 =?utf-8?B?UWZrUXYxVWFhNjdISHFpYVBVNmhCK1gvcHdFUWdnakhLZExYWXVuVDZUdGdk?=
 =?utf-8?B?NkF4b1dWZUw1anZSK2xmOXMwMjlJbTVKcC9MNEJpU2JxS0plUFdzQ3BVcEpC?=
 =?utf-8?B?TWtNb3g0aXJkZklIbFBOUWR4dFNlVUVoNk5FK0JBQnF1RVJtRW1YNDc2bWdp?=
 =?utf-8?B?NFgxZXkrbEIyaEJ0aWQrc0NiMHFYVzhpSzBJc3NaM2ZQcjl2Z1lmK0dxeVFo?=
 =?utf-8?B?ZHdCQVI4YUNXYzB5ZDhaR1NjMHp2UlRZTWlibThUbGxVYWhuejZBSnhMTW9M?=
 =?utf-8?B?cCtiVTJjN3FhOGIrRWNyS2wzdFFQR2YyV0xvWXBvWkllUFN2TkJRVmwydmt1?=
 =?utf-8?B?NkM1UUdSeVF3UXZRVmxMZkdMWExvUlp4VEFNUWEwSUNlcE4vVHdwKzlkQ1BQ?=
 =?utf-8?B?bm96eXEzcE9SL2VqU2lrNEJ2UkFDUDNvUkFnamlCQjRMclR6MHNQNVMrdFpk?=
 =?utf-8?B?Z2kyWHgreVA4RmdkR2hrNm9BRW5jN0MwdC9iM0p5RE92ZTVNM2hLUVFtMm96?=
 =?utf-8?B?cEN0WEtWOGl1VHY5NjJibSsybnhaemg0S3NKby9WRm4zT3UrL1puMGdzejhN?=
 =?utf-8?B?TjFCTEdVVUZRaHlPaVBHRFNXWGFpVXdLS2FiZGpyVC9BdzhMTk96dlYxck8v?=
 =?utf-8?B?M3hUSTdaTkkyaHF1dUFqNGNDTzBSTHNEdlQ3bGdPUkhyM2FFWlBXVGFCaE5Z?=
 =?utf-8?B?b2JYRHQvWWlrR2ZOa2FXWlpEdlUrRGFGWFZydUpkTkQ0d3k5YnEvaHppNE5x?=
 =?utf-8?B?ZzZaNVQ0ZThqenNRdk9zczRKa09sakhLNVdZZFNTWGgxQkZ6T05ETDRMaEY0?=
 =?utf-8?B?c2xiZ0d2cmNCUDhrWFJOVnFPNFh5aWI2SDBGUHVGdy9LeFowc0c2eHFWSDFJ?=
 =?utf-8?B?TXo4YWZmZXluaGk3bUtTU2lKNGc0Y05LbEN0bHhtYjZqWVRPaG55OG8zVWxz?=
 =?utf-8?Q?QjAngc+lInXudE7zbj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83a5719-8f57-4dd9-021d-08de58ce6474
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:21:00.6398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bra59grin7YIMmP/yPIE6r8GXoxLUg/9io6vkUo7zj2o1bQkSTgswc2VAGJW0vpa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 7B5BF5443B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 15:07, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> dma-buf invalidation is performed asynchronously by hardware, so VFIO must
> wait until all affected objects have been fully invalidated.
> 
> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Please also keep in mind that the while this wait for all fences for correctness you also need to keep the mapping valid until dma_buf_unmap_attachment() was called.

In other words you can only redirect the DMA-addresses previously given out into nirvana (or a dummy memory or similar), but you still need to avoid re-using them for something else.

Regards,
Christian.

> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d4d0f7d08c53..33bc6a1909dd 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -321,6 +321,9 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  			dma_resv_lock(priv->dmabuf->resv, NULL);
>  			priv->revoked = revoked;
>  			dma_buf_move_notify(priv->dmabuf);
> +			dma_resv_wait_timeout(priv->dmabuf->resv,
> +					      DMA_RESV_USAGE_KERNEL, false,
> +					      MAX_SCHEDULE_TIMEOUT);
>  			dma_resv_unlock(priv->dmabuf->resv);
>  		}
>  		fput(priv->dmabuf->file);
> @@ -342,6 +345,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  		priv->vdev = NULL;
>  		priv->revoked = true;
>  		dma_buf_move_notify(priv->dmabuf);
> +		dma_resv_wait_timeout(priv->dmabuf->resv, DMA_RESV_USAGE_KERNEL,
> +				      false, MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(priv->dmabuf->resv);
>  		vfio_device_put_registration(&vdev->vdev);
>  		fput(priv->dmabuf->file);
> 

