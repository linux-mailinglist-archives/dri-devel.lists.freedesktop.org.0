Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B832EA446
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 05:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16ED89F2A;
	Tue,  5 Jan 2021 04:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C79989F2A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 04:12:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMz0VW0K4QNxBi51SZ+8fIYL/p0MPM7A3hYLVeKaIUjeLrvHdL/GqsJnVzd1RXvpBujw4v0yD+1zM085rXqOodA7rSAC1kKhOsU0kBOdS17KnK+U3qwqFJRd+Yk+Gq+LVAMA3WUByCuwFTUbU627sQAzUA121nf/sOfMyY+KoxKQRYwKD+oGd2L3YI2tk4vSnDLd1FR+4g2z2yB+3WeK9QXwUzibW48qEAQEi3l5pjSE8yfcNVxuNYB236+0ZPQbQaKq1BBT0XIWIf2pzqCYDmLLSvQGWlwxstnGnkbirdxNtQNNAo+wda7ucIkEVe8IX0HddyTMZlPjvKGdgJVLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkS9uiK19sTmTQQvuG5UWNIfTvWMJaYVnljBSRoUrV8=;
 b=Gno9q5oxnzXRgNVLLoLOZ2mEvv3dgp+0srgyv5957ZHNSpNXfVjgtErPbkT2d4r4QDbe9b9wbjW70VCunzkAC5tNoOjJNwziPfYKqA51WwAvocyt3iRN8tDfghdlZS2vst/iL8NVJcwZ0lvIVGiHAqMxLO+LybxUeQ4OHxdvrA/5ADXcHHf7k1Ttt+vpJjc0swFelhVu831cayjAHYAGZN3kJCXJIziqTT6aDAducvHlkZJpCisv6qRuAF2dQW+i7AcoFb/YQGcyJ9x+JOfiVb+6lvIhxtPv6HeanOXZHmtivoixfNYoAgAO9Kqm0Sb4BIiqK7fQmHpK4ql3ks19QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkS9uiK19sTmTQQvuG5UWNIfTvWMJaYVnljBSRoUrV8=;
 b=KCA99sZm2ss2I5HQkx2ygNNHkXc+8vZ73/2gT624yB7jMk5pJjRTj0TCS/obYU0lpEmsfUE23qWg1B6+XEhoumcxT7dfJ58HdbaUj7GOZDR4J8KJxkWqGnGQ9s9sjujpvyspJPrVpCiQf1fh/bWFiYy3iOAzdDxOz5TwFDoTmLE=
Authentication-Results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1440.namprd12.prod.outlook.com (2603:10b6:300:13::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 04:12:21 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 04:12:21 +0000
Date: Tue, 5 Jan 2021 12:12:13 +0800
From: Huang Rui <ray.huang@amd.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: 5.11-rc1 TTM list corruption
Message-ID: <20210105041213.GA544780@hr-amd>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
 <20210104105802.GD32151@zn.tnic>
Content-Disposition: inline
In-Reply-To: <20210104105802.GD32151@zn.tnic>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2P15301CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::18) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HK2P15301CA0008.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.0 via Frontend Transport; Tue, 5 Jan 2021 04:12:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a9ad8bd-44ff-4f94-0fed-08d8b1301960
X-MS-TrafficTypeDiagnostic: MWHPR12MB1440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB144013B2E31C5734305B42B2ECD10@MWHPR12MB1440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUC2w3I5lSGb/LXLET9lVpT11j/BVN+XM7nfFayRup/5yvH7ftzS8M02PDjCFgCouuSYtaa1LvPqWgxtUg4qR/q8OJMlcfxrVt3MgG/jmd/vfLrMSKfNe7HX1UN8+rQNv5qsC9tC8STVIcbOYSGt+hcb79ZV+GNGHI+d1WsxEcdy8dq/ANT92SZc4Ub2m64pSz7VqBvIkYnXooSd3gvcsOIhmd/1zn4x31aCqhgJvq4g+P/UADRNMyTFp6SoHfPRiICg5GmNbXuiw096KcfNxt5uUg+ycHwUdQNlB72CSRof2Wb9Y28ct+POsDcrehBMMlP1tp4+MbAcpnCo3aFjfiaYMg/CEZXgQHbeOu2CUT7ngtXHWnxBEkNHwf7/XTC08vMovk/moukH5bf5DThrd9HWrTlWG/w5oiVxW3JZIuMSF7zl/721Ewy2LkP0kOsWG4G3ZTFdKwuv3i0ub1PT5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(66946007)(5660300002)(4326008)(54906003)(186003)(16526019)(9686003)(86362001)(66476007)(26005)(66556008)(55016002)(478600001)(2906002)(6916009)(33656002)(45080400002)(4744005)(1076003)(6496006)(6666004)(33716001)(8676002)(8936002)(52116002)(956004)(966005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ssKsNxgij5w9x1Gk/PbA8hOLa1B3IWt+MiFf20tpd2HFWBOxom41OL78tdtb?=
 =?us-ascii?Q?rVFUttWOfkds3OCeXgWgqckqMqmuP11MNkw7EpdfiyY2sc0u+vq37SYTcvyp?=
 =?us-ascii?Q?hKjTQLafnLAFzUCaBDdpSxKsUpkFAWUYnRXYhvb9ijvrJj1efAg6+NSUxc0T?=
 =?us-ascii?Q?4E87v9ptz47SLwuOqqY6YYWzNKfSHtdfF9WFlpP6vo74gpjZmEIMvXwQ58Gn?=
 =?us-ascii?Q?21NfwY29IZRstJcnUWRtKxjU4KIBvFPTzV9jYqeYUENgNn8PxYZ/CqbRSa3G?=
 =?us-ascii?Q?k/rrw+Q3v+uyYzRE/q5raleS4AAPQx9XN2j+rvAGXuPm5j9a/4APMbCG31km?=
 =?us-ascii?Q?0BW+fN78CPoir+q1w2gLwcwcLNBvFC0XBRYizkqYyG9LfZtTQ4h3PE0m4j+z?=
 =?us-ascii?Q?YAKtoFEBrDe5oCUvXM1we7Z6LlK4MMKwIf1dM4QCY39mrdE6wohT/nbvhfVq?=
 =?us-ascii?Q?Xad4thmV5vqHBI1QZM/04sJO0Cpk/SlfKUkqcmLGTHoQyK5QrNAbOOOq0x2o?=
 =?us-ascii?Q?E30mUNLVTZa4XX4TN9uzgN+A5fYRm/qrkGHlIvLNV+ENMVQNTpd/qLC0Dj3j?=
 =?us-ascii?Q?jrFLZpzBkSsEf1oDiDyS+EE4hbnH+vaSSBb6SaCjFP4j/oEpLlAnxDR8MW4E?=
 =?us-ascii?Q?zsfGj1PE4Xo1q+02V4j6FHyGexPkSIVpfHTgizT1vo1SzwHu0qq5rn7DCKa9?=
 =?us-ascii?Q?adW4++mt06W966p6uKD7XJ0AKBFdMIjY36iNcMPV5cmjHP2YQJ3iA/yp1UsO?=
 =?us-ascii?Q?y49yH4dFW6G812/ZvyZjVl6aFZwHHBf6Yeb5qa28pa4B74UXWfAMtFB+Fekv?=
 =?us-ascii?Q?dXKmDelKbysVsgVK6cxjBhKLBnl13P4jTZkvdzMQqC+qrE4+VKtdjZj/HX46?=
 =?us-ascii?Q?Y8IEw2+QsfJlOCzG4zgfIwU3PWlDDztnWQoEKQ9aWmua4vMbINNEEwtsFKOe?=
 =?us-ascii?Q?n6hZJkoKMRJSaUXEabt0C8/GDnIZiJsi3V6azG3qWlQDonBYnYgGuFuyXrG2?=
 =?us-ascii?Q?+FpP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 04:12:21.4138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9ad8bd-44ff-4f94-0fed-08d8b1301960
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8SrOOuXOc2EIEPEX5KLbEAZRDaKIZXm+deG6VxkY5fn2IiPJZepDzCrhm1s8NSIvCWfdZVWmfrUm3pQB5xc2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1440
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

On Mon, Jan 04, 2021 at 06:58:02PM +0800, Borislav Petkov wrote:
> On Fri, Jan 01, 2021 at 03:34:28PM +0100, Christian K?nig wrote:
> > Going to double check the code, but can you reproduce this issue
> > reliable?
> 
> Lemme find a test box which can trigger it too - the splat happened
> on my workstation and I'd like to avoid debugging there for obvious
> reasons.

Hi Boris, Christian,

I am reproducing this issue as well, are you using a Raven board?

Thanks,
Ray

> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpeople.kernel.org%2Ftglx%2Fnotes-about-netiquette&amp;data=04%7C01%7Cray.huang%40amd.com%7C33b48c914b5b4672ac7308d8b09f9a03%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637453546869304657%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=e3Fj4KGz5n0D9O0zGApDTfstJpNmeu6HSJN2oa8iSKA%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
