Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F375810C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CAA10E36F;
	Tue, 18 Jul 2023 15:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FC310E369
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:36:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Id6+wrlM6DgKHm/mdNhsf4no5a1mA2hOeuVr1DAT0zhlLJ5Jzl/yRM/HJNC8vjSGfQbmuCbO4ZLjm3lG0tyf6CTagsrqPzjgXFlYrnpjDBjb0A4fdAypvyMJrAXYDiu5kgmyzgRt6lBh1Yji1FhI/ZduDDUDJJkjobsS2AIP4W2WPXPPozAirKcTR69p9E7+RUDr8p8SFtHnhIcWY6Ylty+Pc4FBaqxxMfftwpK9gxtkxPHzCA63EQurRzBa+3knZPIVBW2XGjcsLNwypFQDR8Fk9Wp9du8qBmVdLmS2kBkB5dqNY5auFzDSlNPanADcZwl8XVYMVeZZKsmRxRZ/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svJCf61aMa71sCBEXDPhY+QQTJu+Qrm9WmtYKFFTsEc=;
 b=dULKLga4ivVh12TqiPmjFXJLuM5mA1ncsTgor41JSo9CncIA68IegUVSFx7r4zaVhSaDHTtt4i95bpnu6yozExFzp8oDqrVXtvawUXzDmKl8Rt09gjJk/TLzgKhCQIDSYmhpEqB6a+CdXt2nxiKw95QgK7Vumje0cewiUcG76JvH7NfvW6Vd0wF5QoFsTKz6vQ/meiCCruPXQUL0BAHIks/cHArhYSg8rCav5JDXCQyCpPWsKTMwc+ATKQ9kqiaAVN9zTLM86bQ7brb3jT4cSWhiU9H16dTc95aOnvGqVUjj1z1HlZqKVAgW4H00bKVjtWDB5ioWrvf33CLIi6o6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svJCf61aMa71sCBEXDPhY+QQTJu+Qrm9WmtYKFFTsEc=;
 b=cC6g2Ww4Ch5yGxUSSF0BhLbr0vKj/m+kiSm/zpHw7FYYyJ/Kk7Cx9h4FIgt0Hig/ybJPSW6RiSyE6Vd0QAZzg8w2GIJZksKhhmVLHU3ANOFk7lNR6Rnn+F+758FmwcQzl9HIrEYALG0tUIzqBDGqpEL2tbxEUX0lzH6sAUVujhi/hpQLuHxYNMh2R8nSfjVvv7+QSsWjpno3mtzabcImPRzLqGuAVNq1vkXFiSE00epzWwM3+AJEWEwfyhh7bWB7Fg+D8pMOnuIQ5zKOyOWRqOhpkqGqLS5UDhZfXYxnM5Un3mDDSpSV+gPI5OEFbH7hohptGc3pmS5xdAXUsoZlyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB8116.namprd12.prod.outlook.com (2603:10b6:a03:4ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:36:33 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:36:32 +0000
Date: Tue, 18 Jul 2023 12:36:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZLaxfmrVo7sygM3d@nvidia.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718082858.1570809-2-vivek.kasireddy@intel.com>
X-ClientProxiedBy: CH0PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:610:118::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: da510a89-77cb-496c-d3bc-08db87a4c340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UGLqvAXqnO3C9sdLYI9541W+X63vM+dBbsgikaD8+5Bpd67nHVwcpxi0OKG0lgLezQ9sf1G54MZOGOYx34dPSdhVAhTUWAcZ4lAQjcEQ9S63LCosmmjroIsn0lSW868CNC66d81bxQsAX9/P6MlFWJ3KO8n0MGtz06+L6JOdd90Fqr6pMw1nTZWtlVrym619Nx92z03kwgs4mLPmyRBsRwRcr+ldQpyIbK+ZZDXCilf/B+oPBA+lqeLxEIMQrsobGk4RUqdWQ5F2gcy6fbI+ouOlx7WaoaXvxDi8MKvoRPMreO+YS3ASLljEb1NQWMHu64nE9Z3+a6ykSKWAs6sAtNRmz9/S1HL3hG7HsM/HB86K7+J0SRyMtPa5BPfzjXK6SyAYB5CaSOMkfxqyXMUxew8S9l2EnmoTqScfaW0OuRv3i2OH8WxzjqieIauY+E+dkVKXGXiGIhDbUrs8Mcd2ovp9XTHS1+5DZQMzdf6AUraWEBfKsIjXXnIo9J9j+S10HG1GiScDiHH/GS8QIL1Fsl4u/wy1jKlII4MANFM69jn3/dURsUDIoOcX97IzN/pd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(8676002)(7416002)(41300700001)(66476007)(66946007)(6916009)(4744005)(8936002)(15650500001)(66556008)(2906002)(6512007)(6486002)(54906003)(86362001)(4326008)(5660300002)(316002)(2616005)(36756003)(38100700002)(83380400001)(6506007)(186003)(26005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TwtRCythGQxKAezAS7YKLGRsFfmNxnulsaK9e5AOF5jYCyf7KnPzQwOOBggL?=
 =?us-ascii?Q?bKaHZ7bA+aAA//IVCK4wXFRHFU0bVRZpOfY8vsVAKNPm212aVzGxpSsyBYFX?=
 =?us-ascii?Q?wAtAY2Vi67iRCGBICLB/ZkqT9sxCDkfzINN9x4OmL4M20toRYHek5AcAoltT?=
 =?us-ascii?Q?heJmhLVps1qQ9p2DU6nGaVgrqeQq+ur3GGaxyAf05BO5zkEhQnNvhgZ5DBx+?=
 =?us-ascii?Q?RV0Qy6lFD6QP7hSmotiaXsv5qkP1uL5HAMAHdTsne4z/CYW5t/zeuAMlf20x?=
 =?us-ascii?Q?CJch54YN+uI8MoEh7CCD+CEYF+dc5+wkHgL90oJXNLG7w0ux1zSHHZLrJS7o?=
 =?us-ascii?Q?LgZ0rPIU8Pw1qEDgF3yooypEH2cp0kUANhHpZ8/EVEMMaHNWktVaLIyyrENt?=
 =?us-ascii?Q?ChdIZ+k04F5sTKBUG3MFbdvyqW9RG1rHYZogyYXr5y9yCdi+HUBEiY6CsCB2?=
 =?us-ascii?Q?onlmgqHpYIvcId6t2Pwk9/yw4zcuk31+9qKTdCWPnskBVhe5hMiHIFHyfDDs?=
 =?us-ascii?Q?D6VeHRA7YccoZmdzV/3g6cyIooGUDPSd7BGXnFhfuoX6frqFgprzsC9sHlDK?=
 =?us-ascii?Q?R7II3rEbnkLqCIxsL/8BjJJFwd3x4XZ6Q/cW+BVvxZEao7y5h+5QduuTwTJ+?=
 =?us-ascii?Q?VtrwMnsdUrXAlJ0fCGHqdnhGzvdoGJRTZPt1CEp9lJTbejZNpoaO4i5wThZQ?=
 =?us-ascii?Q?LdfHIMRsOSM9xgvFSLOzCKUqLXCdVUEsEqKtWZymGO9nBiz9CRz04TZTgw/I?=
 =?us-ascii?Q?hzR0+4Nw8QbOnOwzfZlFN1gSKLFPnUnA20y39ArFoZWW9cWEzyeD3ZOMFMiZ?=
 =?us-ascii?Q?OpixK1FwLgUDdyjmg3LZVbbnXF5ta0J6pLTrwuFGl9uer6q+zyqeFDhZETGb?=
 =?us-ascii?Q?grdnCqbA71DcZm62fE8yEKvzZBndLsQjp6DCD8L5ftjFlOA8Ya+A9XcJTt4e?=
 =?us-ascii?Q?ahn+zEX9bqePRVcd1lPyZDJ1PQV/1aRoUx9w4yXG4F9zocMkwFYHr15rNg2S?=
 =?us-ascii?Q?vCSTF7jOi0G/ocDjZekm2O449gx4bilu2cFwxRoHmSqYTI8xhD9dV8yb82DO?=
 =?us-ascii?Q?t/jkKRsUasbuEeqlAtAIN7iAOYU5B9OMjJwXpDV2oDBRdcWkW3gd+XUz2buj?=
 =?us-ascii?Q?/0DG+FwNCwpxjlN2J68Voy4KSWcpWUBoCcynifOMBBRFB16G9J7jeefMiiaP?=
 =?us-ascii?Q?J3N/xzV18Jpb5ivJ5HkwZ03zasGMfjWvpYfzqJ3N339XhdFO3OnpR3okLwwe?=
 =?us-ascii?Q?JxYqySZtlcbOeDku69lAoS/9ntyqtx+uOUE5hZMyrY7azwyV9Kx6hI5MGUP9?=
 =?us-ascii?Q?THMbCe0bwN9dFVd7xE+3+VyLX18ncUMBkFpr7GooFaX+ihqDkfXQED7H9grM?=
 =?us-ascii?Q?+hJJqPJL+egTxmUfCO4L49/Q7NHcLKkvrHsx3cWKU7EjYG5NRk9fWufXz7i0?=
 =?us-ascii?Q?EHjMu6xT0vkMuzCRyl7ab+opUVZpmfhzAVC1Xp3nTOovGRogXk4ikFv0Dq+2?=
 =?us-ascii?Q?dXMwebknCl5HGKOMHnEFbVyApJN/79ZxkIXndgBzU/JYYso4tWjQPcnJGRG5?=
 =?us-ascii?Q?NmJaMtb9I+bZIrKEnIPkESAyD7ZNLekufFDA4beB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da510a89-77cb-496c-d3bc-08db87a4c340
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:36:32.5358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APNrwE9bMQvOurf+Zmg78gEuR29HZ62gwD/CziTzCujs4jZ0AEpQWuEVl1xc1GOw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8116
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 01:28:56AM -0700, Vivek Kasireddy wrote:
> Currently, there does not appear to be any mechanism for letting
> drivers or other kernel entities know about updates made in a
> mapping particularly when a new page is faulted in. Providing
> notifications for such situations is really useful when using
> memfds backed by ram-based filesystems such as shmem or hugetlbfs
> that also allow FALLOC_FL_PUNCH_HOLE.

Huh? You get an invalidate when this happens and the address becomes
non-present.

> More specifically, when a hole is punched in a memfd (that is
> backed by shmem or hugetlbfs), a driver can register for
> notifications associated with range invalidations. However, it
> would also be useful to have notifications when new pages are
> faulted in as a result of writes made to the mapping region that
> overlaps with a previously punched hole.

If there is no change to the PTEs then it is hard to see why this
would be part of a mmu_notifier.

Jason
