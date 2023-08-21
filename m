Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D51E78269D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 11:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8541B10E21F;
	Mon, 21 Aug 2023 09:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E667110E221
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 09:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXyLZDJrwgw5AH42b71/svzb444gC7dLsZxkdkpByX+p7ahr5LGZ5J/1+mmZGgfFCUp7erwqkexB4ln2jAeTZ2w7lhAL40QD4nQSFeKxI8Nij7naGDKrpB0LzdI16QQPrL6yM14tDiRDUxx6pMdp3MXjPdTsQSq69h82h9Ra3omNgXhp0FlOs+MFv/MCFwsCoOmqAWjsghUirQp3M2nAeuXrt8aXVmpUvQn/cLaj1MtU/2CVzaVc6PQedcYtOo5Izpochg9VaKnOdvsnFzBn7Q+ysqV5HH0/hllvE0VT8UYpSqJbrlcbYmQST2CPRzHWRDNOCBHUoL9qoI6DgffqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FuPL7FmuIQgEDPkCDqfM1Ni9PxwH61leV+wFWQGML4=;
 b=KJptosJbEI0D16hpk0zplxwYzmGs7W7gXWnt+Tv6aEWYlN7+LMMb45jKY79DNXHH/UX4PN4AB6Nle06OfUpqz+kTwwgXC/IZ14ubcr79fI6f1MUwDMPdC7ZcHGxU032tKhJwGVkVI4VU3zNi7OKqZEF2iMJLiET5tXHotdC26Smk/QB+8xhjLqPCf7lYYCxH0XXEGGPVRb6rM1jMAZHGcsbS5fCt1DUnfLE4nOS/oLL5BwblAf1X9b+YXss1A8GcozNKCraexGuk33dtHdrvhbfG4xEgwCiWlgPFZ3IYat8T41fr6v2zlPL0dFA6E5zyaEWXQNLmJit+32kyoZVeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FuPL7FmuIQgEDPkCDqfM1Ni9PxwH61leV+wFWQGML4=;
 b=IQ+/wfbF+pvOA8S0FnVvKJZ2sglfCHPENsfKDr1ZsBx2D+qVJeH0/dyZI2/9CxG9jxZNnuCiE0vrrOAwJrY25/8XnIluSQmclF8H8Pve9i4noNO1SXzvSwJ7eBFdKi0VxbdBvZvT7X8m4ExRxk11m0M0WE1WUsbM0Zag0HKKIrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by SN4PR03MB6734.namprd03.prod.outlook.com (2603:10b6:806:1ee::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 09:55:58 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 09:55:58 +0000
Message-ID: <242cf022-503d-553a-8b78-f0abdb58d374@synaptics.com>
Date: Mon, 21 Aug 2023 17:55:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Hsia-Jun Li <Randy.Li@synaptics.com>
Subject: [PATCH] dma-buf/heaps: map CMA all pages for user
Content-Language: en-GB
To: linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0197.namprd05.prod.outlook.com
 (2603:10b6:a03:330::22) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|SN4PR03MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 198c29c1-f463-4852-34bb-08dba22cd1a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xZMuP1vzxcvyqaQFQ39jWTV2gm0RuaLV+tXm01qisvaJL/t3E5fNaDx3wCx7D2fRo76MJQpiiyGr7+UPQw8aeh0c9H5KFSyE6qPaZt6nrCFOVjTAAsqQAoxVS1RGOPQv8030S08hcHM/d8QLSp+MCn89MYFZh8zPFDM++DN2UJW6FfYKWcqgHkQW6gQMQJbOo7rGCtiFZkw4ngIQVTu6kTxAOZWmogobIlW3svXpJTTKTvie+/4OSjRg434EKJacU8IRO6OhfPaMf2+RRUrfQRdJuf70JG+NA7xzmhaMVKsIbdNbEgIFdwhR3DBEZMxqcE44KI1IYuylyGl/q9pXp9reIoP3RQfpQYdEQiUp78AWBKtG5ytfKJPhny6HqsRysK96JaJDkYnFQxWT83kOzpQGfMlYoMi9gSUaEKrTX15Jd6T6Rq8YSquiiXJz1PXeOSbAul3ZoM3Qpy8t2cIncNw9cMQpq5KTHK2Vo++PA7RTYl1Kyw50zRBCBwi2H15jP++yd1USzJjcPEll9RvbFrvHgndRt1r+ecjvRs64wO7AlWuapQEO3jE060/tqhnCKcFPXwBAyV2aBeJLBdUfmn26V/xA5wFiVx1GVcisRCzbZYSc5rZ71kc8UqTm1+hnQCbSRIrNC4wgrG+bJqydPpIi3yXLTUVIlzAu/RVvTuMu+nQBxArgY1stAbQubi/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199024)(1800799009)(186009)(86362001)(5660300002)(41300700001)(2616005)(66476007)(6916009)(316002)(66946007)(2906002)(66556008)(54906003)(7416002)(31686004)(8676002)(4326008)(8936002)(478600001)(31696002)(6666004)(6486002)(38350700002)(52116002)(6506007)(38100700002)(6512007)(26005)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0kxK0VyeUFwci9QbTRLZDhCSmNQSGtiWWhtSTJOaEkzQzZFVTZPYWh5ZVlo?=
 =?utf-8?B?YWRscTJnRElWcS9CSW0wcWEyV1ltU01nM2FLN05SZGZtc00rWU5yQTBGMmFF?=
 =?utf-8?B?akJvVzRyK0RBOTdBSXNDeWZVZ3VFNVRFZWd0RkpGQ0NialF0QUI3YUk2K2tu?=
 =?utf-8?B?RDBOZENBRjhpSUZNeVZuT0dScmdnREdHQzNWLzFGRm5WMWMzQ3ZUNGxpVHg0?=
 =?utf-8?B?R1preENJQm1pY2tiWnZKaGkvQVpMT2VxWm13QUJoY2pBTVlvSUNMQWN4TEVn?=
 =?utf-8?B?dzE5Q0dNTlFEWlEvZithcU9hRmVzclRhWnZodEI3VDZqWjhVTjlBNHFvNjhX?=
 =?utf-8?B?ellEU2JUeFF1cFRBelBMN3VTY0JNSHdJQnByek9QVG1ySG9KVXozcmNSZVp4?=
 =?utf-8?B?SnBpU2pHZlBUeGlHL3pFS0taSEdNZUk3S1VrcnQyNXVEVzZUUnAzY21HWmNM?=
 =?utf-8?B?OHNMRFZxMVZHWllRK0VuY0orWkR1MDBnRXR4ZFFsTTIwdVhhOWQyRyt6TTE2?=
 =?utf-8?B?VVh3OGdTdkdnMURDeC9GYWVvbXBUaXBWNTcrVVBIWDBTSmtYemlBNjNUNGw4?=
 =?utf-8?B?eGwwb0l1K1FCRmlOR1Z2anBmQzVqWlM3YUo4VmJMeUhmd0IvR3hseFo1Mjh2?=
 =?utf-8?B?aTFmZDBmeE1zVC9PSVBOMEFhSjZPblpBNzFwRUEyaE5ielhEQlEyMHRzSm8v?=
 =?utf-8?B?Ukp4RWs5djJITWxWWTcySCtTNWd4ak5JdWFucmFOOHEycU1UalYxZVpPN0xu?=
 =?utf-8?B?S2RaVDFCTnVOcDh3NkFna0IvQWVjSzRadWVyQi9ZRm1PMEJCb1prd0hPMWRQ?=
 =?utf-8?B?REZOL3doY0l5ZmtpNmh5TnAraUxoMHdnajRGNTVlaStVTXluVXlWVEVlNTBP?=
 =?utf-8?B?aEIvelpjQlZMa0pLcmc3V0tBdm5JNzgvNW1xS05YdldpRE9vU01Hb0VveSt1?=
 =?utf-8?B?RTZVNnZBZ1dnRU0vTzNWdG1hNVpQNy9pSmZadzUyMFBKUUVzbklZMmhpWE9h?=
 =?utf-8?B?bEpjdk4zaDRhSUxmc0d2a0M3SVZIYnljREVFYmR1U1d4Q0t6cHd6enBpNzUx?=
 =?utf-8?B?VDJ4bjlmZVFheCtkMFRWYlJ4QVQ5dGlvZUdNSUUvMzNGSHNEeCtndndFMlh4?=
 =?utf-8?B?Tm9mSHkyakhyRU9qeU5jdjZTSG9WK0tCRDdIOWpVQ0tFVFNPbzhiZXJMTmNt?=
 =?utf-8?B?TTE2VWJpZURxck1zZkFIRDJic0RneGNuQ1lFeUNXaVI3cUNzeHVEcUJ2K2hh?=
 =?utf-8?B?aklBMWN6MHdra2pRS1owUk1obzZ2bTBNdUZXeWpQZ1J3MEZqMTZqNytldm1w?=
 =?utf-8?B?UURNMG54VG5XWjNUUVdHOEgzUS8rU2NlVUtDVzNyd2EvUmZ5V3B5eUljbHJq?=
 =?utf-8?B?bGxNeVVOR09yZWQxZTdIcFJ3MjVFRi91NFRHWS9PWG9MTU1ib1lLNkxBRkRZ?=
 =?utf-8?B?VTZ5L0xXNG1ZR2puU3dhV0NjUVJTenRZNkpNbUtZUktwMno5SHlQUHNjZzhN?=
 =?utf-8?B?QW0vUWR0RXhtM2tZOFp2N3NSUDB6aE0rdkpiWVIzU3V6dmRTK29XbDR2K1Y3?=
 =?utf-8?B?WmhRUGRYclFGY25wVGJJWUE5aExqYzlEaFVBTzFYdTN3VlBPWVU2QSt6bkhz?=
 =?utf-8?B?dmxPc3BFWTcwZnFOOG5UWjdTbVNtQnhNQUpMTVBSdEhxNXBKN3FOMzhvQnNk?=
 =?utf-8?B?Z1ZyVkdwNCtwdDZEYjRjc2RKMWFvaFJhUURhM3E3SGFsT0lZNS8yVjhkZGJu?=
 =?utf-8?B?VzdNdGlZdGh1YlExeHJ3SDRPc2lmVjk0YktMT0g0bVdkTnI5dUZZcEx1NXlC?=
 =?utf-8?B?YkZqQndTSVBLZXA3MGhLTFFaUjdOeFBtdjBKeDRpL2ljeWNZTDZqN24xczVO?=
 =?utf-8?B?VjRNT3FNZm9Jbkp6VS9EaXo0b1N1OEdPZVBvc1dONUh3VzVrUTVvN21UQnJO?=
 =?utf-8?B?T0hNaTFQbmtaTTcrQmpucEtnWE1RdWdubTFtWjhoZjY5N3plMWFGS2J1NzNG?=
 =?utf-8?B?cWo4RHBYYnlIbG4zcVhuY1NmODU1Y3lGWU92M2crYlhDZTdERzRWSHFWWGc2?=
 =?utf-8?B?SmNrcy9mMUZRS2I1aExmWDNxWGRBWkd0SG0xczlWUmJwNVozYnJGNmtHRGti?=
 =?utf-8?Q?qOzV9UYMs/1HAPRKMEXpXqj74?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198c29c1-f463-4852-34bb-08dba22cd1a5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 09:55:58.4594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E34fHlxjgHQ6MhmvC/b578MZEfvdNU9adnORjoppHde8QiZPuLgLullFoxkl1H3DgdUFilMXEIQrRtMndivECg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6734
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, jstultz@google.com, christian.koenig@amd.com,
 tjmercier@google.com, Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Page fault would raise a CPU interrupt, it is not
a good idea.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
  drivers/dma-buf/heaps/cma_heap.c | 26 +++-----------------------
  1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c 
b/drivers/dma-buf/heaps/cma_heap.c
index ee899f8e6721..7d0b15ad21a7 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -160,35 +160,15 @@ static int cma_heap_dma_buf_end_cpu_access(struct 
dma_buf *dmabuf,
  	return 0;
  }
  -static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct cma_heap_buffer *buffer = vma->vm_private_data;
-
-	if (vmf->pgoff > buffer->pagecount)
-		return VM_FAULT_SIGBUS;
-
-	vmf->page = buffer->pages[vmf->pgoff];
-	get_page(vmf->page);
-
-	return 0;
-}
-
-static const struct vm_operations_struct dma_heap_vm_ops = {
-	.fault = cma_heap_vm_fault,
-};
-
  static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct 
*vma)
  {
  	struct cma_heap_buffer *buffer = dmabuf->priv;
-
  	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
  		return -EINVAL;
  -	vma->vm_ops = &dma_heap_vm_ops;
-	vma->vm_private_data = buffer;
-
-	return 0;
+	return remap_pfn_range(vma, vma->vm_start,
+			       page_to_pfn(buffer->pages[vma->vm_pgoff]),
+			       vma->vm_end - vma->vm_start, vma->vm_page_prot);
  }
   static void *cma_heap_do_vmap(struct cma_heap_buffer *buffer)
-- 
2.17.1

