Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A35887E2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2548510FD9B;
	Wed,  3 Aug 2022 07:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A19E18A388
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 09:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlCKfZY8lLsI/k1DA4ldja3g8FCRMqqewV+uzFf7mfA13h83oeROB2TSB82dDwPlH72Scb4IOQD17Jsg/KpzF3J2Ey6+wtXId6qtCj7RbcOZHitpACs8831JD0KFBwZq4X2az1RTcFEEU0JNlNXqmotXDgHasTMHMuw6hQMuHQzhFXQs3QU8G0+tYZ2ugmHEI2d8r7LLd6DPzEvYeMVvvFOkuN09RxBCYI2w6DGD4rsubMVSa7Ugxc76UjW/YAe7agekHVUO3rm7E+E6k07y3Bt9iCC0Y/wuNEVhVHLVTQt77/KIWU3X9+LrVhLAgvqJ5vbzx0iZk0prI3d7O0Nmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IC3i+47QLyTkEmEDsivk+ga+Jtsr9YcwutujgYCa7Xw=;
 b=EHhq3moZL0tbaGBrV72hUtY5z6LFQ7ijYLhHGxZ5pLBnBZLw6JezQ08Sq5IYOmRsgQ7upEsy1z6regdwpmCX4PMXvowe4zTglby65Xc8LINoBtSQm3mAVd8Y5hDketlQK+HAzfsPoByUSIvXEZLfOqVSXZ8gTPPGlfsfBYW/j+WrPnsoW/uDk68YbDyY4acQEtd8ub7iefFcQFArqmSTaXjpvdrgP+kgoJUsLipXK94U+etzlbcxgquNfn7bl/IXeHAx2AbHXe7Ozm9LKcz4HnWS2al2uGJkXlAKrTqEw3rLMrA61tn3qxgKQhNwiSnULPSLAkX1+ttGeyCmzxZwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC3i+47QLyTkEmEDsivk+ga+Jtsr9YcwutujgYCa7Xw=;
 b=onKfxLNcOIcrPZf+TVW44NAyNkh55sOl0EGIfYsO3jLgL4j7CC21OoyIHoBVFxzTY8sk6JmfH/6MA0rfW3WX/PQq7Bjoez/jzaWFghR7aKtb0GVTp506qkuvK5ISFcrWO3r0/1jAq0hZ3nCleT53a6Zw2i3dSaaA7o9gV77pMuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com (2603:10a6:208:176::18)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 09:58:49 +0000
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b]) by AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b%5]) with mapi id 15.20.5482.011; Tue, 2 Aug 2022
 09:58:49 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Add dma-buf secure-heap
Date: Tue,  2 Aug 2022 11:58:38 +0200
Message-Id: <20220802095843.14614-1-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR07CA0145.eurprd07.prod.outlook.com
 (2603:10a6:207:8::31) To AM0PR04MB6737.eurprd04.prod.outlook.com
 (2603:10a6:208:176::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d19be9f-f665-43dc-ba39-08da746d991d
X-MS-TrafficTypeDiagnostic: AS8PR04MB8341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/EHoZBcLOeabRco/Vx+mj8UuCysnKK4zHFWJJIZXI3HUXXfs3FwrDKOqR6KWpI9FdJOEo1PeVdwMf96JVa3JOUhHcdoVAbR6ipqP2DjUMGprsBh7I3BtLm5CSf2DJbZNrWjcIQB7LdP1PvsbEHXzp/gXeOVuGEemsd9951AsMgJr+XAIC7IevaGt+STYlujv6HP9SxMBOZoINSmBTCK7rd92+mvD+fuCowOWxDGkH1iaAk9sk+6IULqc9H8aLcgf7s5nQpUo1V84sAca58v0mAClDG7rdU8R0vWZI6Whb9+kZdrhTa1SevFFMAPf6FogOm3x9d9GRqk/S+RKxs9jwt6fX0WDFtZyp49F0qzon7uOGRFIdfsvQ1ATPZRkWDb9soEkJ34ZaN9AOjsG9LHaQ7RXVTYur26OfZCY0Jsg5i33DlR93zEgkjHdSFdDRZ37fl1e6ycAFm4Xh4vY+ZmjarwS9zvuLh76gVpLjGA6tKG5EJ2XnhCuU9kCDjvAxUsqtvVbDE1IpuXrqbZbA4qlTS+28Rnn2ejceIYvvujSkuB2ZQVkaSZARDEKPyFhzx56I2bAkB6ovJycwf//WJGOTHQxszWjS8naEQsimiTE7BnAdDkLVrrHyjfdKIFRdJcyWaHzFiSMAlm6rFdKW9062NMzQ2j46KV9MDu8Cogpqz2k6FVbHAKgvrFqXZhz8FSJLnXgg1wZHP9JyBP7bEFd6x8+SkgzMJvKpJfld20zeBtKcgWYhNa5qDBOx+26onAs9HHBKZ44qjbnpMIeJUq8c0mO/Hu8DC0FRBR//wR+S4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(41300700001)(2906002)(83380400001)(2616005)(86362001)(6666004)(52116002)(6506007)(44832011)(1076003)(36756003)(26005)(6512007)(38100700002)(186003)(38350700002)(6486002)(5660300002)(8676002)(66556008)(66476007)(66946007)(8936002)(478600001)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG1DSTBHM2VDMU9HUXdZNzlGY2piMkN5ZUpnQ3NCdnVYSE10TUpCVzZlejRF?=
 =?utf-8?B?TjZ3OGFlVUdsZnh5Vm5TcmFPVncwWHZPT1lMQmttczI5V1c1cE5sSm5MejZD?=
 =?utf-8?B?UklTVmVtUSsyekQ5Nm5icjJoNVNLSlVWMytNYk5kblRJNFU4UURxQUd0cnB0?=
 =?utf-8?B?ZmlMK0V5S1p5Q1VlNUNEcElyQUxxd1NVRXlDUmcxajRNVmtsdkYrQ0MwSkxQ?=
 =?utf-8?B?UXIwNjBjWkZFcS85TkVQLzJmdUtGaEJvRzB4amlSamRpN2dDeUlvMWxFLzJI?=
 =?utf-8?B?MGx4UVVpQkU3UXV4V2g5cGx4VjRwdmU1ZGxZb2Z4OGpNK1Zmc3Y0WTZoa0Vu?=
 =?utf-8?B?cm5OM0k0MkNUWWkyTHZTZnJ1ejVHN1dhSkNJNlVmeHp1bVNscm9TL1p0bjdE?=
 =?utf-8?B?eXRnbzBla3laVHd5cXF6eFgzUVpVRys5WTA2UUM1VGJxYUFSdjBCWGdBSkkw?=
 =?utf-8?B?ZXBiUnA2bHNMclQ0dkpKZ3Nlbjh2R0ZkS0dlY2NSOVkraFBpZW1oQkcyRHhj?=
 =?utf-8?B?M3dkM2NsSEdIK1gzVXNkNGNnbWF4bTlxS2tCbGY5eEt4ZmVtbVZVQ0hUaElj?=
 =?utf-8?B?S0RKWTZ6R2VrK2x5dXlWNUN4TXRuRVV5eFpWSE81NmFYV3RMZkpSeFZnVEZG?=
 =?utf-8?B?NzJyWjg5Z0VtZ0xuMFQrNEUyeW1ycDgrck1EVTVUWGVad3dtcUdLamdHcFVr?=
 =?utf-8?B?K3JraHF5UGRLWmtDZkEvbEJ4SlBrKzRLMVZsOXZiQTU0dnZMMTFzQVkxM205?=
 =?utf-8?B?TzAvRzQyU0svRk44Y2RrWVJrKzdFcDN0UjM0M2hONnBXV3hVbG1YMFppeGpP?=
 =?utf-8?B?L0hmZ0d5bXJnVzNxQlZpSVg1dFpsMTFjOFNJc1hTY2R3OFg2QTBYQUZhWi8r?=
 =?utf-8?B?bkpGN01zQncrb0E4WUZsQjFqbUs3SzFWeE0xcFJiRi9lbWtoQmZyNWxDUkF6?=
 =?utf-8?B?eTE5dTZQRW9FQmJGcFNHSVphNGZjZnZLTWdqN3BRZFpHVUcrR29sbDFzSSsr?=
 =?utf-8?B?LzFCM3A5QUVTbDZmeVhHVGFYcFN5VVFNam5JMWwvVjZRYUVtMVdqTE1SUjhl?=
 =?utf-8?B?cGw5ZXlJZDZhYUwwR0NDeE1lQm1mZjhobndYOFVieGZKTUovMCtFSDY4NkNp?=
 =?utf-8?B?Vk81a3k2VHlHWUtaNjl3M2pnV2pQcGpKWUwvOEM2YVk3N3h5YTU3WHFaa3Vo?=
 =?utf-8?B?M1lyU2pCQ2RpY1lXaytKUUZYSjZ6RGd6a0IzNnk5b2lLaElkZldCTDJDdkJp?=
 =?utf-8?B?QU42L1pkMlFLaEF5YWEvY29xZy82c2VMRkwxeEdiNms1MFdWZGR3dlhWWmht?=
 =?utf-8?B?OEJrbXlpcEdYamRqcjFoQkxCZ2hGcmxuWHd6OVFoV1lVTTZZVmI2VVhmdVJ0?=
 =?utf-8?B?cm9vRUFpZVNPSURFYUdxMUZVNHRwSUN0ZzFWUE92Wnk4b1J3WXFkN211dmNr?=
 =?utf-8?B?ekt1VFRKUytMK3B6QUcxdlpZdklPRUpaTEdhN0dOM0JHSkFtUzNlYTJibVhp?=
 =?utf-8?B?eHgvL3JZR01KL0VNakswZ2kvWmUzRXgwZWVNMjJYcklnMmFtL0lsazMyWlhW?=
 =?utf-8?B?RkZqMjduakVMS3p1a0FZWE9CVUFqUGxHZTBkaXN4Z251Z3hZaFFjazlCOGhv?=
 =?utf-8?B?NkxmdEkzT2JVc1lhQmRjaW90Njd6ZVk1UVFFV0FFOE1senhGd211Vi9NUU5G?=
 =?utf-8?B?M0RtNDA0Lzdya3JlYnpsY2lRMVFna1VieDFkRTVqOHQ4RUdNdEhLUUxIR1BO?=
 =?utf-8?B?ekZqRGxDU1E0Q2E0QUNobEt2R0tmb1p5dGVqWTc0M3B4SlM4N2dpR2wyZHV2?=
 =?utf-8?B?TWk0OFBINTJGTjkwRmdoZ01pcnVwd3IrMy8vK1NNckxNVFNoZWVLTEI0VnFp?=
 =?utf-8?B?alFNS1lKN1FicmJudGI1Uk5UWVgzb2ttVVNsRjBuK004WUpsOHNzQ3BwYVU5?=
 =?utf-8?B?L3EyTzc1aVBzRDJUemFDaVNkVzBjK21GR25ab3dqeUFhVTlOSUttK3ZzTVcr?=
 =?utf-8?B?anRIc1ZoUHlSdTkxb1NmUTN1WXB2YWxzWitGeE5NRjRyWjY5QXo5ZFNtK3Ry?=
 =?utf-8?B?RlBuQTdzYjVkYjlJMVp2WEl4L1FCRWQ2MGgzLzh1VWVVc2dBQlNDQVJuMFI2?=
 =?utf-8?Q?oShLhY7HYXreNhdsiKg+aVFQF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d19be9f-f665-43dc-ba39-08da746d991d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 09:58:49.7497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hju/VEE5Tz0V1l5wLE7n3jfJd2XIFBOzTgV0QLLEQTkRVa1yFJArCWdWei5Ue14o53gKVvaWyAPzoDVCuY13xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:21:27 +0000
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
Cc: clement.faure@nxp.com, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Purpose of these patches is to add a new dma-buf heap: linaro,secure-heap
Linaro OPTEE OS Secure Data Path feature is relying on a reserved memory
defined at Linux Kernel level and OPTEE OS level.
From Linux Kernel side, heap management is using dma-buf heaps interface.

John Stultz (2):
  ANDROID: dma-buf: heaps: Add deferred-free-helper library code
  ANDROID: dma-buf: heaps: Add a shrinker controlled page pool

Olivier Masse (3):
  dma-buf: heaps: add Linaro secure dmabuf heap support
  dt-bindings: reserved-memory: add linaro,secure-heap
  plat-hikey: Add linaro,secure-heap compatible

 .../reserved-memory/linaro,secure-heap.yaml   |  56 ++
 .../arm64/boot/dts/hisilicon/hi6220-hikey.dts |  11 +
 arch/arm64/configs/defconfig                  |   4 +
 drivers/dma-buf/heaps/Kconfig                 |  19 +
 drivers/dma-buf/heaps/Makefile                |   3 +
 drivers/dma-buf/heaps/deferred-free-helper.c  | 136 ++++
 drivers/dma-buf/heaps/deferred-free-helper.h  |  63 ++
 drivers/dma-buf/heaps/page_pool.c             | 246 ++++++++
 drivers/dma-buf/heaps/page_pool.h             |  55 ++
 drivers/dma-buf/heaps/secure_heap.c           | 588 ++++++++++++++++++
 10 files changed, 1181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,secure-heap.yaml
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h
 create mode 100644 drivers/dma-buf/heaps/page_pool.c
 create mode 100644 drivers/dma-buf/heaps/page_pool.h
 create mode 100644 drivers/dma-buf/heaps/secure_heap.c

-- 
2.25.0

