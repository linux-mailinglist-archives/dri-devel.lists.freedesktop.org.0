Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE303E7CCB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 17:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D0A89F0B;
	Tue, 10 Aug 2021 15:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8766289F0B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 15:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEQrcGw01zI5imzKBdHqNw8mTLoB9wDTsem5XDMyzoiQBnGdldJCRPqf6KwXKhHn1yjJlUYdEyN/LrHPvDP5aFZxilgq3R12NSdCiEnafxu0ImonU+V4pmt7rtkAfvw7ypswRiUljhXotgRthoRL/RKK5+cxuOzlKJnGV2/2d6TuCmMyByC68O/2JNe4vOMra8etDHDmZ1noFEHj6vjegeMId5nL69sB5tGYY+w5D/jBTOxFbbSamoTfvBE/8Jn7YhB9VXWNBQB/shmtJabZxFd2LZrdobxwlyhsGRiPbmWeabjoNL7HNiNDYBR66etT5TUfKe8f+zsYVhs53GO/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhNLSO/323kBeOJR9Qhbf3XHiy5ZuCpby0tI6G9HBw8=;
 b=UvFl4qiZELDJF/ZYVFteOxY//6gewquR+tivce7whAnDQKKdR43Ai8eD13apsLaBi6rpkhUCsQmokNc+dvmdxuVTzP/nj3M4VTNWWtrDT7WtG/g+33pb8EA1CgGHTmettCQCFGwWUUaib4JDk/Tj5UhUCY8Hs3zLb4ust/OjVraANWFF65eJqocBC1i1Jpbn/zJ44xB7xTtx+zW9SxdppMgs2jmPPCwHamn2iEDQcbhxkY2IR7h7asVGGEfqhATvpgXQGRGPQBCqGcxz7kuDJ9czzkzznxukGwHYkXp+ri17ezyNCyPRndz6yboFkuEmeVZqWqnklT8qdI3MxU98XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.ie smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhNLSO/323kBeOJR9Qhbf3XHiy5ZuCpby0tI6G9HBw8=;
 b=s+/l40yUOJcCvXWHTTwd6kLWgnEe4vbx1XdX+HdfsOCIB5US2NpkBPEMJFIpkuEA88kGlngcVbiaAWy35q0GYwmfGOFQ217teM58My3p/j2dzZphnhQRy9UWczAcFBMAjcQMXAqOcxsmjEuk00g9IuvMtNpS6SHAKtnt9sGIfNjKd0YvaaJKiywlM5uC49S/xk1QTRXnS7+7ZUJuO/hafx8ViE+zK801dA4ZaBaXhNqUnHtoVAaAWPP68bphNvABvrcuqL1PUATDITEgThcSq6One48c5Dz6u/CZ1HxKCVrbsaw//8udZLTbefcsFfSJPjNNTaYKSGrCrf362d5jRA==
Received: from MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::14)
 by CH2PR12MB3847.namprd12.prod.outlook.com (2603:10b6:610:2f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Tue, 10 Aug
 2021 15:50:32 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::56) by MW4P221CA0009.outlook.office365.com
 (2603:10b6:303:8b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Tue, 10 Aug 2021 15:50:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 15:50:31 +0000
Received: from [10.21.26.179] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 10 Aug
 2021 15:50:29 +0000
Subject: Re: [PATCH v2 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <jonathanh@nvidia.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20210806123450.2970777-1-mperttunen@nvidia.com>
 <20210806123450.2970777-2-mperttunen@nvidia.com>
 <YRKengKZmFtgsIZy@orome.fritz.box>
From: Mikko Perttunen <mperttunen@nvidia.com>
Message-ID: <c06df24f-989b-fdfe-ea04-867de1aa8828@nvidia.com>
Date: Tue, 10 Aug 2021 18:50:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRKengKZmFtgsIZy@orome.fritz.box>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 503aa930-5e8e-4d3a-b57d-08d95c1695b1
X-MS-TrafficTypeDiagnostic: CH2PR12MB3847:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3847386806436D7E6F0340D3B2F79@CH2PR12MB3847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ks0hOxGIZPc2PSfWU1sanmAYuj/MWSwBPlmAWFQux9V3aOd9wuhRcXfDgQZRP7q41Un8EDOulVEw/cFNJxxQzEiVY2Bp++h15sNdkfN4rhnjbn1Iy3WLtlZgxw6gl6p6Nhv6M7dfhH1cWLoHDB+r39FLqtZdJWCR9UgR52HWOSfT5ha/cv3IyEU1chizvC/C1QDPNP+41aQozQcv0mFEtpCK4SAnP/pE9ec1xCp9VNUN1yX2CWTdP/sh4wl4DNBYVG2xCgfZCu4zpkh0cY+20kEg2qM0aCiI1G8xkUE3MLhn81HBZ0+/A6kHf55PYArKlEVqBC5VEtmzbj3b8+Zwiv9SUGHcCWaQDU31ht+k7pPDEiCmRlemzvHP6VVpOVHnH9wlBNc96O9GtzlC1wwi1JCZOfgAZuaVCSH6dzPTBp4wQZUExhROA1t/H1iUbCUlds6QRDF5VIpX5a689ntb0lebY4CUO6bT5HBuMqJSzjVkliv7e3+0Pi4SprXQ7bOj/pU7CwAsEg5iZTio5O1B2iMMqaZxVgl2jPkivSZmJob/X9mK4lKXMxUmXI9AckW1nyP+ioFLIKoUHZcAKq4v9ilWsSem5LZuwQ9Yj0dD+8C19u7x7YWxfaiq+9DGEmjoVoEWokW8d7qPoR4/6VMYzJmZLOqmhafSBXfNZYdjm4JauGXvZ9EqY+8wDYXrEjHrKf85aDoW/RfQ+Bk+zU3aJRA31rxVWP+RIxrxQJuXFQhVehYqtVROi3mIeKVKUyNE8M0446iFZCsEV8QScCu58/OdEA40kIDyDQjjwc9oMrq1L4Ga1sqhS23Bmzov2i109M4mCVgFrZhCN61W/iiYLsuGeYSOr4HSfrg5Ief1aIwUZw+MnFIlhnHCq4v6Mkxq1GVrd1iodh7leRTIqq/Kig==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(316002)(36906005)(36860700001)(5660300002)(2616005)(426003)(2906002)(4326008)(31686004)(356005)(16576012)(8936002)(31696002)(8676002)(336012)(6666004)(26005)(82310400003)(36756003)(16526019)(47076005)(186003)(110136005)(54906003)(86362001)(70586007)(7636003)(70206006)(478600001)(83380400001)(82740400003)(32563001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 15:50:31.8943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 503aa930-5e8e-4d3a-b57d-08d95c1695b1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3847
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

On 10.8.2021 18.43, Thierry Reding wrote:
> On Fri, Aug 06, 2021 at 03:34:48PM +0300, Mikko Perttunen wrote:
>> Convert the original Host1x bindings to YAML and add new bindings for
>> NVDEC, now in a more appropriate location. The old text bindings
>> for Host1x and engines are still kept at display/tegra/ since they
>> encompass a lot more engines that haven't been converted over yet.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v2:
>> * Fix issues pointed out in v1
>> * Add T194 nvidia,instance property
>> ---
>>   .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 131 ++++++++++++++++++
>>   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 +++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   3 files changed, 241 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
>>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 
> Can we split off the NVDEC bindings addition into a separate patch? I've
> been working on converting the existing host1x bindings in full to json-
> schema and this partial conversion would conflict with that effort.
> 
> I assume that NVDEC itself validates properly even if host1x hasn't been
> converted yet?

Sure. I thought I had some problems with this before but can't see any now.

> 
>> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>> new file mode 100644
>> index 000000000000..fc535bb7aee0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
>> @@ -0,0 +1,109 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Device tree binding for NVIDIA Tegra NVDEC
>> +
>> +description: |
>> +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
>> +  and newer chips. It is located on the Host1x bus and typically
>> +  programmed through Host1x channels.
>> +
>> +maintainers:
>> +  - Thierry Reding <treding@gmail.com>
>> +  - Mikko Perttunen <mperttunen@nvidia.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^nvdec@[0-9a-f]*$"
>> +
>> +  compatible:
>> +    enum:
>> +      - nvidia,tegra210-nvdec
>> +      - nvidia,tegra186-nvdec
>> +      - nvidia,tegra194-nvdec
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: nvdec
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: nvdec
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    items:
>> +      - description: DMA read memory client
>> +      - description: DMA read 2 memory client
>> +      - description: DMA write memory client
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: dma-mem
>> +      - const: read2
> 
> The convention that we've used so far has been to start numbering these
> at 0 and use a dash, so this would be "read-1".

Will fix.

> 
>> +      - const: write
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - power-domains
>> +
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: nvidia,tegra194-host1x
>> +then:
>> +  properties:
>> +    nvidia,instance:
>> +      items:
>> +        - description: 0 for NVDEC0, or 1 for NVDEC1
> 
> I know we had discussed this before, but looking at the driver patch, I
> don't actually see this being used now, so I wonder if we still need it.
> 
>> +additionalProperties: true
> 
> Maybe this should have a comment noting that this should really be
> unevaluatedProperties: false, but we can't use that because the tooling
> doesn't support it yet?

I can add such a comment if desired. Honestly, I don't really know what 
'unevaluatedProperties' means or does -- the explanation in 
example-schema.yaml doesn't seem like it's relevant here and I cannot 
find any other documentation.

Thanks,
Mikko

> 
> Rob, what's the current best practice for that? I see that there are
> quite a few bindings that use unevaluatedProperties, so I wonder if we
> just ignore errors from that for now? Or do we have some development
> branch of the tooling somewhere that supports this now? I vaguely recall
> reading about work in progress patches for this, but I can't find the
> link now to see if there's been an update since I last looked.
> 
> Thierry
> 
