Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D0B91127
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B025610E46E;
	Mon, 22 Sep 2025 12:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CsI0w5Vr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011004.outbound.protection.outlook.com
 [40.93.194.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CC910E44F;
 Mon, 22 Sep 2025 12:12:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ylk3FE9a+/NnaBZkx8VnMVpnTiR8e7R+4omqBhDSl47R9HFJjQVyAHdjpXYAho/EHfiYlp9h5gP6HQ5ofEEXFo6R2AiT8KQv7VCIfZXpOpxau0GbIWDwNMoVT5us12e963clT6X8HWP6PtKJcT3p3/cHLNUFTjiz8z/JVfzPa/s3Y7wW+Q+rtmwChJvUGtQlz3nCttgnE7dgEVRkie3VEl3rMIwT3fhp5ttLXIkGNaoXgO+8tyFUz/7L0r2t6eZdTyZ6+mCyBwBSyLv70GaTT3Zg2XVrJmjbjsyhqgg9vIoax5Btd5B6LJL8wED+/A5VG1CYPrZ+Kk2fmezAlRfnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNEsY4KOZ75LE/sjiydMsdtf0jX/fF9Zo4KP585mhe8=;
 b=PG7RXL2CLQh8dijoM5D2+87pzUPOBIf4BmX/KdrqSo3oLr3Fvc9zEtFE5Ia78CA7Et/I6bABYQcqvMTWRV2fwtUzZtzi41K5tW9iPeIsx8st0ejCOk+cZ0MBHtRuNc02DRTTzTqqeZq+kF07Dav8OY4DC1v/h09DMgmI3ZqXCX2/MLKAqmNtuezD/YbVwo4cnw03MBriMrbS2xgGoWw6yXgcCeppHysZCR/RvbezSgs0R56mgv2fGi+bdufr9gUZIOCaWFBdao2h6FLxB69jFDRh2s+JxQJhAvHFB9ye+onGDhJ8ePQQkhh8Gdng7lT4lkSf2ec5eQ2F7ZKm3SHf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNEsY4KOZ75LE/sjiydMsdtf0jX/fF9Zo4KP585mhe8=;
 b=CsI0w5VrQHZiJ7zs5/NhPUbblOPMus+riEcPhpdaP3cy1mwXQ2VenbYzN6Ft9GEyU/kzazxpVje5EAH/cCBMEj3lu8ReJv39I2O8OguXWmTLCTDm0JezStp5cF2T+09mNTG465cZ/rY1V/7sOB3QtPV7Cz6gKKTvdZOCtfdbUbR6Gw4fRqJZXgX6+hcFepHqYsmPP40q5a5kyK2d/PS8oavDbpSgX961+oPRvpMnwWOMTSdZ3KFjA5qUPLWuyIMWRXGgmJ34Njf89V4oaBbWxk58BIXsbE2PgIVatFpgJYSc0vpwZn666wV+ZHEaSDdmH/ZXE2Zm2voPss42uwjn0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 12:12:55 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 12:12:55 +0000
Date: Mon, 22 Sep 2025 09:12:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250922121253.GT1391379@nvidia.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: a248f923-7cc7-4198-1338-08ddf9d15c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q6sK7U/mwSjcrfPIcCfYJvPjZFWl6dLjNNPywvh3yNbNM1R+bIEQ2oKazbEA?=
 =?us-ascii?Q?j9ZZJFmkgENEFhpkIW0c94CyKFPgRflJjTtuLnEIY4i/Zr071xYSdGgJXYhm?=
 =?us-ascii?Q?Ojxe+b8yNiW39fF9iqhSJ8qK5m4qT6q6MBFXZ4i/tbmF4TZJotsKn5Zv2+YB?=
 =?us-ascii?Q?FNh0G5gYpS/hHrBqNxT80/uIpUoZDuB+6sYuBBBO3u4qDDrv4uIScaM0pSzZ?=
 =?us-ascii?Q?Cr2sm8QsRkKlyuJPilpjIdHqdmvPVMFFh/C3x2ZMCGasjrTZnSCfhwkL6kKQ?=
 =?us-ascii?Q?gDk1VBvR6Hhjbfn/stHdu6DdqcR0lK6I3MwVbwwQEDGsdJKaGc+1O6eCY95f?=
 =?us-ascii?Q?IqJGo9LcVxNsIyBd94am7Mq0ojmUlAWZ1PxiH5zhe5RclFSmkcY5+wqakakp?=
 =?us-ascii?Q?li9nRZhMN1ee+jEuyUFWOdVck/jsuXgymKBa3Un+tp2jdOzNRll0eJCaJUep?=
 =?us-ascii?Q?rb2aZHidhEmF63LNqcygEJTYVdaRK1VIXkeI2JNKWZY4xjg4HgipGMObEe5r?=
 =?us-ascii?Q?3yLULmYhLbigScKPnvCRPndDd3iL2x3eIGe8QeJecBLU5VmHq2MFkFVoSVSZ?=
 =?us-ascii?Q?0lL09hcKq001P+Uibl/qp6rpRse62CcQO5GKQbjdQJZTK/UPzuKGYUHrW9ZR?=
 =?us-ascii?Q?zi66xZjfDIcQaa2AdRWA94jIQOJZnNPHC+qEa2vnycGmAYYwlYMr8GLGRfGb?=
 =?us-ascii?Q?/0zREr/bHmokmkEbvU2XXQo8RvyEhmJrgYBTOsckzvXBP2tDcOnu3+a6xKM+?=
 =?us-ascii?Q?YwjCQbD+b2jswURNnveuYbVjTSkMpyPMi+SxM0rPGV4VKIJsbvfm/SnaVM0v?=
 =?us-ascii?Q?0Abcfi9RA0jbv7fo6ZeCriUJAi2N9xqdjo74N0QSLN5HRjgdLqtxOZmDOzh/?=
 =?us-ascii?Q?GsFaJOZzzpkTBRqvF5FLhZGuamEE0u9oCsNSBRyA6En5le75LBDnFHmQTUwT?=
 =?us-ascii?Q?VoAUQtFv6/yms92yA45WXkcowqvZrcuxBgRV5SVed56XKg0o9D8Z1HB6s2jY?=
 =?us-ascii?Q?qE5zKvmMyoq+ua2qzkQTRCKUuxbikobNF3dIKJo7KbxLzKeFu6R7pvy0KFsC?=
 =?us-ascii?Q?1sP4oVE1lsYu0ddPoJdpN7IpWdrN1djOrc/CSe3hwMyteLq50ePEVM+Nvdwd?=
 =?us-ascii?Q?q6I7ghfsMWQBlYpVl+x9l5YS/JY9hjarc7xGqjjKq010lHUiU6seC2FkrE2S?=
 =?us-ascii?Q?Qdc1en/bdhYqw6kCOwVsztjtaVWdMJqzQCXTixfep90kLDtqPlpVhT6cmuqv?=
 =?us-ascii?Q?GRFw/4gXGhE7CS7dbfmA0Kku2rj22ZKH5iRtF2M3bQ7PLbsrDAB/aHdoi+AP?=
 =?us-ascii?Q?vmysz6xXi96+NB/zctTQwVokikX/J+BCwdohCYlhI8SJcyjXbRujrpAwAFq+?=
 =?us-ascii?Q?Ck/srbAWHa52n88h29ou16WhTM6fhkQ5uNxycjw9eMRb6lN7M5g1YG0I5TSQ?=
 =?us-ascii?Q?DUN9/6k6koI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sx/7Q+O8BK+Q74CSls3VNRNNN8j2EUnHupvrLi80DuvoYz+D6pAAWjBYlEXv?=
 =?us-ascii?Q?j18+570U6MB/mFfSAt6M6EAD4VbBwX64KLG/Z40I1T5GN3/9E/i0aMZ9/Aq1?=
 =?us-ascii?Q?FmNp0GSIGC2WNb0HlY/aaVzhVtg3humt546EFW22T6hVucSb5uy7Fv3jNHYa?=
 =?us-ascii?Q?23OFNFAo/1CzV5GvAKxTT+YKy7aUxVP/0OnMz1IMF1kNLGIFYbvkFzlFfbfG?=
 =?us-ascii?Q?s3o90lRM0fyQRArbFsCOBsxHp3ihK0fhMYH3o+sJIyvezG9r31tt+fDPphN9?=
 =?us-ascii?Q?SK/At7Y0gb7fjWNgVbjj67bANYfe+FwXxRBRepMx6raveTUZ6UJxEW4qtb4Y?=
 =?us-ascii?Q?qzjwbluMXKhH7H3p5ozodPxoRPbtYMDE1Y55cI8nJS5DWZOH1BqA0AcoTfUa?=
 =?us-ascii?Q?azSORMwJoECEnOaMBnKNvGffajh9rCG8rDk2l0D79f0dWaFdsvZ2cNoULGvi?=
 =?us-ascii?Q?e+uquUwxm9+bqzo40yKZ1eIlEOhJdNJo6sfg5GCfvKm7SIIPoA2Y309wZzur?=
 =?us-ascii?Q?XO/VMioUI/CpIiBgWi+UaJj/yiAJDYz75j0Ap6QwgtwS7ZAVa9dlLwczEwdH?=
 =?us-ascii?Q?1LUW1sClcByDEDLYVKTLB3o3UnH6ZAjdkKjIoMV6qvtVktUfVJZHHESwWrlT?=
 =?us-ascii?Q?izL7jcAIWHeKF/MQYLmYsY2AA2px2+2+dRBpGB5AReDlQJxbjNH2REiLgYRD?=
 =?us-ascii?Q?iL0d8JETM7SZUWOvSLCezWeG6WWrj+yUs1s8U7LoyMewa4btu+9AxLnAP4VU?=
 =?us-ascii?Q?vndMRZKGJfIQGYuE1O063AOssd/6syNSX2K19iXHB/UZ6e+rnp4jkfX2DL35?=
 =?us-ascii?Q?whj4UgqRuqHTTKsnpwKCP6H5uP4Jyry8zUZR3zCJkgfZu67886xzkIY/6D7O?=
 =?us-ascii?Q?tr+ul/Qi7hGEH0ON1R+08u1cR2sd12tTnXvvuNZivrTuJ8/EyY2eHHpklxQf?=
 =?us-ascii?Q?C6Lpw/ugShvHWQ20skI+ZDGY/BnNSU2zRtP3G6Kkk9R3PHpRb7GQr4H7awBP?=
 =?us-ascii?Q?VVPMpekTE9m8Hxe2282LrV0mOxqqUkNAW3zAofH5ryeh7LR8M8yYyDafVcG3?=
 =?us-ascii?Q?rhsCucb4K1j91qwBzfAy7Bei8KS5+DLqTkF3mUm8JMlgX5uRC3wbp++GqItS?=
 =?us-ascii?Q?1zCnflunvdq7gtUTDiPEvFJWf1TVXGJiV7KQW/FWknc7HXuYa/aVQ6wBG/Kv?=
 =?us-ascii?Q?tsBkzAZBuRUWJ1BtX9I+0ncZ4iTGeA+wWG1j+nGOANXVZLGTUrcUit0eZDsP?=
 =?us-ascii?Q?wG/xWJtIAy+aSxAh0XGep1q/FG0720ruzELyI+W0OgZw30/3quZvTKR8Uzzc?=
 =?us-ascii?Q?esevzSbLZ9MQb5mUJgwCbLBW0bOCBYpOoOV15vxHvfuC/LLW4StDAreSDm9T?=
 =?us-ascii?Q?RiYUrWp7zuA4s52HR3s6hVfm1+byKqJqkXyQX7TctkdDnpXIcDG1hGUXor/N?=
 =?us-ascii?Q?XFAZSPkjVZ4/MzfDSYTHpYqGl442GT4OkTDUMd3QXLlNvURDFltBH8lEiR8V?=
 =?us-ascii?Q?BffIdQloIo5cf23aDFQP7kFaHoLtZCuEGK7PTVsncDeEt6sKyeskvKlnIUfl?=
 =?us-ascii?Q?Efy3ygHSQd2Vxhy7RJY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a248f923-7cc7-4198-1338-08ddf9d15c61
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 12:12:55.1488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDqCYtRxv+zsXpWh6Es3dZx4NcKAOSKot4zqBOc3ko7sB8xSod1ul6/9ijxXjGY5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787
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

On Mon, Sep 22, 2025 at 06:59:10AM +0000, Kasireddy, Vivek wrote:

> > You can't translate a dma_addr_t to anything in the Xe PF driver
> > anyhow, once it goes through the IOMMU the necessary information is lost.
> Well, I already tested this path (via IOMMU, with your earlier vfio-pci +
> dmabuf patch that used dma_map_resource() and also with Leon's latest
> version) and found that I could still do the translation in the Xe PF driver
> after first calling iommu_iova_to_phys().

I would NAK any driver doing something so hacky. You are approaching
this completely wrong to abuse things like this.

> that there are no memory copies and the CPU is not involved. And, I don't see
> any other way to do this because I don't believe the exporter can provide a
> DMA address that the importer can use directly without any translation, which
> seems unavoidable in this case.

This is sadly how dmabuf is designed, please talk to Christain to
figure out how to exchage the right kind of address.

> use-case. And, I sincerely hope that it will work, otherwise I don't see
> any viable path forward for what I am trying to do other than using this
> quirk and translation. 

You will not get a quirk.

> PCIe fabric). Isn't that one of the main ideas behind using quirks -- to
> address hardware limitations?

This is not a hardware limitation. You are using DMABUF wrong, writing
hacks into the PF driver and then trying to make up a fake ACS quirk
:(

Jason
