Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648763D2349
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 14:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281056E820;
	Thu, 22 Jul 2021 12:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B076E820;
 Thu, 22 Jul 2021 12:23:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJ5dWGy4FbDJAKN5gyHsx4h2D0rrVHfbUlpbbjhl82SczwZ7mK47EcQSkZ91IPwHjU/AB67Ff6AWuEai4KvkL+Eb3qNR+SKHLsrIq2PwtpjXj6FDwtdMXUAvUYBXeXxO3cQBrzlHsNGkLkfGO9NJq8DQnFEfqwnFbaPOpoULUh4AzVdAcrffzS8hZDHBWeaA7y1wd5YlBr0ukGJGaMqO079IflNEiBj264o+9NHSlgy7upOV+xjJSY+azndcfDyePQggbdbcLGxKXZkPM0FbQOtgb+ZsTB3VlxQ51NPfsOplPn7wzy26v80hAk73b0qgWSCag9q5fX6Sl79X9j6S4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLakAfoZN582Um+x1ADB0s4C4IFGXPwPnDury2nEzAk=;
 b=McBuZUQ4NUYmGMrBect19oL8SrAbgY8ud5Ty1JZwDF3DriPTTrWaThLv/dPshj8CJWjrq4jd8P2lZ2ftRLuYku2QZovn8cWOv99qzlnqsNg0nXbjQnheB8xbquCoA7LyjMAe8PbT1qCwvToZlBynfydAHGtkqc0y5ty/yk9z7wKSblKRz7Z8BvMRp22x4lpCI8IIEm/UgzTDOj3gsPSNICutdGPDDHPw2KtLg+SDczm++JfSENAhZkWn900TkyemzYz/G3ftVInly3vhNBoCyQdomUoAQ8dvJDOvyJo6FHzKnwBfI/swhKB6VgPYcmsFDi0srIYKC4QRDKPzbyMUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLakAfoZN582Um+x1ADB0s4C4IFGXPwPnDury2nEzAk=;
 b=TWXSjx5Xtnh6SyqFgCBfUaz5R/OfzeMQRlj8xmitgLzlzKhiQOhPrWWkw2+seO9Tpvu9GnswfMR6RaeZZy5TRuClU84p2ISyKXKablkKUB4RWapB9wKyeQs3QyMsG64nc7WpMmyjCDkBgwzssQS+Y+z5whEPe8LVz5w3tjAJwAftxNb7PJyJZ9BpRcwzndIwtbChxlRAEuzYbosogRr1SaJit686js3dXYIEVd0GtPWLczdBl8vixUG7UN5Ch/S/KCGczsIwH8844HTGjQeZj1OhEJ9w7wc+Cv7JmhynJYrclvbWXIozxNE83p6lMLWFe5Mo1G6GyNFSij5FqyjXGA==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5221.namprd12.prod.outlook.com (2603:10b6:208:30b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Thu, 22 Jul
 2021 12:23:49 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 12:23:49 +0000
Date: Thu, 22 Jul 2021 09:23:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v4 10/13] lib: test_hmm add module param for zone device
 type
Message-ID: <20210722122348.GG1117491@nvidia.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
 <20210717192135.9030-11-alex.sierra@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717192135.9030-11-alex.sierra@amd.com>
X-ClientProxiedBy: BLAPR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:208:32e::31) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0146.namprd03.prod.outlook.com (2603:10b6:208:32e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Thu, 22 Jul 2021 12:23:49 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6Xjw-00640D-1g; Thu, 22 Jul 2021 09:23:48 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4293262-8a16-49cc-2f83-08d94d0b8f50
X-MS-TrafficTypeDiagnostic: BL1PR12MB5221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB522184BD90E471A59E8118FBC2E49@BL1PR12MB5221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /EkGDFyHc4Zfm4q7XkPCizWxxTgopd+4MqRzka2TDeY3JXLJ/+RUWrXWLZMgbG/5DsWbHf4WxSd4hNk+6HsMkYxjYXIiYCQ0gg4HxMG2S0Gj5+bs/jdhLu/N9n+rouvJX85/Ox7dz3VbHfE5fFfTCy+VSXPlo4brnzCcccQLPpDXumdYmQMzXS8PZzmlKFtEImbh3oVe5srH9SmRNteNdcow0QCIGFE2505v6aJGcKvVrCqDNgH3i8YHjYL9RmsMEZ3smEP07OvqVTAx2/6TRXm58jH/0EA3xO1V9K5qjsr7a/RwVHGeyvp+DLqDFLLqOBVWFVonZo42T46+HDCjGJbM0ohy7sTnM0AetwsmP9zDoXPyYJTMde1pXPJRzBKgUwuZEqNAHbzaMi9s0Qtcag/XgSx6U2gM0sqEDcsaM22rYp+JPbwfjbG1cTn0cKrag1ffwN8nTzbtoPkqa4RdOZDSnUmXh0RWp5g8If533bWqZvUUXFRkl8z9A3zeUOcY08cOq0W7oQlFKfRW9o4tN4NbGFm12XXC4Sk3Mq4QcQXVqGL0AaGO03X7dJm/N3SaHAlZpM+GykxzuwoMXBrNxKU834TPlh8wfKyHzCu39Bogk9Z4PNvTFqdx5oqYWuhIzUNu8rRZs3LpVSyFijX9Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(8676002)(83380400001)(316002)(66946007)(86362001)(7416002)(66476007)(5660300002)(66556008)(4326008)(1076003)(4744005)(2906002)(186003)(9786002)(8936002)(33656002)(9746002)(2616005)(26005)(426003)(36756003)(6916009)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DszwdCXRlvTS6LGf8078Isg2cavORjrZfSjlKwoIh2f/6PkrxCa016pcPYRx?=
 =?us-ascii?Q?P+PGoaSTC5wIjF2q9j5UVMjCOI5YfRv2a0puZ2WTOn0WkQnQ8C2+jM9JPFWz?=
 =?us-ascii?Q?tKJ+aopic+9QeFfBDGB7lvQlZRRM/hnhhF0o9269QIKsr8hYzvIG1zKtY2ce?=
 =?us-ascii?Q?k34Tzhmi/5hBhkadLcVEEF6RqwTtj/Z7OPmGxxUlV+sLnWz8KBNDytZ6atFr?=
 =?us-ascii?Q?wZT23DsuJhZEXVXfW+FY+SYnG6tTy60napg9dOz32SqwkWzc628hAdrKpcSh?=
 =?us-ascii?Q?m4bGAMcgzfUjZQ1ve2dRKtyM/q9ypMOTUa8pFhI7bmqWppMEBQCkFYwNSY+4?=
 =?us-ascii?Q?8aoCV9/BHsRW1OcpJ0GHtJq8VWc5/f0rKMN5SUvYkvnAljBaaj11OTXw9DhK?=
 =?us-ascii?Q?tBRRkx+DR1F5cJFZnAxzRlJFw+CfRoQWAmdGOZHxlICxuhYreqQc9OO24AY+?=
 =?us-ascii?Q?SVH2oAY3Pq5lW1kCD/uhSwy4WXKzUs+nDlRgSgoWzbKe8zPf4pMU5ARfdgpQ?=
 =?us-ascii?Q?XqO6e+mzvIJtDm3/5wz5KRKLtexFZpxVoAgad6WhQSnAm0w9cMXpF9MrmbgN?=
 =?us-ascii?Q?QgW7cxuVhx5DUuL3Y5IpN6s/kG/c4SR/b42kKMnPkkaTUHhyyccWaO6cjFjb?=
 =?us-ascii?Q?t4rWCfd921jTaBzblB/JTN72g6ufUObrJYqajV/szQAcy5h046ylMX5lcA+H?=
 =?us-ascii?Q?q/o4orow8O95sfyvcC1/QSywWJeEgyT4xq6DZb0WlfDgj1S4xPCBEt6llzpU?=
 =?us-ascii?Q?AIUieEFT4mHI1Vtlryj9JT+fRbUYfe6f+Vqh1QksAQPRXavCoo2iFHdRoQ2F?=
 =?us-ascii?Q?n4G/RytES9XvIoKFY+gGa/TMqrn91nG3lz1TuG/nlel7tgR9MuvyfXnnSGhD?=
 =?us-ascii?Q?FPyWUO8uIL7oeXfDRX2MdZu30zRnK2n4PseLOD7PNft3SFbxYeDdhALoK5Yz?=
 =?us-ascii?Q?fW3wwhZYcqrMvPAr98pWVwM+s7f1eZdpPM71yAg87ao/2JF/uso4El5/XLuG?=
 =?us-ascii?Q?bi9Ch1FRGM7U/8l/jw9IVRJ9iBwihZbOQGDSVhibOXfCev3hgZxPTIdYRPTM?=
 =?us-ascii?Q?i60cpqeSqcOzfsbpow4AW8afAt1RVLCyuVsL7+BDYOtJTaUuplm8n/jf2r4C?=
 =?us-ascii?Q?ZwpEoZGVyS3HqGxjdtFNF7qSkeaZnxulf/9Nn+3i1ptme2ylLiek9iXge44L?=
 =?us-ascii?Q?DJNretc4a9yEuj1bRcXrEw6aEJe3oBOVydi0TteShKbV4laxf69b60KEYGD2?=
 =?us-ascii?Q?gMSUHhp/Desixk3JqhaEoW7bZpsTcRtK/7FftZlhnMPHi3S8DfXDCv1WSDbk?=
 =?us-ascii?Q?7vflVPXXv3vXd4M3VOjLB/cf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4293262-8a16-49cc-2f83-08d94d0b8f50
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 12:23:49.5395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuEWV+dw/8MftmOWv5ynvaCHjvKfc75IWj0XQ0MJfFKLavrGC2IaItRbllB5s8Qu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5221
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
Cc: rcampbell@nvidia.com, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 17, 2021 at 02:21:32PM -0500, Alex Sierra wrote:
> In order to configure device generic in test_hmm, two
> module parameters should be passed, which correspon to the
> SP start address of each device (2) spm_addr_dev0 &
> spm_addr_dev1. If no parameters are passed, private device
> type is configured.

I don't think tests should need configuration like this, is it really
necessary? How can people with normal HW run this test?

Jason
