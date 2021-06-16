Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778CF3AA523
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 22:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22427898E1;
	Wed, 16 Jun 2021 20:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53179898E1;
 Wed, 16 Jun 2021 20:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIfRf+ekaPiHv+Ey/nLsqOlmJHfKdLfbhmwrf02+65vf6k1+myy1YsDIKZfK7Oe/7GZVeoAnbTULVfEdxR6FZKmpfBkPLUwX/7tVhJ5CECLGes9IPkBd8nPpVUWSNdhgO/OwdAqf95RJwPgTG1nK8dtHgEymxpiQAqtR/PIY6vj4o9T+CHCsi/Noxi+ri1Hu8gNo1ZBS7Lj7OMisLCJoG8W+O4Foxzyc65kRqLXWZqOPNTTWs+WM1b8FqQn3EdH0Din4H9Qt2NtCveNlCOHdwu7sXZYiJc96LRulAO84Dn/nunI0AtBy/VXEECg4BWKHcYAJCnSpNrDrWR0S5/cEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShhqULBmWTaZSNF94z/ojlK2eu9Oq2kQAdZIzI8yvmM=;
 b=gr1AqU3CFOYRPxWh1cvMLjl07ThkRa6uKRibmJ0TSHVvBG5lyJtt6jhncmhxO1J9OfyNlvULRDnzYfBmIcSvk2r7jMZqqVbnhlmtIipucb4FMkR5o72yhEPXx+RL/WU/rQRUVjSGoAPYsbxvy4YzOlA1zGXbkDOdL6oD7FFoKComEUD161Blo7lDXvR0ysoq7e4hBYxVtOvY/DCHmPSWz2IPiMXXmQ1VNUuT0dxaYwgEikgeZroDVAZH9RYX7+o1opZLYIXTNSu0JYDiI9HzUW7vEFt6BrTg/n6fo/jVjHTlvJI6ZO0GcTA96XA6YPcf8yYpCalhquwUxt3bXskCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lwn.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShhqULBmWTaZSNF94z/ojlK2eu9Oq2kQAdZIzI8yvmM=;
 b=Z9apFKYzoWtNOGQY+RsRn7kbLAIbl8duo7dsY59vqk8aOCjn0lVbx//ylT8jwfZLPiNjDJ67Nls226ZDiGchUPwz7SwjdJjvmpQ+KfL96BjD95zUL6ptIjHy5FINI0OI6D8bWKZJKVbzc5UgOEA3V/yHOkm+X8MeabqzdUt0tWf9qAWs/hKuIvUiVH22J50DELw2XAu03z9tKYO8+T2MBrJ9W3Q1aWAZ4cPkV6juVFfDzeEKGAp8k6A6oT4jA9jsxKuK29yXj9KZ+Ir7YHHK5LbaaYtyXLQ11dPKBpKqv4NpLRo9F7PBfuUZDGNVLH5OY8ozda245Y1gHV/zKqYgoQ==
Received: from BN9PR03CA0875.namprd03.prod.outlook.com (2603:10b6:408:13c::10)
 by CY4PR12MB1575.namprd12.prod.outlook.com (2603:10b6:910:f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 20:20:36 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::40) by BN9PR03CA0875.outlook.office365.com
 (2603:10b6:408:13c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Wed, 16 Jun 2021 20:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 20:20:35 +0000
Received: from [10.40.101.248] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 20:20:28 +0000
Subject: Re: [PATCH 02/10] driver core: Better distinguish probe errors in
 really_probe
To: Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, "Alex
 Williamson" <alex.williamson@redhat.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-3-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <6ef69d97-5197-2bda-8149-320e4cc39486@nvidia.com>
Date: Thu, 17 Jun 2021 01:50:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615133519.754763-3-hch@lst.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 874258c9-52cc-48c2-c694-08d93104336a
X-MS-TrafficTypeDiagnostic: CY4PR12MB1575:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1575683A651625061DA3DB26DC0F9@CY4PR12MB1575.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pNO+loQudS7xysRfS6tXSkMbmD8wzxovGmdhtZvSGkRdR+MyNuxbsTm1kgWWUHLfInFGWR8RiHc5NOhz4Jxwhfu9RnnRf5vGQ1h+VQab3FSBVpMb34vkfveqZdDXxFTGW7Twq+GWk6xG/aUgHjuChtiQFHixHLkeXkh4w7haRdnaZRFFuH4SMhJG8lz+mZ4y6h0iUvhfPdCzvzCLyVap8Hk/2DhYUdMsIvqSkmOY1F9UBZvi54aNkgYmJqjFmNSDP0AEL26IO++j5TwUGL2bHZkbkWPbiU27o1pmSZawjQmJ4B9CCTN4nFxLpnFcIbPqHOiZgScGjZii8UuSt0yXZYOSNMGba/RcjlE1kOGwtqK+XGLL2afRiILMVcqbBip76w/cL9ZAY1fDokhDj/NpvcAXfi2ZQ59vo0ws9cOrjQm5qv1jdxuQoaF5dj4rn/z9gvcpvsZQ6uB56tdkEF2eObjU+Sv+yP4EBKKMYtlpuo+vYUf7yTvvC6UqIazMOQDOu0xAVb5RBJl3oxY+vf498Y0qEgChRNLSv7PNYvZltS37s1LQwFACeWosZ1ShNxW2DR0WqtM5k3vw19YLJZQcIN0yR3Evzv8ReiYpPQPK/CmizsPCJ8YcTeBDm0tSB8vcqjt1j5uj0WpIXoE9D42LuulckevFySE1bAbXAxtN60nwBSBmd4GY/NpYvqWmBQvE
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(36840700001)(46966006)(47076005)(16526019)(5660300002)(36860700001)(70586007)(4744005)(70206006)(26005)(186003)(7416002)(36906005)(478600001)(110136005)(4326008)(53546011)(54906003)(8676002)(16576012)(36756003)(31686004)(336012)(316002)(82310400003)(426003)(2906002)(356005)(31696002)(6666004)(2616005)(7636003)(8936002)(86362001)(82740400003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 20:20:35.8383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 874258c9-52cc-48c2-c694-08d93104336a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1575
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 kvm@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/15/2021 7:05 PM, Christoph Hellwig wrote:
> really_probe tries to special case errors from ->probe, but due to all
> other initialization added to the function over time now a lot of
> internal errors hit that code path as well.  Untangle that by adding
> a new probe_err local variable and apply the special casing only to
> that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>


Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
