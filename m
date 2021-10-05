Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C94642209F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 10:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539E06E34B;
	Tue,  5 Oct 2021 08:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2046.outbound.protection.outlook.com [40.107.102.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930F96E34B;
 Tue,  5 Oct 2021 08:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyuOnS/pQo0pDW19vLkfJ259ckVSLQ0qyiJoSpNutqw/gj0KaHt1KPfP8CxYn8aiZ10QGAbawCOdjzJCDS/ce3uhonsGFowTHhXVAaIBr/8+xV9vHHHb+65hMG79T0Nc/lARBNhn8GmHFTeXyvUo8OZd5G+7aU5smodfsf8a5UCF2PHG695M5Wjs5VzHg0EWIgGYATsbFkPufop7LGTqBUKFJlqa9PR7HB89P0/rNrHmlow6it07+IWpXlLq3P1YstuNQH2z3kJg8FWxnhTa/bMR0c+CGdHID1eNmC+K4JsZi5aPe306TEQmxPT5gWmHHEpc4TpyzCVh/zqlTfPT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd1xXHqCs/ERPQpWjKQGxT2W61GuUPrNP0mBYt0n+sE=;
 b=XYYuvep8I0CpLWY6tVbKGQq6cNmVoHXUkJgcP4iSYkJYXvlgguv0KaKtyYiq1kBByS6qIeUuWUQy10K7RuaKhbr6YQnuH9ejabC+c2W+0xp2ZLqqYfAnVp/T1tZ0xmAKxgMfWf1wTylq8jXV6GmRFO68KEyOad/mDpMFm2BpXzZswZ6d6O90paaCVmlShK8AQTR+aqpWQf1iccpFBPb8KcSixTM0nhLRQ4O/K0EhTKjY7ngIoMDpp2ATMfXOIP8B/HbFVE3EU4fG2Sts1r43qh/2VsfatT9IHyFwymFUi+Djrl4F6ywbvsVIIGDwRbYMSWQDAgiGNJpvNmfYcZg4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd1xXHqCs/ERPQpWjKQGxT2W61GuUPrNP0mBYt0n+sE=;
 b=yOj94pAGq0VwTnZZsQhc7Cb/pfuj6l2qDO2OCS4XunpPgCb/fYcfW80X+GBBiXlor2BW0TFtWMkwAqz6jjP1B18lqI7hpiEyPtt3i0tnTxAOUO+N/iS+k9UyMH6w8R7GgXlBs9XfR/VFC3VDCKrrZM3pmBmP1xG2XAEwhsmBvRw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1213.namprd12.prod.outlook.com
 (2603:10b6:300:f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Tue, 5 Oct
 2021 08:23:32 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 08:23:32 +0000
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211005185940.382720e7@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f9b1b7e6-94ab-50f8-d16c-a3581096687d@amd.com>
Date: Tue, 5 Oct 2021 10:23:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211005185940.382720e7@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:208:122::48) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [172.31.55.180] (165.204.72.6) by
 AM0PR04CA0035.eurprd04.prod.outlook.com (2603:10a6:208:122::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Tue, 5 Oct 2021 08:23:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7199af5e-5881-4fa0-ee30-08d987d96ae0
X-MS-TrafficTypeDiagnostic: MWHPR12MB1213:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12139FFC10A7E643B950AB1C83AF9@MWHPR12MB1213.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yxseSHpVkKqXf5XRQSrWuLdJ7djpD9wuvKWBmhx0gyonId8A+YFCM+qVT+OZ/UNfVpzcn52szPiTDzDFr0z2952hiU3VFc7BAJLfFox0tIpR8hkxBzYZnYo1DizJIy9W+r4X76QmDAsrhNVWVI82SZVh86rEteYO0OMSenG4syeGkVWZviXR8E8BKPN+9zrNVaPCbLLOFDGLLzQzomENimIs/p1CwT+djGSoVsm8/2V8X3xAutKe2ffdbm9Xd4Iq2/Ia2f3+8I0sr2YzgY0S9W9Q8Jb7WVzmuM2apDt7tOe+UPoqBiuvrjqXjQvqry8ISWcs76XCDPwrhiHUUdaExmHp8D/NPOtBrxYewjaLZx3eCZL009uD0IuRJMJFMz6LZHNOaZM8Rw+1grf6S60jkJrVlaMAZeE2ZukZO8X/BI2740z3iCWzkPHNp52rW9zqlW8rjGkjuUjb7nc3YcP1jgnLYNRc09DeGinSIa7L7DDajD7767MMBWVpZwOFqlBVsGK2ZrNXnXtmxYowgBlI/s/MiwfK0cCj9H/KF5k9VmRZfdO2aBZMRGK7JifPRw33Fzmwpyx9pe8PI0kPSNy7qwRF6Qs0u7nfWAPu4LrhKseYTE4ZGzYa7VChk+dF1m6pSYD45DEBV4vqoK1OAmmrAni9rxIh3faYABLXksZ8zDF7Qw/kxBadS8KVIeRChPfl1rH4JOZtKYOPs3DOxKEbWaWLrMFb8YnZZSUHg61htNt3rWZHFIwYhjnb/sbHleJF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(54906003)(110136005)(508600001)(38100700002)(316002)(16576012)(86362001)(36756003)(31686004)(4326008)(2906002)(66476007)(8936002)(186003)(66556008)(2616005)(6666004)(956004)(5660300002)(66946007)(26005)(83380400001)(4744005)(6486002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?MDPUJrp42qzYdxv0r6enSdRVXPSXK/ntJwUdtV5TpNr+mF86mTf+IGT+?=
 =?Windows-1252?Q?s8m6kv1K2qYjD5fPTn1Ka8b4pC2F/CQK4xfhzz2xIdTaFg8Dig387UZ1?=
 =?Windows-1252?Q?UNuBTKhI4e9wxCDl/VfgbFWAW4xWM5cB5isvSVONwIhk5RU3utmUupzN?=
 =?Windows-1252?Q?9HP17sST3CRWD/kRzlGrRxOYa/Uzdgcqq+lH5FCXulQwspNFFzBZQKZ6?=
 =?Windows-1252?Q?IXjv63W0ONo6yWzImHP6Z5LHTLdwoRsaCdXxGaO6cPkJYdO0VWXNk0IN?=
 =?Windows-1252?Q?K/cQHp75nGzgMU13Id00DSvft+zYs2487VnNyPBJ2dlcW9TK3ylCBQYW?=
 =?Windows-1252?Q?w2IPFFdijvJDaM0vXOOQ7QNhQEWaYdvmdefGC8ibfcTcg896WeRKpznF?=
 =?Windows-1252?Q?M5tnbj/S9/9NUqDKkKfYAea1bfAXpErDyVZOlLtx1l1axWlpocNvqnm3?=
 =?Windows-1252?Q?El2u8AOCGe+7nnFIofDUR3si99VCQwSEfEMq8tPSLE7y2UmGvkau5rDf?=
 =?Windows-1252?Q?s1FIFxNn1h3wWqnhCFjEiHBTD5pjz59yKdTRfl/fxwOYOpCHp+d9if9f?=
 =?Windows-1252?Q?2OZvjXECUFrdOPEzWUOHIS38UeJgbIaKEuwxhxqBu6t0TdoxeMJd9N3O?=
 =?Windows-1252?Q?kjkVJROHvl3BCuqQI3PpjsLNnyWuTTKS4pgO0etkKIyqC/8f85h1T39/?=
 =?Windows-1252?Q?TY4U7wJSD5P6OIqP6m1IH/6ZyuP4cG90hoR+EI7bb5x6oYVfwlxaxQ43?=
 =?Windows-1252?Q?x8ZTCs705sPEztJDEz5Kahdot8lWZlueb+eJA/qwLW6Yps62S8jprK0z?=
 =?Windows-1252?Q?0t4YRrSh4eCDKHwgWrdKwQyxK9OV7GxNtstrLU1AlL+PUgxqlWRsJKXh?=
 =?Windows-1252?Q?4BUe7nj/juB3OQTPHkWpbrSmLV8w04bEmz4rB4CvZReNdfXo0F7Xxeqs?=
 =?Windows-1252?Q?IJqYZXgN1zhSCd/7GSqbmTjrEuyicBCM1BcDGZ0PAEGPfx8BnLJsEXum?=
 =?Windows-1252?Q?/snd7BK1/swEjRAK+zdskIWNmgzT+6/xtdDj3rYIhct3tOWw8a3jFloT?=
 =?Windows-1252?Q?HjiPgFqI/1acbPKpJchJ/WKgKldf3dAJ4mnvMfwt/Ssi+kpl7+KPJNh4?=
 =?Windows-1252?Q?HgaRGxG8Ihas/qXnzaCAchxUN93WCB6B+i8eOFNVp8znTn2NqTbTi5I9?=
 =?Windows-1252?Q?dTNq8b5Eudj3AwT0Gl/zjwdZJBqEphgjAut04x5IgOAaXbC1FQsHE9Hb?=
 =?Windows-1252?Q?jODzcKXV3dc41WY9DxLfYL4oHePzOzzYYrKxt7/EZBcavLvpI7xPvAUP?=
 =?Windows-1252?Q?Kptbi0s7tzPw9koir2nUcYIxGLKOUHUhPvh7tzoF7FnUZKvcAeU6JcWZ?=
 =?Windows-1252?Q?B1fog8qZuJ6hJ9oSl4eReXbQKVSuW6zkY6mtqRm1FdY0ZbTbGf5jgJRu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7199af5e-5881-4fa0-ee30-08d987d96ae0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 08:23:32.3753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf7bYqiaSGyp4LSQZ17kjCbQeqAjSn/GHJRVdp76hXHTGyDJRqjA3CBuI6Bofw9r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1213
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

Thanks for the notice, going to fix this.

Christian.

Am 05.10.21 um 09:59 schrieb Stephen Rothwell:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>
> include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_in' not described in 'dma_buf'
> include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_out' not described in 'dma_buf'
>
> Introduced by commit
>
>    6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")
>

