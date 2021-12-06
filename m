Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2741469418
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FBF72DE2;
	Mon,  6 Dec 2021 10:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D65972DE2;
 Mon,  6 Dec 2021 10:45:17 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B69g1Hx011580; 
 Mon, 6 Dec 2021 10:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=XLBvJVTLQE05qyeqQNCFwbU7hQSfnxHKzA+XEmf8+C0=;
 b=WOdHECeEfNrECMn+YrWlQ2x1Ur+YAnX3tpTVpaGuV97ho76sBr8Ldfkzf3acOFIq6tqk
 D0+cvYEL7PyOPZayZVkXfT2fGe1FiaE93B1pmmqLu0Y6ojQW8x8zQcVL1uTyjLxPn1qj
 coiNtwIjb7uv1Tll/Xs+71jZiFSZhZChLb7lOcNuuIgbi5JwlaFx+DQAfOpO8VWtorTo
 UFcX808Pzob51SvmhN7dlaQQ1MxA2XNT9NLCTscpw++xWX9aI68rNLIIupGwIndxGNX6
 7Oy8oAB4KRu3wYzHYbwS3WWuLtT/XwVDTOEIR4ggNmlOvktZYt1Hcekjmx+6VNhG+Vd0 zg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csctwh7tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 10:43:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6AZ9g2113679;
 Mon, 6 Dec 2021 10:43:03 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3030.oracle.com with ESMTP id 3csc4rkmmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 10:43:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGjXHcVVqRas/hjhlHq5Uyr0Zj1gbWER51a1hMx0NaX5o0faUsM58fc8ojdTfpXtViZ6eV3ifyqYVf3aztCAqHx7oQkPV6r8AwVJ7IBb4pgWLIFwoTLGacDEGHD0mgH0O71f2wL4RTRydvdgscOwm8FC89LKwDhLb6LaIvQWUiaPYhKKwfoTQAGhxy0+sbpfym7E4HhH0Q/cPA3I2so7tTAaRrMeNGryM/4Z2idrxXvotPXpZcILDAHHRcDdicy5HHKGTHYiI7O525odDp6QBUX7HXwRgI6GjS2kRuMNXdznfw7/cQLQFdpY7oegnC3RhkX3RHU4dfbd8DGfTP81Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLBvJVTLQE05qyeqQNCFwbU7hQSfnxHKzA+XEmf8+C0=;
 b=CWNQMVvYXSqAzlAO1zsqng2BLpAXtqIWO0oEWUeeWwbZ7AURvX7eEX7pfjVWF7i4AZQNLIwZKbGHOfoKEsvKl8N1Eji2+aEOnW7pGezninmtqoDylg+eVlVu1r1wdNr9pUVdFMrkmPM5Riwdba7AfYxgn5/X2lH/lJfsSN+Z1YzofoqzjKW+hSPmQ4yjs5+SfzhX/XISn8SNUfMfx5PEq3sKNijw7aGNtMONlosMxgCUxdQVS2D5V48czfkvvOelSo5PA/lMFVMt2no8gYxD5i8WxtI4X2gz44GH7NNDkkkFyqOwy0/e4jZYWSwRBnwjpH8/U4GwsaZBpgPYo3lJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLBvJVTLQE05qyeqQNCFwbU7hQSfnxHKzA+XEmf8+C0=;
 b=ltk5R2EYnVZL5+TyweaHMVN6MmdNcNm4N7n6MtjNFIYtlkA3rMDDBa4JEtn+5/6aOSoYWfeOaMKzSRF/zbaXUmLL4RyBRUYadVILvsV9iuO0RhHkxZ/Lnp9xmeIHIuvqJub4CGpHJqK0eqNwmokBPWkSApQiwlfiraQhJNUOunM=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5713.namprd10.prod.outlook.com
 (2603:10b6:303:19a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Mon, 6 Dec
 2021 10:43:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 10:43:00 +0000
Date: Mon, 6 Dec 2021 13:42:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
Message-ID: <20211206104233.GD1978@kadam>
References: <20211130095255.26710-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130095255.26710-1-tzimmermann@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::30)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by
 JN2P275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Mon, 6 Dec 2021 10:42:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1119a3d5-612f-41e3-cb87-08d9b8a52c2c
X-MS-TrafficTypeDiagnostic: MW5PR10MB5713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW5PR10MB5713BA2E678A380A2685255A8E6D9@MW5PR10MB5713.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C/McohBiVwXoxH/eAnqzr3FaeAWspHI8z14drKy4FGWJghOVjqrN1ITJt/S7x3Q1mCKRRvMs2004AKU+JNFPjnq53pJZqq3XoTRBochZJma50tkzYUidczjmYIqs/yd4MwR0IW7OgdUrl/aFOmKvo2HpZyQ2TyLdoEqroU4Ikf1t1ROcfwWlYJAfo2AjKxXJklynbX5Z0AD4gH+08WgFsl4Wl0/6GF9iV9L0PC45+yUCqZC1ZEYq6M0Sy9bHTlEwey9BhDK+kH3iiG+aXtR4fTBNpB1REiVnP1jdvw3cQ7hzdupkNGgJGmgjuDIM6ZTxcIart6HUP1f0eIVFGMpv+YNvmk1WPyuXnz25Z6ghQbwW8O+gcNsZdLJCzboFtZY4wxpUL4FbgFYR+cYP4fIqq86WclbtlQWBv6I3Qk+dNCy1HskOUmVqzOv+bjJrAcnfwbeX1ke1tG2S+dpmxJYvYWta3QzVGVQu6d2biBn6bef8s4K3KICpZBH+2ACAo8ufiCsK3VC0rpUXnP2zRxHINme/v4CQCc3/pPy2pOC9mI+GxlVKy79wXxUQP+lV5giH9Qv7WsHgYCIimzxxMo/decT9EwlggDlpKUK+3HvVqYRv7NB3d9orRaV21nqKueNxdMwi+TfKceTd23qe4IbTlW5XEn7SQOhWAgQh3hY/o2ZFlHhI0CL7SxehDSWT4LZGqG70UOkWwwZ9r3SjUYMEGmBsE1Ulm3SVw+Q51AO1T3/WHqP31LvX14/7xowAKv0FxRCKqDHvr/1zuniYj9AvT9EKEGdHsXxR0ApJsJnQ1zM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(966005)(316002)(38350700002)(508600001)(186003)(52116002)(6916009)(33716001)(956004)(26005)(6666004)(7416002)(38100700002)(44832011)(8676002)(4326008)(86362001)(1076003)(66476007)(66946007)(33656002)(6496006)(66556008)(2906002)(9576002)(55016003)(83380400001)(9686003)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/1apE2//IyD5Pid6pW8p4dptnkbQESX93wCYBP0kiz7CAZ6qu9xDTyp0Q1mC?=
 =?us-ascii?Q?k7fMCIINLxLoa0fz8DLS2sMLepsQidkSG7exemxsvK7NuB7ttsyune63Lnui?=
 =?us-ascii?Q?fzAMJCn9Zs/pCghC5aFXBtXCjbgqrLf64otW3aSmZMbDOaQPzlXl6UYQ1Dyp?=
 =?us-ascii?Q?9FpdVyYzWBkL/KALrkVfFqg4QrqCiy8Jjujk3aNMctCxTNKZY++ja0bxZiQx?=
 =?us-ascii?Q?3EvhhebPnewKNG5WzM0vEVea+x9lrtP5Y+uUEoJ8oSjiTkAhU7kq9fivjvyT?=
 =?us-ascii?Q?ITLT+jJWMpRdqCWu4LudncLwTAatdNe1iwiTQwOVGUkF2YJysbQ4KhKZCIet?=
 =?us-ascii?Q?jaFj0YM4uonjROO069z5M5q5R2qdSbAZFrZl/wBdY55xjDd0uFjlae0NCyQN?=
 =?us-ascii?Q?Fv4qEatwkbzhO9Ag6t4bm6q22gltSUOgpQBZPeTWZjF7Vm4KFCtdzelkRYyE?=
 =?us-ascii?Q?8W2deEz7r9bIvBUOkJIgb/tOL58/dCDlrZVBBUHn0rzR50eeddgckbX7sl7s?=
 =?us-ascii?Q?KBQ1BCfE42akcqyh8Wt+c6ss81Q6WikTv+UvRfc67WuUqJRLjdOhcHhq7Gpr?=
 =?us-ascii?Q?7CUPZwnctpRDiyEmYwRH3PbYou2xiAHWnIH9CGPLxds2ulQHBUF5pwcwRDKT?=
 =?us-ascii?Q?gpnqLQdaChhnm/w5Qi3ktUsZGl8P+rj4l9h+05Gee061DYpvHv9lbFePTAem?=
 =?us-ascii?Q?o4gMZhWwGtW/pXhv3SIR1sbQQN0ms++qVmBJVaimBy1ObPYjYKZ7uPXdWVZc?=
 =?us-ascii?Q?JVs++HnxY5diKNc0zK2N6Wp9texYJEzfRL2BPsjNYd/Z9EVon24e1VVN9gd1?=
 =?us-ascii?Q?Ag0rvcuo2QcHzI9hLwY9hCmH4GUqljeJV0C2sawPffj2f6xUm1uVASYJu1wv?=
 =?us-ascii?Q?yny/Wwm5jRtwluDeggb3XhiiCmCeLg51cn+3At4FYxZ6zfdbIXzynxozbjCY?=
 =?us-ascii?Q?d8gpl8Km3jdP7/na00N1ehNkqqleB+FhmPn6KMQeAtUu9rVK/lqQVk//qqGT?=
 =?us-ascii?Q?dUWvvqA1cf5ZyA988fohsIf7j5ICiR8/FeVwovrOT6zH1EnWh8gQKcXM3kNO?=
 =?us-ascii?Q?KojfFvEZ/1jcc1bT2+hco3tI8kLoqr21809AoBPHDD3hpvXf3LkthxHc+W7A?=
 =?us-ascii?Q?jnpNWyExENZXYlzuMGVi3COT6jwWW3SgybO1u3siQjk9oRi3BXsAiLnbcRGG?=
 =?us-ascii?Q?dirJmXMC2YXkN8lEdJP4ltAJyMipAlH9cIm2BwmpVbYK4x22PlvIxT1Aif0D?=
 =?us-ascii?Q?JlLiveOpgB1vF36pr7xyUv+8BG9Eb9QwuHc8QsFz6NEYL1RmyzRPKTS6bo+Q?=
 =?us-ascii?Q?uYClhj446hNMv+uhMHy08HM5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1119a3d5-612f-41e3-cb87-08d9b8a52c2c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 10:43:00.4850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrHGvX65aZ8kWIHLYjw2fzmXOqnnxxemlG/CVaDdYGdh6o9LPhGFJ3oEApS2M62q03hKpG7ovZ1i3CRxRxZ0oZUa1RmC5R1J1/GC6RG4qug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5713
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060062
X-Proofpoint-ORIG-GUID: qAXim2-umxVOa4QjvieQBHK10eWCG4sY
X-Proofpoint-GUID: qAXim2-umxVOa4QjvieQBHK10eWCG4sY
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
Cc: kraxel@redhat.com, emma@anholt.net, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 lima@lists.freedesktop.org, yuq825@gmail.com, gurchetansingh@chromium.org,
 virtualization@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 10:52:55AM +0100, Thomas Zimmermann wrote:
> GEM helper libraries use struct drm_driver.gem_create_object to let
> drivers override GEM object allocation. On failure, the call returns
> NULL.
> 
> Change the semantics to make the calls return a pointer-encoded error.
> This aligns the callback with its callers. Fixes the ingenic driver,
> which already returns an error pointer.
> 
> Also update the callers to handle the involved types more strictly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> There is an alternative patch at [1] that updates the value returned
> by ingenics' gem_create_object to NULL. Fixing the interface to return
> an errno code is more consistent with the rest of the GEM functions.
> 
> [1] https://lore.kernel.org/dri-devel/20211118111522.GD1147@kili/ 

My fix was already applied and backported to -stable etc...  Your
patch is not developed against a current tree so you broke it.

That's the tricky thing with changing the API because say people wrote
their code last week where returning NULL was correct.  When they submit
their driver upstream, everything will merge and build but it will break
at runtime.

For now, it's only vc4_create_object() which is broken.

regards,
dan carpenter

