Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B3B3C26E2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 17:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B101D6EA3D;
	Fri,  9 Jul 2021 15:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2119.outbound.protection.outlook.com [40.107.212.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661C06EA3B;
 Fri,  9 Jul 2021 14:47:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipH03Ydo7Uabikw1Jnld22E9iOcgaRC8P+BuxmGRGgo8TsyEIDbk0G56Djvvt0B3/PIQ+jXPSN1LP9afI3FQ7jZIvbmivvvatgbn52uVE49tc3y1sUnWd35sjQ1ZLlaADQkLjTnHf1ExhXOa2O3v0UdHea2s6hKXGs16in5p8CbThb31sCrvFmPdV84RdxyrdS08r1LOitYZddW6DS/XTObJqHKPn9izg8OhFRqHgLIuA7CSExvhxJqpOCUX3EP/CAE1WXAdMICxUcQ6ldXaNriqDvrLXDbTuwtFezTTRVbEG1N0A9P5734n9bhEp8C37vgUQvTnf3UWLQZB8xlBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MUKbsfaW+NVKhsUNNP8gybNfHmbuDuajON6DDdjMec=;
 b=TkNrfTkZzkSNrH59Q6LV/2iKJUUF51QOLF4o8kFsbrKUaNfS+qWbSZcwMSK+SUQpMV0CXJF9YS4Sw/azVu7m3OVKeQB0LqPGhZ73BLsoS7GEzXGHBecCEuKRvfHRfoFVA6/5QZYRj3cUyEUuG5NDbAtOQ5/qRCuhgqECOvUgeojAibiZshc06J467IFSa7o9aIGMrF8YRmOTGsZ88ria3Dw75oPspZOJygb6X9ThaZDt7JnDRTvOKeas1PXMnuLqxsR1X01wPg0lBJ02a3oDxdXcthfs7am2rbX6e6C9Dg3fjgdf07P0ubkuANR8LgZKgUMwTbdZaKL/BtjT+R8V5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cornelisnetworks.com; dmarc=pass action=none
 header.from=cornelisnetworks.com; dkim=pass header.d=cornelisnetworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cornelisnetworks.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MUKbsfaW+NVKhsUNNP8gybNfHmbuDuajON6DDdjMec=;
 b=HPKIPNAGCIhWS9QhvzencuGfZ7xlrUbS2BuYF8jpJaQMVZsvUnAzBZXWrDGbNGfmaIucXSQo3pOIH0vdEWxIar0OL7hM2BdC4QE9VX225JMFaY2AO+SqWZxSI6EGplHjKadA5qrKoi0SnH4Yn8IMEj0Ic0vB43Ms4i3rDgaWI3vuH9b+X8VCRtVK30tu7WLL8B00GhlKLX3CP6+GtaVgQ6h+pTzxNcWMTD2JbZ3gpUb4laDXcCQav3t2nhEJ9PMLFOOUcp7lhbAZB+KFQODcnz3faARfCIc9gX+kQBYMHJRViiaPQ2RUpyBaMk9YBpTVZeFoPEjOPRKZV59wm/HfRQ==
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none
 header.from=cornelisnetworks.com;
Received: from PH0PR01MB6439.prod.exchangelabs.com (2603:10b6:510:d::22) by
 PH0PR01MB6538.prod.exchangelabs.com (2603:10b6:510:77::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.23; Fri, 9 Jul 2021 14:47:30 +0000
Received: from PH0PR01MB6439.prod.exchangelabs.com
 ([fe80::5c02:2146:2b1:f1eb]) by PH0PR01MB6439.prod.exchangelabs.com
 ([fe80::5c02:2146:2b1:f1eb%7]) with mapi id 15.20.4287.032; Fri, 9 Jul 2021
 14:47:30 +0000
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@lst.de>
References: <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
 <20210706142357.GN4604@ziepe.ca>
 <CAKMK7uELNzwUe+hhVWRg=Pk5Wt_vOOX922H48Kd6dTyO2PeBbg@mail.gmail.com>
 <20210706152542.GP4604@ziepe.ca>
 <CAKMK7uH7Ar6+uAOU_Sj-mf89V9WCru+66CV5bO9h-WAAv7Mgdg@mail.gmail.com>
 <CAKMK7uGvO0h7iZ3vKGe8GouESkr79y1gP1JXbfV82sRiaT-d1A@mail.gmail.com>
 <20210706172828.GR4604@ziepe.ca> <20210706173137.GA7840@lst.de>
 <20210706175935.GS4604@ziepe.ca>
From: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Message-ID: <398a6cbc-e740-f30f-ab0a-5be2d1673fa9@cornelisnetworks.com>
Date: Fri, 9 Jul 2021 10:47:24 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <20210706175935.GS4604@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0007.namprd22.prod.outlook.com
 (2603:10b6:208:238::12) To PH0PR01MB6439.prod.exchangelabs.com
 (2603:10b6:510:d::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Denniss-MacBook-Pro.local (24.154.216.5) by
 MN2PR22CA0007.namprd22.prod.outlook.com (2603:10b6:208:238::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Fri, 9 Jul 2021 14:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83f558fc-a3ef-4d0b-3940-08d942e87a13
X-MS-TrafficTypeDiagnostic: PH0PR01MB6538:
X-Microsoft-Antispam-PRVS: <PH0PR01MB6538F0017CC49A275653C179F4189@PH0PR01MB6538.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8HqKjvvVd3r7+clSgVEaMTX+iKSQhhFCJWYMUiR/MRUWrJdfqshs7dTTa+RdwJqteAXjhb9oIIVYewVc2p5TrkvSOljrXM2rxQHLUQuiHxvMwnFbYbqXMESz4YFQtipO8gQRESymMrTH7uqK/+eExCQX8FzU0xwbhzDpxbaR/LExYiX2PRymYXGLYbGf2ps/U2em22dFiI5BXaeozGfQfg57Lxv9BJMxVjBEY3le4HLAcFzcSkNUSzIpjRvatNUewFiI/o4GQqOlpGZN1sN6duCnsTEyRR2aGUUzDJJJqXG+03vE6TexJV3GwOcrsGSJCIqWbr88PGmZlABefPtMz8Cb/mzHQOl5fYUFEN5VhLFCDZDDurwxHhaSVUX62xvKxrfcqIpRHvxCMlnzdD0lP+X92uYCP3RndhfwTW+AfACbJlzYaLMMl71XW6vPi1SmWNd7krGkkXBrPJ07cWu1ggdk4Yyz7KOlFSORs617zpbuwCKZERy0/g2RPTnUTnRYOH6MSgEcGl7gTvd1IVFLVZs3OQq8UlkH3Vx63kC0UFQ02t7ZL4xCPvz7VULJFvIdh2qnSzO4GdP6UOcA3WpAYRkGmtzP0Cw2GI+An2tFqRJnHo9AcfT6Yw8hPRjMhP50KfXGGlAE3YFonVSt8D+AxZj2U9mrXcKhNWkctdT0akF3iJ+l4ApN3YY+ffQGvK5EpEMtFRSDHLXeBmzNEh4FIXJboo0o+uysdHuKxgouBOkOcI5GBJ2W4KRu/tc+YaIYidoxLjJH8SLP9ZesblgMVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR01MB6439.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39840400004)(396003)(31686004)(7416002)(5660300002)(6512007)(53546011)(6506007)(316002)(36756003)(86362001)(54906003)(26005)(2906002)(44832011)(4326008)(956004)(2616005)(110136005)(52116002)(6666004)(31696002)(66556008)(66476007)(8936002)(66946007)(4744005)(186003)(478600001)(38350700002)(8676002)(6486002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjBvU3FjWE1rNVE3MmdadE9vQjAwUnB4TFErTnJid09LcVFpWFFVUVlBTjlx?=
 =?utf-8?B?OHVodDRVdmV0bkt5K291OUhXY3hxSEpmdmlLemNSejIrUmRMamlvT3RIYnVU?=
 =?utf-8?B?QVB2S0VJdDJVVjZMMXBrQ1dBYW92NWVsMExFQ3hlMTlIb1RkdzlXVlhWM1A4?=
 =?utf-8?B?L1FENldNSUErTExuRXhIVWtBelpYZ2JsV1h5Z1YrU21mNXh5TzU1SjNwOTBm?=
 =?utf-8?B?TFRtLy8xU2NaT0x5dlU2MDMwRWtrazNBZXVxUyt0YkVKbWE2Uk96dVlXTFp6?=
 =?utf-8?B?R1Rlalp1eFBLSXV2ZGRNWlhNM0V3bnFTczJNTzB5REJqeFFmWTBNOER0MHRj?=
 =?utf-8?B?K2wwSWZMQ0Rqalp0Z28wam5jb3NjQ0tDTTVZQ2hSbGg1bmEzOHNqU2FVTlZi?=
 =?utf-8?B?YnZsYmxGYjAwT3ZNVEVGaFR2K0tad3BGYjd6K0lFak5qOCtVbU1seEtYczRn?=
 =?utf-8?B?bEVrQzJpYk12QUlGMXdFTkJFdXVpU1VaYTZ0NkpoYWtFcnE3SzVMdWJ2ZFlj?=
 =?utf-8?B?RlYvUEhuQTF3am5POFBxeUdFNitOam9BcHB1VGpibXlzd3BIRTZJMzVPN3Z3?=
 =?utf-8?B?MDgwVzFpWThxOHlRazRNT3IrbjJNeGZtWStGc3lWVzJNL3ZZdnBBM2tmUXBP?=
 =?utf-8?B?RnVHSUVnZW5mZzg0bzViVlo1UC9URXNBdFVWaDJ3b1RpL2UyNi9VTGp6MVpE?=
 =?utf-8?B?WW84ZkhmYnV4bjRLNHNyK0VzMVl4UTlxTkFPMGZPY3gwWGkxaXV4TXQvdzBo?=
 =?utf-8?B?eU8remY4RnA1dFRXUnRhVVgyZGdPazFyNXVxSi9RUGZqZm1vWXpkWkVwSkh2?=
 =?utf-8?B?aE44SWVYUlBaeDNrUzMrK1p5eStJNXpFZXh0WWptaVBxVHV1Y1JYc1p6NTdk?=
 =?utf-8?B?ODhReXdkQ3lPK2VpeGk2RnpCOFlUaFRybVU5bkY2MjBRMTA0bWlLREpna0NL?=
 =?utf-8?B?Z0lhSEFybitlbkY1VWRlWmV1QmtwUWhHdVJ0QnhRVTgvMDNmU2FrWExreHZS?=
 =?utf-8?B?QWZkM1BCTkRRdHRzV0NnQ2tiZTF4Q0VhV3Z4bUZuT1pnTHlJWU9kVXU0bW0x?=
 =?utf-8?B?NVpqSUpUcUUvVXduRmxnanIwRytXblBuOC8yY3NucHlRd2hvakc1T0xWVzJS?=
 =?utf-8?B?SEFubVZvcyt1bmFGaUpvWWE3ZWNISmFsejI4algzR3dTbURQL3k2cnJvNHJC?=
 =?utf-8?B?RjJGaUFvYjk5Tk1VU2lOOEhwTlBtbVgyTWpZMElxS1N3bUh1WkVZOXptWTVE?=
 =?utf-8?B?R21kQTVMSmdRc2tSV3hDcnFGMmJIQS92MDA2eHpHVW5TUHlUMm5aQWwwZkk2?=
 =?utf-8?B?Slg2d2RSekE4cUdvenB4RG5OeTFVZ1RIZE5jNkFGQTkwZ1hQYlphZFlTcDFT?=
 =?utf-8?B?Qk9JVGZ5dFVOSWJ0Y2pBYUJzcVVhVTNWMFczVEtyYlNiQXdtUFVOZ21TUVht?=
 =?utf-8?B?aHVnODNqVWFaS3ptaVNnUHJwM2xiOGJmQ0xRWjhBZUNFRGZDUHBxQU01VmxJ?=
 =?utf-8?B?Q25wTFlQZzB6RmRmV0ljUzNmNXJPVTRUeFB6MWdkZmtYeVRDSVkzQ2s1MlRY?=
 =?utf-8?B?MGN6MDNiOUpaYTI0czlTdXJlYlVJKzJvVGh2OGNiWHNRUXhmSk5iMUE3WXpi?=
 =?utf-8?B?djYycnE0WEk4WjM1K2kyN2hpbGd0QVpueTBFUjZvdEEwVTl4c01CRGdFTm9K?=
 =?utf-8?B?anZNTm90MlJ5YWJlSnhrRlZ2QUJaSjlGelVjSXVNQ1F2dW14bmxLUEhVVkV6?=
 =?utf-8?Q?NiX6E9z/H6dMogbabSkLKSnulIGzmp9/13c6/3T?=
X-OriginatorOrg: cornelisnetworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f558fc-a3ef-4d0b-3940-08d942e87a13
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB6439.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 14:47:29.9433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4dbdb7da-74ee-4b45-8747-ef5ce5ebe68a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZVkDAJCWLuKUc9lwXBCg+3qf+jfYDPQ1sBVgXr7UbF6us3LgG+gDvDAy/EXV1vsdmmGabBtZLkdGpBdssEP7K9OoSn/CSP2lkszt8733V3cBckgEDKKxfVkc+1JGF9H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6538
X-Mailman-Approved-At: Fri, 09 Jul 2021 15:33:37 +0000
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/21 1:59 PM, Jason Gunthorpe wrote:
> I can not say the same about other company's RDMA driver
> distributions, Daniel's description of "minimal effort to get
> goodwill" would match others much better.

Not sure what other RDMA driver you are talking about but as for Cornelis
Networks, we do have a packaged up version of our software. However it is meant
to make things easier on end users to bridge the gap between the distro kernel
drivers and the upstream kernel.

It's definitely not a requirement and plenty of folks do use distro
kernels/drivers. I'm not sure how many large sites are using something straight
off kernel.org but the upstream hfi1 driver is 100% the real deal.

We continually develop on and test the upstream kernel. Our goal is always to
upstream patches first. We learned that lesson the hard way when we first tried
to upstream hfi1.

-Denny
