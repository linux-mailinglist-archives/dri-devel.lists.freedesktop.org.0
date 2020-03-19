Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628AD18ADFE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCC46E9A5;
	Thu, 19 Mar 2020 08:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152C26E07D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 06:22:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgYNyfoVwEKVV7Eqen2/FTd2W8DOvjFNNMG75RwuFX56pws5I5LfXLkHCn9qH8VtMBYm36msINdul9dirs9LNJfGrne34LjKW9mK/QzptxURlLwmcATyrbn1lpNHMhDB4RzLydHu9md8olzPAcEV6FOQ7Dk9GvTuMiXRXADrwVOnJIyTq/h29zd6jonjeg++6/nFrnBDILT7n/FVha0yrbMHkOxHPTJOw1Y4M1VkVvttquSv1w14JtN1gglxIh6iyjOfMziUiad7aHaPR6KFVqVGLuNQgOvsrOZhtCA8pY4ZuvhGJXaF1x9kt1N6ppcQ7WayoipBrps8EtvI6Hippg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36BrpSj7lwUug9xNwITkTbD7aTPzoCc9CCLE8KVbIK4=;
 b=awQ88KRSJJYfmJtESOW0vclAXi4GNzUNeYu1KcZmHLWFWhCglwoh0iVVbQfHjI7yPKuCpMPfiVvbVVoCbfEuCxnIpAfCo4rcpUjRszD+sk3xDeGqp2UAVKJ/DEgGyGSS1z/Kn/MaJfjfv9v0dfqGMpEMDy6aroCZ6wolYkVrJbbeJFLr7Dk7l7z1fIitkovt1i1iUIDJYjbwqCfqafSUIU74NVq7cUlnoK6RmVcR0LXqKQfRigECoFrI/5Cz07Dl83/BWe0gNKIT4fIFmI2306rT8oy7L628p/WitwKJFD39qIQDzGzrJk2HW/Ggpmr+aZ6cywTdEUXXTHwB7rFj7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36BrpSj7lwUug9xNwITkTbD7aTPzoCc9CCLE8KVbIK4=;
 b=Jn3GmlSPMUITKMUmdEhakYhMDkRbYCIQi21CeVPbHPBTZRLLMEDds25YHrGCFAUHdK3Wk4UXdha9pNL2zPVfgt88IvKOj4wcSbnwEB3GINrXkzCQ94sGUKTyXSoTcF639BAfuxZGPLe36APpx/ZNxFlWdFWlOnmzA9vDbcQe4oY=
Received: from MN2PR01CA0027.prod.exchangelabs.com (2603:10b6:208:10c::40) by
 CH2PR02MB6489.namprd02.prod.outlook.com (2603:10b6:610:36::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.19; Thu, 19 Mar 2020 06:22:26 +0000
Received: from BL2NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:10c:cafe::ab) by MN2PR01CA0027.outlook.office365.com
 (2603:10b6:208:10c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Thu, 19 Mar 2020 06:22:26 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT063.mail.protection.outlook.com (10.152.77.121) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2814.13
 via Frontend Transport; Thu, 19 Mar 2020 06:22:25 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jEoZV-0004NC-2Q; Wed, 18 Mar 2020 23:22:25 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jEoZP-000573-VP; Wed, 18 Mar 2020 23:22:20 -0700
Received: from [172.30.17.108] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jEoZI-00055z-VZ; Wed, 18 Mar 2020 23:22:13 -0700
Subject: Re: [PATCH v11 1/5] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
To: Hyun Kwon <hyun.kwon@xilinx.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
 <20200318153728.25843-2-laurent.pinchart@ideasonboard.com>
 <20200318192651.GA28612@ravnborg.org>
 <20200319010857.GC27556@smtp.xilinx.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <5cc39f54-2131-afb8-eb82-eb04709dad85@xilinx.com>
Date: Thu, 19 Mar 2020 07:22:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319010857.GC27556@smtp.xilinx.com>
Content-Language: en-US
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(199004)(46966005)(186003)(36756003)(9786002)(107886003)(336012)(426003)(44832011)(70586007)(70206006)(4326008)(26005)(8936002)(8676002)(110136005)(81156014)(81166006)(54906003)(31686004)(356004)(478600001)(47076004)(2906002)(2616005)(316002)(5660300002)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR02MB6489; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d398c4dc-2e74-43a0-dbb1-08d7cbcde476
X-MS-TrafficTypeDiagnostic: CH2PR02MB6489:
X-Microsoft-Antispam-PRVS: <CH2PR02MB648965889F4A3DF62634E219C6F40@CH2PR02MB6489.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0347410860
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ca8sWnqjxxWwEJnR42+m9Ee2LRIDgg7ZcQW1WflXW3oVSV4BoXng5SBnwdd2oQi7EeLpKDbi53WM4eTQXcLeH1iwtKynbe6t446AphG9llEzWMt1ZS75HgRI7GAVdxb9pqFS/pyRuHwtmkxhG4K/WZrlQU8CGqpHt8rXuYQD7oAFs3VvduI0Dy9Pt1xKXF9Vzy47wki6VCQ9Mf6YbT3/2s8cbV/PnCvlnVtZvwgFF7lLmnLmqVBciQt6iy5HWL18kbjJLYBIEdFthZc/TCCNM52wxE6cLMw8Hv18Bv3Duc5zv0uvvWwSES1LAu8W/MYi+IOSSWMpB6r/oGhKjo2ilWKOBWQ8LpZBsE9VyNpCz5VvwZY9dHDYUVY6Wlfzl3o1h24+z4XtfErVkh4He3M6Is3vIOZwR0dAcb9ZKo4WeJLCp5pjNgXFLAZqdLm6lZg9uo4b/OkMVzPl2nlwR4UZq3CIB0xG60P6PUxG2KjX4ViEhb32UT9ug3sXa7O3vzONydTJP7cvN01lPciwPKDE4g==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 06:22:25.6202 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d398c4dc-2e74-43a0-dbb1-08d7cbcde476
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6489
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19. 03. 20 2:08, Hyun Kwon wrote:
> Hi Sam,
> 
> On Wed, 2020-03-18 at 12:26:51 -0700, Sam Ravnborg wrote:
>> On Wed, Mar 18, 2020 at 05:37:24PM +0200, Laurent Pinchart wrote:
>>> From: Hyun Kwon <hyun.kwon@xilinx.com>
>>>
>>> The bindings describe the ZynqMP DP subsystem. They don't support the
>>> interface with the programmable logic (FPGA) or audio yet.
>>>
>>> Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> Bikeshedding - examples with indent on 4 spaces to make them easier to
>> read.
>>
>> Would it be possible to make this binding: (GPL-2.0-only OR BSD-2-Clause)
>> This is preferred for new bindings.
>> In this case asking Hyun Kwon should be enough?
> 
> It should be possible. But to be safer and if needed, I need to check with
> corperate policy before I can confirm.
> 
> Michal, have you already checked about adding 'OR BSD-2-Clause'? or should I
> take it up to Xilinx legal?

I haven't had any discussion with Xilinx legal on this.

Thanks,
Michal

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
