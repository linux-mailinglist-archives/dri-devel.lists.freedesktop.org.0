Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E756057B0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 08:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BC510E132;
	Thu, 20 Oct 2022 06:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2065.outbound.protection.outlook.com [40.107.95.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009D910E373
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 06:50:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ubz2EVyfccbyiSrqA+LESHkXePEFVRkEGOowga/kV19gAnRJ2uhDd3ekfj9HcLj0Pm5VQYFypydExm2pK0vjENJAk/m/kuIzFONasur+drCp7lgKrU52ONKHmNhktzvwuy6mjQ/GcsBPEA+Mnoo0RCgPGgwA7kqNDPGwKR5hnNoEzzVvHp2lP8dV6olmiWpf4VfKSZgpZ4FNvvD2/VmFVitsrtv60ICrEdLkcyHD6HebHCx3QYXgLUbI9uxA5bCN2HuLgqUc+cvaeuyWGVX+MGkRz0FGVD3Y860cXHRXEqSF/awNipUVtPzE6YW8WwxDw6Y+MCSHJWGIsprjAA3ytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdxRMsy4TXJirDmuMlvC5dNdxqkbAAX56PzLG27p/vs=;
 b=FaBmA4EJPKrA7EL+UFJcr3wji2sZUGi1o2WHQVYzxhCRnEeq1jkKVHIpbDq3QP8cg2ZO3bvMYbdkC07V2/+gGXfJUJqwXTuwDKrSnqRc2KEudHYQVMD5eELEGvmAE5H1izpk8P0jDX2rz0v6a1STa3emks1+2FOfOlOSmhY+HIeYDRjhSQyuxpvERK2wGKFFianX/mx7r/6kVOESwcoWntQnFDzGuQ9lgVtX1gbA/N51rYEa/OS3wseRLoA/WXKL4Fg0hu5OgpXo/nKHGjf2qMsIpIY0s8XNtIV+HpSpi3mE0m8SDOPQAPpGhl25mYxTZ/fdH1tNjE4NNkXb4a8N0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdxRMsy4TXJirDmuMlvC5dNdxqkbAAX56PzLG27p/vs=;
 b=cpyeLNu3n8C5gs/8sRRG9F3hzu+9FQ03NI5VFnqCROyqXaSF2KIfGPePs4HEFIeTIbrzxoMSFLMtDVlYiQ4++14qrf01ri1oMeimG9syW09Sxh/+NS0Tw2mIu24ybkNT5xyys1ztTbpHcHXyOykO2HBwSHdCoeL8ILt4d8P72ww=
Received: from BN9PR03CA0909.namprd03.prod.outlook.com (2603:10b6:408:107::14)
 by CH0PR12MB5027.namprd12.prod.outlook.com (2603:10b6:610:e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 06:50:21 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::bd) by BN9PR03CA0909.outlook.office365.com
 (2603:10b6:408:107::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Thu, 20 Oct 2022 06:50:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Thu, 20 Oct 2022 06:50:20 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 01:50:17 -0500
Message-ID: <54dccd3f-52c0-ea66-e782-cf3b903e063a@amd.com>
Date: Thu, 20 Oct 2022 08:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 36/37] arm64: dts: zynqmp: Add ports for the
 DisplayPort subsystem
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
 <20220928224719.3291-37-laurent.pinchart@ideasonboard.com>
 <Y1Ae1NlyVGNL/BVs@pendragon.ideasonboard.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <Y1Ae1NlyVGNL/BVs@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|CH0PR12MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e582ba2-dfa4-49a3-1662-08dab2675b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XqyOkdGbJWvTjIKQvyJus9NWNmnxv3XXisCT5YjfWE9vGdYNl/UA+tXAQTbGjZYUT6PxZaenD4+IekJ6k68/wrpVWGvqD0KL0apk0Dnj7+rrgScIPt+Eid7NLoKNRgg2wtKW3XzSj61TctzzSHt/BBhUvGreolRosqBjYrGh2b32voNPG+eia035B9pRxqqhqlm+xmrRkVPVDiovZdaHcKLSAYENWD0+YKSNtBuJ0VBcyIsKJsBhja6LoqnZCEMMcz3EqLZD/Xy/lhcFjmbse86Vp6fxLnuqzo96TkxIWNzTvmb8WEEtcSSc1aI5HXxKqLtaW/pnP3bFJ0t1vQzB/WjE8KL5VOroTyYL1HENLaTLOAJeF4QY6ahEVMv9J8qP4D8wggp+ZKdpXk6DVJgvqMW0dk01kHFGdfxgCjWVKjk69NhOKYYDyX1hUyvY1Tn10SPOrSs0v53y+4Xjkpsg8OD4H/IBvPp5U02XOiEx6XWqyQAurXMlpu77EYPmxXDL0VIEEcm85qZtBTzRw/II6p3vrNLfFpU+oli6MnzyvN2xBNsHPKUiW5SZ6hM8inrFY1cR7vAXGWPFMTVx7xSOXYQiyuWtYc5M9ICty81BDiNYysPZNIWW8mgn9zzpn/Lfhzd43Ms2E6AdgaRnk4syhke90STktfbyrdNBE0AckWSn4AKP1rbz+Gf0BgltHIkFpZV6TxtTZYBFD2hHWpMmBATvqHUqc8TlPaLf+zKuPhi1VQMYLOtzjNKgX4nUgIhn3Isv9KyFVdvthbJ46QLRpJ6C39sE7xbW6wjXapsdhUy0ljOrW54BA+XAxdpHOkgwFVaOAUnSsRMWdzX+eQEbxw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(54906003)(81166007)(356005)(186003)(16526019)(82740400003)(2616005)(2906002)(82310400005)(478600001)(40460700003)(426003)(86362001)(8676002)(70206006)(47076005)(4326008)(4744005)(16576012)(44832011)(110136005)(107886003)(36860700001)(8936002)(40480700001)(6666004)(31686004)(36756003)(26005)(83380400001)(53546011)(41300700001)(31696002)(316002)(336012)(5660300002)(70586007)(36900700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 06:50:20.4575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e582ba2-dfa4-49a3-1662-08dab2675b09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5027
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jianqiang
 Chen <jianqian@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 10/19/22 17:59, Laurent Pinchart wrote:
> Hi Michal,
> 
> I plan to send a pull request for the series soon. Patches 01/37 to
> 35/37 will go through the DRM tree. How would you like to handle this
> patch and the next ? They depend on the DT binding changes in 01/37.

No problem for me if you want to take them via DRM tree (which is the easiest 
way for me).
In that case feel free to add my

Acked-by: Michal Simek <michal.simek@amd.com>

to both of that patches.

If you want me to queue it via my tree I will cherry pick that two patches.

Thanks,
Michal
