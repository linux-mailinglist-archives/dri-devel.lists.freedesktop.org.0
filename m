Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E619C1532C3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 15:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511536F5D0;
	Wed,  5 Feb 2020 14:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FF16F5CB;
 Wed,  5 Feb 2020 14:24:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPhpphWMYq1xF1MV2rPo/wUXZx5oWkl1/0CoR2Af3IuvgoS1ZqB0TVF3498voCxCKIbx1evg3w30DS4l127AbRxe9TqIBa7BQMYXj/s4hWE9/mWts/cK3g59sx0w1DryAQa7WXgsGlLdLlzIsVEfzD/xfoTKjKK2pT4sdPjgQV7QjYEPWzZe3NwCXUaxi8hXFtRMUKh5CSeydpt1cKODLmyH98X40B1hkjnuqM0C+a6KXXFpV3jJGLmeSB+92xNVnRz/IIk8xtiYV/MUFauVSdPCyDDWz9e2KblYPG1ff2GJC/KVK3pY30pdE71UBw0luW1p/MEGt7c4WcDW+ZsIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UGLHLs0DVeWS2zvOSH7SVYERBEFl7aSaw9mXMwmhrQ=;
 b=HuDiNaFxatem9Qy+7W5IdCK6yl6RFMbZIRYc12LuAeoR2eTBqoT2j+HYVHB47gUXqvAasMhyFkYHpQIHOF3/yeQklomqeclNyppWQTxbXIg8m2pVo9SFWIexenaRiHlZwM3ishlqzU3deQgzK++iIpNt7RkQxurDB+7BVcqxJO+a87ONwcK7P04EOrIFU0so90kp1VeoXuln1+K9qCW71kPNcis83bTeK0RFXssDHS69PQusfTll/w8hJqB+BaoIWru9f7SmRQ346ka1vB5q1dcqJJ7MH4HrDL578cJxeL1N7xIj4vtuY9tmiyUNA/fXHrcaO8XZl9CPwEQN4ydWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UGLHLs0DVeWS2zvOSH7SVYERBEFl7aSaw9mXMwmhrQ=;
 b=BuXgEdZyct0zJSb5MnNURvnJbyDQdWv0X+6qAgoXuLbDCd0XVYS8Aa9INGzZ0bRuEG5luVHCLho7g/TGpdnESCt5pW+dCrQAwvB77Q3FuqbWY17At34Q/Gej0XneFzuWrVp1BoEyVGn2wfuQxxLqzAkrJbTMabB3YgOO2eNPim8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0134.namprd12.prod.outlook.com (10.172.77.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.32; Wed, 5 Feb 2020 14:24:29 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f%9]) with mapi id 15.20.2686.034; Wed, 5 Feb 2020
 14:24:29 +0000
Subject: Re: [PATCH 00/14] amdgpu: remove load and unload callbacks
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200205034852.4157-1-alexander.deucher@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <c1f383c1-bba8-9ed3-bb71-3d5be5c00d65@amd.com>
Date: Wed, 5 Feb 2020 09:24:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YQXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::39) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:9240:e3a::3] (2607:fea8:9240:e3a::3) by
 YQXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:15::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Wed, 5 Feb 2020 14:24:28 +0000
X-Originating-IP: [2607:fea8:9240:e3a::3]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 11cb1434-4816-4cb0-f9d5-08d7aa471c6b
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0134:|CY4PR1201MB0134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01347B459D2109172F8995DA8C020@CY4PR1201MB0134.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 0304E36CA3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(189003)(199004)(316002)(2906002)(31696002)(53546011)(5660300002)(31686004)(2616005)(36756003)(4326008)(52116002)(6666004)(16526019)(186003)(66556008)(66476007)(478600001)(8936002)(66946007)(81166006)(81156014)(8676002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0134;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PAqCGOtpMJAUbvc62yO17deWFFuL8yPn+Wb8x8BE+nL11+H5hC+gCHsf6BNaRBRRi3Iq2TLo7Y5Rn3rdKv0pQm8KdMucKWaOZ3ySGWF+yNguyqpSaNhwE/aeeWR+Mdm+MEujk2ksO7ex6klYPGjf1VZB7I8jy4TSqm6ox6JlTp57gz4p7u/IbRcjWkHD/120121PHvNby2h/2yKYODmyhRyzUOp3XJhfvOvpEdc9iCZMGBGckSXXWSWywrrjxsC/wLveabwt4lxKmrR5BwJTtIJjBk3AFKC3G+exTivqAhVrKtg0D7ppw+IJPCufY43C3bQYpgrSLfqZ/Rxe9gNxmY/EWbZFI72l5Wb0eyxA6u8Pep1gMNPdNKRgs2pbRarIHfdt469MzzX11IUQFB+ZQnMwxp/m+F1kQA9/ZOfgtu6hFfE6GzFXmUkO/0jRUQa1
X-MS-Exchange-AntiSpam-MessageData: 5Oue2y1XqrqXoNyAP0CR+zoNPHBf6jn7panqS9mhhq43F9OO8pwEKbcMjjkzymM2nj6V8ZDFIeStLlqKRzlLL0ojb9yg4Qf3Cy1wfu7Y+MSuPgdD88dwVirh1mIz1fpNNZEmWa/dM5OQAK25DyVV11QDTVhpqvw4mbbiaQW0KMY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cb1434-4816-4cb0-f9d5-08d7aa471c6b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2020 14:24:29.5171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /n6RIIY8Q+i1fJsmPOETHOKD4Ub14+Sbe/Erai0GFOkLaKhEXhIpwoaWasgL11KrJmy/6iFoasOGGnx9bmtZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0134
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches 10-12 are
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

On 2020-02-04 10:48 p.m., Alex Deucher wrote:
> These are deprecated and the drm will soon start warning when drivers still
> use them.  It was a long and twisty road, but seems to work.
> 
> Alex Deucher (14):
>   drm/amdgpu: rename amdgpu_debugfs_preempt_cleanup
>   drm/amdgpu/ttm: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/pm: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/sa: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/fence: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/gem: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/regs: move debugfs init into core amdgpu debugfs
>   drm/amdgpu/firmware: move debugfs init into core amdgpu debugfs
>   drm/amdgpu: don't call drm_connector_register for non-MST ports
>   drm/amdgpu/display: move debugfs init into core amdgpu debugfs
>   drm/amd/display: move dpcd debugfs members setup
>   drm/amdgpu/display: add a late register connector callback
>   drm/amdgpu/ring: move debugfs init into core amdgpu debugfs
>   drm/amdgpu: drop legacy drm load and unload callbacks
> 
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 67 ++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 17 -----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  3 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |  7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c        |  9 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h        |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      | 15 +----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |  4 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 14 +---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +
>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  1 -
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++----
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  3 +
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 -
>  18 files changed, 112 insertions(+), 78 deletions(-)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
