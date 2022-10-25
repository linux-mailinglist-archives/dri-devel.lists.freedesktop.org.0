Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5260C19D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 04:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344C910E0DB;
	Tue, 25 Oct 2022 02:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406C510E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 02:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvh3sTsHLzL3u0UWcmG4GcuVMuYD1jFySJYgpDpOmJkQiOBay4XKK98I8//Dd/wL1GY1NX6Y+Upi/tvyueJ0MiSkQER4w/JWHIgHp66hEBOWfjUS38X77ZJsFnElwW1baPef9mHIl6d/NZXVhCpBdKCiEQC+hFr3sRSc/bRdMJLnsLin8rA9aebUai+hgTcqKMyvsiwQS0UWH7OVKeCWvyqA77QjThOoA2xcVD0AbPGDi8RGKycu4sir1E9R3fvW5G80yWX6VtjcXgUxrjixzBLOkVIexOTBhrzD1y7rqjvZYmj+GoaKehz21anDzGFpgSyR0Odi11BTgs1kMnHbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdJDSuFcEnGoaGyIgDVrLIdCxC63oUYIDbSiihFXjr4=;
 b=od0dr/od7XjbIZKTFSqXKG3jwLR7GC6jYAuIfMsYxmxKJTIxZYJjpuu9nr8CqY5NbQul54uVJLoKN0RxdvBSPhTGy1K3Ywb6qH6rLMcUiuRKLIsAj8FKDNB3qW97nXSX0xJ2sPWMYM9UaT+xF7rQ+hrHCx00yRfAMzFhXornGPblRLxm+bFaNGFclwPHLSVR40iAVx1oW1RB0zCpYNGeFOYpPRSKWmlTzoLSfVf2cmq0CqF3c0gr8RGcX8pWaPB9TGf534pzTSvqLJ3VDUcAPSLkqlefc59A06KLXwlL3k/wHTgiVBiGZUyQvwC8XkiyEv3iStUxtKn+eu63vORiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdJDSuFcEnGoaGyIgDVrLIdCxC63oUYIDbSiihFXjr4=;
 b=n5pPRMdTfQPgiuel1TVagaJjrVp+7MoNLqicWpIYYCLk3SjRSNM9+EU7hSj7vrGE6qLQuN2V2Z2muob57aX6HDH/gbChTYOtOZ4xAo2Cg+Ud3LNT18ijSGias4EG+SLO7amqqxQwrf7JfVZ9620opLaRNtsAEELUQZ+ZwXok5rL+xEfVyvGnUrViRqgCnnZSeXv0828G7Dy2tvcBWgSQ62cY0/3U3mGLrQE/lEp1lraOZ15/LsKeWFjy0q1WQfvyykmO53U9khTdSm6SX2innDblBMmvF29nA9ETnPv26b/tiY4LFG/g5x0KsRpGo3SGRlo07oy4W3fJM8BaX12ppg==
Received: from MW4PR04CA0158.namprd04.prod.outlook.com (2603:10b6:303:85::13)
 by CY8PR12MB7364.namprd12.prod.outlook.com (2603:10b6:930:50::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Tue, 25 Oct
 2022 02:21:55 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::61) by MW4PR04CA0158.outlook.office365.com
 (2603:10b6:303:85::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 02:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 02:21:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 19:21:53 -0700
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 24 Oct
 2022 19:21:52 -0700
Message-ID: <c22bd93e-8bd2-6865-711a-37aeadbca7f9@nvidia.com>
Date: Mon, 24 Oct 2022 19:21:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <af4c71cb-be60-e354-ca4f-23e834aca6e1@suse.de>
 <CAFCwf12HDZvsr1TrRFQH9Vi26S-Xf9ULgxtBazme90Sj5AzhQQ@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAFCwf12HDZvsr1TrRFQH9Vi26S-Xf9ULgxtBazme90Sj5AzhQQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT023:EE_|CY8PR12MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: c649fd85-7601-4774-bf02-08dab62fafe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xJN6ElfaRY9i2nhsQlVNpSPDX2VL56UPb6InT3XG6CV+CSssq+jwa3otjZd8Uc+bmtGVTI5vnSqPQoPIp9qdvRacZH08nNxt4TXo4/EN0qc+vsu5ySPWEFvyqRRPx0C0auoADBfQstcmdOahtnxA35TkL6nU/IiseGjTTqm/HFbH2EvB+OSzW/Vw5tuAG6mVzs4OrWGL/AT4r4ZM9Bv71GUf/3jyQ9/uv+HMZHWm3vM9Ape3MCwltFnsmQx8ljhTRaF83RZp9fNolMzYoEDbSAcaJlaWrMSdc9toHfcuV0WQ9FEPvxyn28VSyDx4NcwJGZrpxrXOLXFdriLVIiofolCfTmGoZ04yR/mXjpikjr7ucLYUIJ01B0Nh+sUrFrxO97vdzgdm+A5qbKHebL8+3R8okk/8VCWvHcS+387+CW8uFiRFpNqPRZ/OWcG5uECJsF0RbgR5qhOkWergnVGMZx285TeGu8ShUE9Fy/z2TiU3fmX1tDDBVjbVpw1qJezvsrcX5GxQWMSgfKAPYJoW8vcY5QmlwUsqiniPoxmeH6D3a0SwoYvU2d+yjHg9fJkp7DItbksg8eqOmAih4yH6dxWxeE7Y17buzWuiH9wXRTFqwjM0Zz3OZ3AG3fO7dzJDv4cAfc3VY9v1YqXmfMhWw4LdmpZ/+28PSnuUfX1NnUeG/vmtEHs8cdbF4A3D+oM5GbA8Q0zCLXvQZ5uQ7tnXlc8aCJW8AlOCzCywaJYwMlO+Ez3ch0g3Dn3HgBoi+m35U9Vw0hCSKfyPzP2/bcfMDZI//EdEhR8ricby2X26C8=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(8676002)(110136005)(70206006)(8936002)(82740400003)(26005)(316002)(16576012)(53546011)(86362001)(54906003)(41300700001)(70586007)(40480700001)(7416002)(2616005)(40460700003)(7636003)(36756003)(356005)(478600001)(4326008)(31696002)(83380400001)(82310400005)(47076005)(5660300002)(31686004)(36860700001)(186003)(2906002)(426003)(336012)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 02:21:55.6196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c649fd85-7601-4774-bf02-08dab62fafe5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7364
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Arnd
 Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jiho Chu <jiho.chu@samsung.com>, Alex Deucher <alexander.deucher@amd.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/22 05:43, Oded Gabbay wrote:

Hi Oded,

The patches make sense to me. I'm still just reading through and looking
for minor issues, but at a high level it seems to match what the LPC
discussions pointed to.

>> What's your opinion on the long-term prospect of DRM vs accel? I assume
>> that over time, DRM helpers will move into accel and some DRM drivers
>> will start depending on accel?
> I don't think that is what I had in mind.
> What I had in mind is that accel helpers are only relevant for accel
> drivers, and any code that might also be relevant for DRM drivers will
> be placed in DRM core code. e.g. GEM enhancements, RAS netlink

Yes. That is how I understood it ("it" being both the LPC discussions,
and this patchset) as well:

     * accel-only code goes in drivers/accel, thus allowing for
       smaller, simpler drivers (as compared to full drm) for that case.

     * graphics and display code still goes in drivers/gpu/drm, because
       it is much too hard to rename or move that directory.

     * code common to both also goes in drivers/gpu/drm.

Looking ahead a bit more:

For full-featured GPUs that do both Graphics and Compute, I expect
that a *lot* of the code will end up in drivers/gpu/drm. Because so
much of setting up for Compute is also really just setting up for
Graphics--that's how it evolved, after all!

And as things are structured now, it looks like those full featured
GPU stacks will also need an aux bus (which I only just now learned
about, but it looks quite helpful here). And also, user space will
need to open both /dev/dri/* and /dev/accel/* nodes, if it needs
access to anything live objects that drivers/accel owns.


thanks,
-- 
John Hubbard
NVIDIA
