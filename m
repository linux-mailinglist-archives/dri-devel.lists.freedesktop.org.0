Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F82EAA8D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 13:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B146E123;
	Tue,  5 Jan 2021 12:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3516E0F8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 12:20:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7L/s+dqxIXZwGs0Y19Yet7P6tiV/UvFYGzIO80ElUUx0N0ioJ7XBEExZMrrJFWcHOovu37iIbVpzbD8+rYoKf5BIlAzE/yhPn+0o18E+pdgKqNZBfhPdsfdE+JZoYlSWws/6FRj2H81UDpMrDhfKgLKiVsRaGzp5p3QAzOnEAveR+QxXqmhwzfTKwNuam4okx2VEOa4RpTaKPgNgCQhv7S4Vf9ECNiO43iLSUtRUCAb0kxceOttiPnVraN1jxXOjApi8WuQPYn4mjlhWY8WzR+RKhiXuZh8b5Yj6EBJiFxjrYJ2bojm1ocmde//Qq9hhRVYHe0ET8eR1qxz5i00yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwDocZuRpd1I/IINsFNNqswxJOrmaTzVGFv9tMxjALU=;
 b=CMuFkiZQLMsg72sEj/x42xScobbLFhm6GR/Wu4FGQr7jmJZFbbHJNWmsKAjgAF/zEEw77rBtyv6CwXyM5ad+upaidlo00AW7DHSv2PhHEVT/+KLYcd8cx/ldwEAq50l4ZSmzPTwPgSRunNFhmVeN8nXqHNj7XRf3mbig1FrzHNo/YPXqEkqp0FxLmskFwRBbnVJ3xxCMiYhfqD3GBKEV+WbNhA94DEvWWckBQBCC/Tl7agPbDYEzxomT9g9wl2nXdgwlpMEOjr7SmIMSH2m+8UPH/0ChYTNSsujfheKjXr/WPb+yOfNukDiRAEO+mDJYD3piRcYrY0xQpzVz9IY4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwDocZuRpd1I/IINsFNNqswxJOrmaTzVGFv9tMxjALU=;
 b=QxDwKK8gWO/su19dfZ3sTjjpPnhGCnvb4MsF084XiBVj1dlLxbtTjHdLMwKMnKjdQh3xd4Dy6lAllijwP21E7wrWbUHDKvAAvLbstEgVf18hTWS0xR6UQU1A50KMe7eOEiglrKv0zWZ56aCb4I79nvFVXWo6cV7TXuThCECUpUM=
Authentication-Results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW2PR12MB2587.namprd12.prod.outlook.com (2603:10b6:907:f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Tue, 5 Jan
 2021 12:20:34 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 12:20:34 +0000
Date: Tue, 5 Jan 2021 20:20:26 +0800
From: Huang Rui <ray.huang@amd.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: 5.11-rc1 TTM list corruption
Message-ID: <20210105122026.GA227519@hr-amd>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
 <20210104105802.GD32151@zn.tnic> <20210105041213.GA544780@hr-amd>
 <20210105103138.GB28649@zn.tnic> <20210105110852.GA1052081@hr-amd>
 <20210105114351.GD28649@zn.tnic>
Content-Disposition: inline
In-Reply-To: <20210105114351.GD28649@zn.tnic>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HKAPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:203:c8::15) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HKAPR03CA0010.apcprd03.prod.outlook.com (2603:1096:203:c8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.2 via Frontend Transport; Tue, 5 Jan 2021 12:20:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 24017c09-712d-40ad-c7a4-08d8b1744d13
X-MS-TrafficTypeDiagnostic: MW2PR12MB2587:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB258733A9E7AEFA4FBEEDC3DFECD10@MW2PR12MB2587.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n03yp9ml7SUxnH5y/THKBrCF8+GeGBIv9yvFJ2H29iFZVSQEQNslIfcgZ9WEkxAvEvhk8dbTMf+yBB2YXmZ6upI78d6YcEQTV0mC4FSxj+cUR2sL5Ci4/mhplErWMie8tVHlzk85D0SV2tGdMhM+LdXJxCAImZeElNN63QefIBpfBDYzGW2LGgeZpH4L3exVQ+V/KNjsVdrVXb9yp0tGGA2qx1pLvR7UUD+fIMUgVuVl8LUnFUnyLWc2+8IvLkPIZbBnc4GR9CuqH2dkJqF60hwk9WIdmxPBPgBwqXjt/2Y5bJzdEdhVhAijKEM3efW2VpW2wQBNssQFyMTgkuN1cG46TILMTeActlhASbf3RWVrc4lmZqT7EL4hlMldcF7KT4WijK52ta4nkb/TWq3glg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(6666004)(478600001)(33716001)(9686003)(6916009)(956004)(33656002)(316002)(4744005)(83380400001)(5660300002)(186003)(16526019)(8676002)(4326008)(54906003)(26005)(66476007)(1076003)(6496006)(52116002)(86362001)(55016002)(2906002)(66946007)(8936002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ciq38Q4SrkMf87xzUjLpCrHYqhIH553DLBNE4rsCI4Md4QLRQwWxf45H6jhT?=
 =?us-ascii?Q?EkjDQzPCGEoGU6+twpPLdOBK6YuuOiI74VoQTljgMqgknNdit4Nn23g82q56?=
 =?us-ascii?Q?0l5MJ8bRJGuzImkuaWrRqfYEhZmbfvt+96PonWgVx+rjTUJOLXnyttA6fx5l?=
 =?us-ascii?Q?4u5OpjztoLgALNDtl8EB5kYGvnnrYtnfTBH8Sqv4xsjBrlAfJpHxuhHJz2y5?=
 =?us-ascii?Q?nhCPtg5mWNqzKTgRZn4+ae8TsiTno6124Ac6MKvWEqDqaZumjnEGg61cFL8L?=
 =?us-ascii?Q?gNJ/KATjcjle+tZOFK7NqGZPHdp73tgqIjdqfth8Cz+xjoTP8OOrjgft4F6b?=
 =?us-ascii?Q?4ToB1JXVj7aJWRpKfXbGLBOA9yJde+DDTSS7Eb1Qg5/Omu66sq/t6tqS2U1f?=
 =?us-ascii?Q?9qHktLb598eu+EjA6TBjPSdvXvdhaQpaSqVGYnGj/KKXCkmcL+18A5GmTeNL?=
 =?us-ascii?Q?jX26Ggo1QiCQ0jjNo7j6uoWa82eSy8grxxPpIyj6VeePugSoXYNE7SmbDdZz?=
 =?us-ascii?Q?+D78xmpOLoj6LEd/G5GtEm1wv5APqMHDau6bWDpoFKGabjdSOj74SeM3qmu8?=
 =?us-ascii?Q?YSyaJNs6NbuMapvD3XLbu7H+aulCE3YyMptHdKMfz0JHugU+BFPifnXIv4jQ?=
 =?us-ascii?Q?KKw4FDSnI06kP3p67/ZOj3G2yTDmJjOJ1D5j9vpMxXCAYMO8d377A8B/R1f3?=
 =?us-ascii?Q?Ab+Q/gsMFmvaRrakwY1j3vG5Ns2rtvrPryrO0VSscg/aM7vu3UQUOl8nmQBI?=
 =?us-ascii?Q?pdZ07QF6TKBFLZ4uL5S8Uf3BOi3QvjoHRYErB8018w0hd0E+ZYu4kQbQpYM4?=
 =?us-ascii?Q?ZIS9kqTFsvP9BzpCPGA81bFuETIKDlijEh7Fb0mrAaejJFamXD6uJRs29rf7?=
 =?us-ascii?Q?ZZI9vKrymaBXYFpFooaI/UI3VRYM5xYkUu6GKn1DTIPDYAZHVSCwLjuwN1cL?=
 =?us-ascii?Q?DywiKJabCpigCM61S8/rPQoB1V7XnWJkf6+XmuNB405z0mb6f5K6Za26xM1w?=
 =?us-ascii?Q?OtOP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 12:20:33.8915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 24017c09-712d-40ad-c7a4-08d8b1744d13
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ow5OAhqUHCzDGtLCWfNXYxlfxisaw5I61LK5zFgEQ9Ywwr0aWrAxnWmted0V0OExH9j7EjCDjs/oBn1XIgfNBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2587
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 07:43:51PM +0800, Borislav Petkov wrote:
> On Tue, Jan 05, 2021 at 07:08:52PM +0800, Huang Rui wrote:
> > Ah, this asic is a bit old and still use radeon driver. So we didn't
> > reproduce it on amdgpu driver. I don't have such the old asic in my hand.
> > May we know whether this issue can be duplicated after SI which is used
> > amdgpu module (not sure whether you have recent APU or GPU)?
> 
> The latest I have (I think it is the latest) is:
> 
> [    1.826102] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 0x17AA:0x5099 0xD1).
> 
> and so far that hasn't triggered it. Which makes sense because that
> thing uses amdgpu:
> 
> [    1.810260] [drm] amdgpu kernel modesetting enabled.

Yes! Renoir is late enough for amdgpu kernel module. :-)
Please let us know if you still encounter the issue.

Thanks,
Ray
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
