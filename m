Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A7346885
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6926E92B;
	Tue, 23 Mar 2021 19:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680120.outbound.protection.outlook.com [40.107.68.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A336E92B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 18:52:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACE1F29+rWp6L8IJSVWQuTfTRPkXOcyhA/8GiPxAoK1jnxSmI/5JXyHf+ELpLzAMPQcp/0TOv9OEaJP1xAiCN2BAm+/kkMeRt4Hw348Jb+Eb3x0BunXEZANdjTSTyipBCKECVPaU+53HDhV4Zcu2jcga2bm4st0iquPq6QD+lOf4rmTI7CIcb1pvpm0kQgyMOoGUi2RVGMSuKd3gaUVwZlxiXjKMXdU/CdHNeNTbiXHuGqGofkzVzvUFpDb0/qAyz1VST5dQ6qPzgTZ4XGjtfob98Gq2FmhWiMnAzt6zDMLIm9Ddx3UbQeGTcSaACcdrGtyEloOdLQKYqo/ZP6ylUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvtqv5AfJPF1O554tM2SmB9XOlPClAeytluubcX0FCE=;
 b=nLtv7OrFmy0QaUJBtVrndcpiRjkGOzTDTXdYkVRZV91YA6Ns0/orKLYViXjHOfOLivqnNCcOCYSNxCmhOHAtpspWulUCz/QCwyLqPeKoSc3RG4EwBgD16PMesaPdKyCdJ/IJgzIqJCYSULmsoBFfA1kQf4j8XFQbSonEFeNzXx+tJWJpgHUOzZaMRH5JPIjffQy2PEsL3sIs9i9/P/UkOYpho6WC5KMWDUNsJYAkUE+iTi9Zh1HItlAJWvkKe8QdEET7hewz48A3JIqsZx+jQztrhkSsVIS98Yw+2LzlxltB++pFq97xduSEuf6faG32oPqLl+BP4MUPDWH6IbkAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvtqv5AfJPF1O554tM2SmB9XOlPClAeytluubcX0FCE=;
 b=WPaaykNvt88bXlZtvhGlyiv1LygEfV+vb5S0zjrC1uDVrnWnCWcGKPVYYYTDefL7yP32N+q1N0DJPjPP+86ULGlnlR9T+g7s6nT5WnbkEhur11TTbrSaCQT8IMmDq9Y8zRIQOBOwhGIw1qXsl0xD5ygKptHR7bRQTvlyV/YyU+Q=
Received: from MWHPR21MB1593.namprd21.prod.outlook.com (2603:10b6:301:7c::11)
 by MWHPR21MB0702.namprd21.prod.outlook.com (2603:10b6:300:128::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.4; Tue, 23 Mar
 2021 18:52:07 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::cbc:735e:a6a5:8b9c]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::cbc:735e:a6a5:8b9c%8]) with mapi id 15.20.3999.004; Tue, 23 Mar 2021
 18:52:07 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>, KY Srinivasan <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>
Subject: RE: [PATCH] video/fbdev: Fix a double free in hvfb_probe
Thread-Topic: [PATCH] video/fbdev: Fix a double free in hvfb_probe
Thread-Index: AQHXH7cUAxkwwvLRO0Kx2qFQ1UKPxKqR6olg
Date: Tue, 23 Mar 2021 18:52:07 +0000
Message-ID: <MWHPR21MB1593E96D24957865DB46D3DBD7649@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <20210323073350.17697-1-lyl2019@mail.ustc.edu.cn>
In-Reply-To: <20210323073350.17697-1-lyl2019@mail.ustc.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mail.ustc.edu.cn; dkim=none (message not signed)
 header.d=none;mail.ustc.edu.cn; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 021a5235-7eda-4fbb-f06a-08d8ee2cc220
x-ms-traffictypediagnostic: MWHPR21MB0702:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR21MB07025D1773CB5C13684A34FCD7649@MWHPR21MB0702.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9DWMQGMzsHfpfoUTtx2kQh0HwQ8BYlGurswzoZRmdexysk8/mCiV+uzipDnR+dCGudcRBZL02jSytqBsalBhkVdU2od4e7jlQfns9lMIMGH89Gl02P4w9j9hwhE6Ut4JQbfVscv2N3zHOSomL+j/Pd6vct9CMsDA7Bv5YhCocSYWfRWray1OivOd9jNsA6HcIKoSvWoVMwVPCBgdbr/h66wNKhp7VVExtF1eqgryiq2V88Eov7j54uk9zNIQBwEXGL0ehYh9BSjrWTh0rCyy6FwVF5dX5MycXi5Whdnmsel5MI5w0A0fYU1JpgFiEMVGxcDfuil26mG29UrMgilJhjU/So9rgwtVXaxsVXDqZ94Lj2P9jLng84R12xAz/pybieMhNTDlLWSS3DgoO0kwak+Kkd6GhDL2uHnNf/2KSB8b/Gv+wBwQYJynPPa5xP33TtfbDZzF64mOGOh7jAI600pKF00QEc4mTvbHse+19nLSMR6FwW5Xwqs56GMY9nJq0Z35gF8RFfsFGsuu8VEalULK6KYVUErbFuSp0MO/9tSHNjW166C9b1HQofxT+WgrmNfU8BbedwfibQZ/zyRwPVM/bZwaPkzVC3kHwbaPjcAwtkHN5gKgKKFe53WAqvbBWQBDXIxe5fn/z8aTfTr3CORetASNJi5VK0718lTQTV4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1593.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(26005)(6506007)(66476007)(4326008)(86362001)(64756008)(76116006)(66556008)(8936002)(66946007)(7696005)(33656002)(5660300002)(186003)(52536014)(71200400001)(66446008)(38100700001)(82960400001)(2906002)(8990500004)(316002)(54906003)(110136005)(10290500003)(55016002)(82950400001)(9686003)(8676002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PktPIEzYLCeyE05bhso2Rk6Vc+xvuTQSGAQZbNFloHVZeTSw6VX/9PTMLtdp?=
 =?us-ascii?Q?a73Y+Mhb4VS+NsEUn2GOHjEwftUb8AktV4bHWwyIeSFbfM2J/U86hZJuBuQQ?=
 =?us-ascii?Q?xdL3Kg4NyH80KyZbE0HJ+ZtFDzOIE1tNW7mjVt/TQkAFBoqCV70sLAtL7K4I?=
 =?us-ascii?Q?QSYoTQMjU5SmlLn5GvmZdsZ9RjInTpJfh0uznfdpWxk/JykL+Hj+G+3BNIo+?=
 =?us-ascii?Q?R3qbjhjmTDeUYi7RNwMK/0ZDtu/lXAwyqkbYJSVhYjvlzSPeH1wx11cCXhjV?=
 =?us-ascii?Q?lUoXYnBQWQlWF0niE41E7TQMYZJ2UrP10VF/qo3eA0fSlw8q4XXkGspdO9H8?=
 =?us-ascii?Q?h5bzOcAVk3Fb29i7V47LxkXC+m+2J/JX1aA3RKzzTrjgr6WZFh9AqDgNnaCK?=
 =?us-ascii?Q?xZlpJaPVvKepC3lrPz0IOXg+DZuTJ8x2+aKs0PZgZbtGxVy1ou5xYqTTlYKk?=
 =?us-ascii?Q?v5R8umTq6A/iF8wDgj59QK3hm0nsflzyyAeuGtYxmf3UDhJiY3vHZtywl46a?=
 =?us-ascii?Q?MNSXchWl5ljfh9dq9pO3Nd9Y6K0IFxk2hncyEQe5QPt28iozXeEmsvnCrd1Q?=
 =?us-ascii?Q?lJJguNGz3kqk/li+NEZcqImThQybCvRqsFZAqmJHZ6fs8rwKa8Os4xoz1auV?=
 =?us-ascii?Q?UeRXX1G+ZxhkLlPNH3i46H6ETEs+1bkFMo8zo6IAx3tgzsXNA/EsM7/ONUcm?=
 =?us-ascii?Q?M9lUkfNxED3bimjFXsHi9YSI5PJRXkZZBxBY8A6fteaW8JMhXPW/jxKddhQj?=
 =?us-ascii?Q?8Y9+sRPMT/VyneUWr4d8xL5O96kYAszsqOTKgrkGm2B3TQVe+YNpdIOGVvy9?=
 =?us-ascii?Q?FZm69p/XnlYDqyvEDtbjd3eB5uV0gzxbCqDTVmWPzHeM7IMrYny47XkF3uhi?=
 =?us-ascii?Q?sk1yljxY6gEc5hXyPrJiFLYg/lDuGVos4OZ1KejVbBhsyy+Xy6jyuKq51za9?=
 =?us-ascii?Q?2sk4RJ96IZhKOywwGfBz7a2pND2k34IhvM22srYWPoAWCoT9w+Caro/s58F1?=
 =?us-ascii?Q?MJv568rt8xPE9/s7fo4J9dVl/P8N4Qlq2TQitpExNRGkjjmxXVhVYmZ0L/Ut?=
 =?us-ascii?Q?tdHiqsrBtZPUcvErYZNMAjBKoor2C4pbr1Y4TR/AG5NjvzDO+ew6bk1XjHqL?=
 =?us-ascii?Q?pvOA4m3YPPXdXVzSbBLpuXoDF9WdiqQY/8q3AvEUERP2v0zcTx/LZN9D7/z4?=
 =?us-ascii?Q?VIT3iccHBEmwxtYVX1HHNyHyho1vvvwghgznxZbE4orCk0UOm1Y8KnzqivST?=
 =?us-ascii?Q?pR3cLFSbIuieJ5yLo45lyk3VkrD3j1TxmW5ST4QI7DyPzV75YiiBUmaIKkhp?=
 =?us-ascii?Q?Ccsf2pK9h49wgsGdDwG5ZVC5?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021a5235-7eda-4fbb-f06a-08d8ee2cc220
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 18:52:07.4416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cedxDP7rYtkerOBEYI88g4imqz2dmO5ZQyMURQ6ipP96fgKMuwJEA0ZpaKdNie38UguCY0WULVcTSR/sLoya7bcTEs+M+SSWrVO+6/EEbB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0702
X-Mailman-Approved-At: Tue, 23 Mar 2021 19:07:58 +0000
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Yunlong <lyl2019@mail.ustc.edu.cn> Sent: Tuesday, March 23, 2021 12:34 AM
> 
> In function hvfb_probe in hyperv_fb.c, it calls hvfb_getmem(hdev, info)
> and return err when info->apertures is freed.
> 
> In the error1 label of hvfb_probe, info->apertures will be freed twice
> by framebuffer_release(info).
> 
> My patch sets info->apertures to NULL after it was freed to avoid
> double free.
> 
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index c8b0ae676809..2fc9b507e73a 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1032,6 +1032,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info
> *info)
>  		if (!pdev) {
>  			pr_err("Unable to find PCI Hyper-V video\n");
>  			kfree(info->apertures);
> +			info->apertures = NULL;
>  			return -ENODEV;
>  		}
> 
> @@ -1130,6 +1131,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info
> *info)
>  		pci_dev_put(pdev);
>  	}
>  	kfree(info->apertures);
> +	info->apertures = NULL;
> 
>  	return 0;
> 
> @@ -1142,6 +1144,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info
> *info)
>  	if (!gen2vm)
>  		pci_dev_put(pdev);
>  	kfree(info->apertures);
> +	info->apertures = NULL;
> 
>  	return -ENOMEM;
>  }
> --
> 2.25.1
> 

While I think this works, a slightly better solution might be to remove
all calls to kfree(info->apertures) in hvfb_getmem(),  and just let
framebuffer_release() handle freeing the memory.  That's what is
done in other drivers that follow the fbdev pattern, and it's less
code overall.  

Michael
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
