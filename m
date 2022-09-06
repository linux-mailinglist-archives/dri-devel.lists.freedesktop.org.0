Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FB25AF0C1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 18:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD8D10E08A;
	Tue,  6 Sep 2022 16:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DB610E08A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaA9bEDX5z2MF5AcsstFdfCQqISJq27KJ0sm4UdQ63GPUxnEts7up/JC+nOvmPHT+0Hf1vsUQH7kRC/BdAeuCFMOk8JD3TPeIjA88Qf7cvHZy08PdBiv/hXamvKi9PLErCcwhDJtAU+HSMqieDdlgWaM9pp0Jh4eCJDaFwFPOIdRzrk3NwOv4yqH9Srhs/6v3An6Esrz9IrCVRv4jlst6374qPE05ExTZgZIesCB1ZToBtYTDrSNe2xFdKQ9b37usaS/JPL34ZCkaDbEQFXKxe0PkEH3NV/sWGLatalXpCIYvb962bZFdu/gBJqq3UU+e083u/y9fcylI7G3clittQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0a5KMK04bEnYSJbmXKpvsVC0KtUSLYXlzknatukfmpk=;
 b=hcXhhYvI2Nk4B998Yr6hBDOmT9hfPaPSCl2+lhRlQ+sEHVM7INnp7ISo/DHd0njMSn74uGVP8oqSDkuUuPGnUwC9zty3PyPMPyZAHDmMqQP4l3w3HTMRCu76G4QPT/JIKKwxJvingRhfakaGlQVaAZrQkzg0t0dI+AVkmxLF14MRUubv285xZh84rKgHzRpJfI8msbN52naJSWglaNX6tTRSLCOOFRXEOcbfMuM9oRnQWtA9HXQV7y7dUzz+riOlErp1ydxVlO2GhZX9HNpgOWlrl0r5/ZuNNQsCS8Pr8H3Uly23nPtJrR5CSplDcxgJog+VzzeVx5WOwlKi2JSugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0a5KMK04bEnYSJbmXKpvsVC0KtUSLYXlzknatukfmpk=;
 b=RYvoUnmqN7kcX3rDJGH+ABxoZw8KC06Qfyef/rmS6cEh7xg1cF4KW3h96t1OffAOevwOoLovbk6FKXK6UiE/j4f1RnOj27wj5kht9Z9Cbuewr/RTY9ATKeGjmMU4LMz1o1EKM2U+yUmnYj9mPp4ihxOSK1AY+YS3Fmm0S3oRJ4hJqNtJnYV/Xppi5AI5HnrAHyUMdZgcRLEQUHKfMd5sQQRA7wBHZ25EvPQsIZsvCoiy42VauhwuH0G7ULeCe8jllFcBBmXEK59FDSSJCQEULprnCwJcqwO5gQ9G28nQyiwT8vuMSiMnagD22CrBIVAYVHJSb1cFsNF0W2x42yMTJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SJ0PR12MB5453.namprd12.prod.outlook.com (2603:10b6:a03:37f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 16:44:10 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 16:44:10 +0000
Date: Tue, 6 Sep 2022 13:44:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 1/4] dma-buf: Add dma_buf_try_get()
Message-ID: <Yxd42anepRnmFJwe@nvidia.com>
References: <1-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <18b3dd75-7995-a2a8-372b-1fd5838dfe1d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18b3dd75-7995-a2a8-372b-1fd5838dfe1d@amd.com>
X-ClientProxiedBy: BLAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:208:32b::6) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9290245b-7afb-4ef6-1e09-08da90270598
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5453:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sv6FLW3Ar1+tcc3j1O/+3BYTHQ3ngYZlk4vQUqBZ0wWolZb1SovdYYe2QcuWe2EXCohEGK+o/tspaOyzzA5YstkJFYQc1UCg60DJmfvyR4dmsGNtyhGb0Z9VczE2TmdtJa+PjHvY3tZVpyAYpm2JfzIbg2vDx+mezXnCDeu+xASNrjCoSkzotl2YVGVnEnxH0KKUExi9vyyBHv0BVJcQ96LBNiLAtSS4fE1jpjEsXOQbLvfEIgRab4zXh3IdkKkcu/PODaOgYtXC6Mqu8ggLNiVSAsuTCnHBvQxCPxBu3hOIVqBAc5clOoCYAjPcKDb5U8MHvoYyWhg5U6KkwRp2Z0i2eHDgTtaUdJEkva/IQ1tCqw1bgmP5wyJQ0bq1f9fUEcd586LX/7iYj041grHxS75uXGDNW7Ju6gOJq8cykIZ/SrvDbiZ9uXKUNT2TR3af+k5E0vjcygIn898aBzd7NrWr0ocw0EESrj6S4yIjcULPJkrKtbV09erSS+bjif6gAY2zFEw7CmZnqIMcWmybHfOOKLkg2E0hoSb1m3xgxdcxPQXDnm6aqCt0Ap5EgtC0GgIu4c7de0CWV+05NwMmZNhlZ/YVmcjU2UqIs3iOCrqKhvgvjltKnzaeD9znxro1PtBOadPjRZpvexMQ278z5Ng0xhc2C6YVSaWM2UWa0n5Oev+AjroY0bIvV47//R8VS9AjgzkK6lNjDpJDKzWv9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(36756003)(5660300002)(41300700001)(6486002)(26005)(2906002)(38100700002)(7416002)(478600001)(66476007)(66946007)(86362001)(66556008)(8676002)(4326008)(8936002)(6506007)(186003)(6916009)(6512007)(54906003)(66574015)(2616005)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzJtcy9NamlDTHdJKzh1LytqV0NONFBuME5EYzNXYllXd3FsK3IyVzBpRkI2?=
 =?utf-8?B?UzkxNGUyQnJwOWtXRmhXcFpLMW0zbmxyZTVQVkJ0UjhkRGpCekRoNjdRdW04?=
 =?utf-8?B?RG1vd0pzVkFpQmJSMHMvMVA0K2pPdXdNMVI5SUZvSjN6ZUJkcjcxQW5nM1I2?=
 =?utf-8?B?d3hZS0tjTHBLaWJLOXgrWVhNSXRWOU5jejJGL0NLU1Y5by83bXFXQ1VBNVYw?=
 =?utf-8?B?c2dNQTRrVDduV25tcXlUeXJDSG5qaUtZSTg0cUVHRU1GTEVrWGw4c1ZveEdj?=
 =?utf-8?B?MlhBUUtBL25kQnRsNXgzMDNRQVcwMUZkOWhuaStDUnZ4c2NRUHVDS1NWQWN6?=
 =?utf-8?B?VjdwblBmVkdqNkZBcys5c2syNklhNStBRk5mTThKVWo4OWtIV1pLa0dpWi9L?=
 =?utf-8?B?Smk3c1NyVmhOSnR0UVozZFNXMVlCUUNEdTFXMzVaZ1dGWkhjMUs3aHM0T1Rs?=
 =?utf-8?B?ckpBeUJ4aHphSXlTSnQrTE50QjkwY2xBS2wyRFZmbVdOUER1eTU0RUJjdkd6?=
 =?utf-8?B?cVJuaHA3TDdadkQ4YXdicklYNGNKUTEvbzBwYUwrUWVocHduMGNUbk9NRUFK?=
 =?utf-8?B?VUVydGFMckhnY0RqWjBlL0o0SVVHOW1jR0FjTGJKODBIaytzTTc3RXR1SzdZ?=
 =?utf-8?B?SnJIMDVLeWZSR1NFV2RSajlXYi96WHBRdlRZT2M3akd5QnFzOWduZWNkelhE?=
 =?utf-8?B?bkd4dzdEUDY0aVh2M1poVXpMc2d5ZWU4dFBUVHVrTXU0bjY4cHlQTVY1ajBa?=
 =?utf-8?B?Q3c5TEZTaHhyTkNVWFNncTBEVkhuWVJkSk5QUituOG0rdUhyZEcwcUo5N3Nm?=
 =?utf-8?B?d0FuWGgvM0hZZ2xmWVIxTU50Qi9Ba2hVQ0tqOWljQVNsdFd5UFhaazkydXhW?=
 =?utf-8?B?dFE0QWMzM0dlbTNqa3B3UndRWjY1ZzFTTUg0bmhSYk1HdUdUbzJhcEJTbnRk?=
 =?utf-8?B?K0xGZ3RrcW4rdnJjVURiY0hjZkJxMDNlU0FJaksrMU5IY2tHeGxhL0hNWkZH?=
 =?utf-8?B?UXBmVG9KQ1FONU9vQ1FtTE1rNXJwUjFWTmpwRnFxSkJSM0ZnNUIwMklUVExR?=
 =?utf-8?B?K0FYNHNYSStPUnJrZmtmMjF4bjlsRTV5c2VDRTZua0NOTXBUUEZwamoyV1pm?=
 =?utf-8?B?dlRHODhpYmpGSnpLZzVWRVdoc2Y2Y29XVW5kMkVQZ1M5RVNyeEJJSHNCYzQr?=
 =?utf-8?B?cG5GTW9JbllvSHB6Y2ZzRk84QXA5REFLY3JLR3dXRVJDVElUQnhBQ3dyRTM3?=
 =?utf-8?B?SlFkUkNNZWFoVzMrTmNvSHo1MjdsNVNsOFBKWHpCL1J0YmdHOXM0YlM3VXVh?=
 =?utf-8?B?bjhHalcwd0hUSTRIVm13YWdDaGx2bDljQVRjakNNbmlxV0VuSEg2d0pySmJJ?=
 =?utf-8?B?N2g1VEZRUXJ5TTJpdVBlbTV4aUpaQVFoRitnM092TWp0YWFUT3FuMW0ybFB3?=
 =?utf-8?B?VzlZaXBSZGVUS3RENFNJUzU4UXdsMUY3TVA4dmpmZm5tMkNZZ1dKcktvZ1VC?=
 =?utf-8?B?ODlRRFdaelprcTJTbDBTQzE4OVJLZU9ZZXVxcEQ3MGIrS2NRL2lFMW1OUGNy?=
 =?utf-8?B?MTQ2U3pqajA0Ry9XN1JoRldjcnIxNy9LSGlGUUVPMDQ2ZER6Q09ZbzcvdEx3?=
 =?utf-8?B?V3dneDZGdmtCR1kxOXNsblE3RDYrVlM0cmVXVHcweFdKTEx5VThaWEo5Ynoy?=
 =?utf-8?B?WVZQajZDdmVzWnVPOE1BYVNaY1A0Tk4vTVpHQW95ekt1cldlekk0ajVyc2dR?=
 =?utf-8?B?Vzg5aWJ5QWdBdG1uczkzSjQ0M2duRnE1cURPdE9rcnN6RVIwVk1EdVU3dWRl?=
 =?utf-8?B?WENzS0pQSHQ0UW5Udm12SU5neEN6VXVsOGQrd0hra0xhTUtKUVpscmd3L2R2?=
 =?utf-8?B?RXQzbDAwS3pIZDVwMGtaOEY0RE5PZDhRT3VjTlJvZ0p2ODRPZmtRVFlndEtq?=
 =?utf-8?B?Zm00ank4QmY4dmdIM2dzOGYrT3RnNHMwUGg1ektHTDVtc3BydGNEQlNQQndn?=
 =?utf-8?B?T3dkeTJwbnE0Mi9kU2E1ZTdtVlJ4L1BoOThxdTVCSlVRZ1Y5VEZQWlIrQTAy?=
 =?utf-8?B?Mk55R1pseCtmRnhyVEJUdkc3VW13OHFkd3h1bW9LTnBJandlNDVRV3p0NlJ2?=
 =?utf-8?Q?BQcnzdrmJD/tF8kygQCUbZoAP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9290245b-7afb-4ef6-1e09-08da90270598
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 16:44:10.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qL7Wh4xgJQrMir3DOCnBED3FxX3vWXnXUIRRWuUsrJDmSAB643rFzYZY2ygkMPM+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5453
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 09:55:08AM +0200, Christian König wrote:
> Am 01.09.22 um 01:12 schrieb Jason Gunthorpe:
> > Used to increment the refcount of the dma buf's struct file, only if the
> > refcount is not zero. Useful to allow the struct file's lifetime to
> > control the lifetime of the dmabuf while still letting the driver to keep
> > track of created dmabufs.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >   include/linux/dma-buf.h | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> > 
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 71731796c8c3a8..a35f1554f2fb36 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -618,6 +618,19 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags);
> >   struct dma_buf *dma_buf_get(int fd);
> >   void dma_buf_put(struct dma_buf *dmabuf);
> > +/**
> > + * dma_buf_try_get - try to get a reference on a dmabuf
> > + * @dmabuf - the dmabuf to get
> > + *
> > + * Returns true if a reference was successfully obtained. The caller must
> > + * interlock with the dmabuf's release function in some way, such as RCU, to
> > + * ensure that this is not called on freed memory.
> 
> I still have a bad feeling about this, but I also see that we can only
> choose between evils here.
> 
> Could you just call get_file_rcu() from the exporter with a comment
> explaining why this works instead?

I guess, are you sure? It seems very hacky.

Jason
