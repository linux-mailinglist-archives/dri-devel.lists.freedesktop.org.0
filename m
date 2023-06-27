Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072873F79C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6413810E2BC;
	Tue, 27 Jun 2023 08:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8003B10E2BC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687855342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b2MmmmX8qSiO177aJ1IsOrsyeObiJXUg8rR6lbP0Xfw=;
 b=TfzmsX3/4BIdwaayJn+3JmCr1wYKhW/Eiab33Bn8M8RApqdu8Wcxq7421OV9XyPvKbynpP
 iN/0D/u/3AoPj3hEK3J3fm7NsRcymyDoJADItcZNHvto5lYVuHh8BNht4iSi1qS2hNQN/Z
 xzZ/jWHL7yzliH5LlpOgLm/IAK4Of7M=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106--D0sjsayN2qXSQhEkmHVDQ-1; Tue, 27 Jun 2023 04:42:19 -0400
X-MC-Unique: -D0sjsayN2qXSQhEkmHVDQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3f8283a3a7aso12437271cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 01:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687855339; x=1690447339;
 h=content-transfer-encoding:mime-version:organization:date:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2MmmmX8qSiO177aJ1IsOrsyeObiJXUg8rR6lbP0Xfw=;
 b=BqDxku3OCOC0PhhWCng5a5OK1DNCtPMF0eql095w1D37029+o5WjNz0nuFfk/nwEBE
 tZHd0v86L2QTnZFfFlnhcWRkmPu8piLhMJtr58xFs4XfZyXnDbcnBskWeuv33O+8R8DO
 LD/5GPza5OGLC7e1mxIIfAXQkfsqdZ06TygbGhJj1zF118H0S2eutYYJTCPjxGTU4kK2
 nMJd6KuHmN+GJwSF+5HjWrGZmNTb7ivzvIg0QfIEZbNmgnvS2EOXRrRMVnIxUvvosR3i
 NdZy9mbxxGM3Blu+TlAOopuur0QqtvxUbj2f5AL2qBIARfhQ78jA30InRaWB7Y/Dxo37
 5o6g==
X-Gm-Message-State: AC+VfDw+mXV8GZivvsn+2gQ++1OhY4i/vtv3TKpmkhJHmt9OF0gqf11B
 K/Gjux5OaT6uDjHJ63A4XMKEfbj1f+2SzQkzWFwSV5IQwn1gHzha37LEtDY4AqKieWeQjZ+93IG
 5Jpf73Q+IJT1wRKemJ69XpkOMHK7W2lPxvbKW7ZzGcYIPsHYZmQqz6FQnypvheZaNGdMdQfIAu9
 pQMFvM3IS+MuGu
X-Received: by 2002:a05:622a:1014:b0:400:aa1a:bb4c with SMTP id
 d20-20020a05622a101400b00400aa1abb4cmr1819085qte.3.1687855339306; 
 Tue, 27 Jun 2023 01:42:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ATT1RiIQZKXpf58QSToXjjNL1Xsj18ze16kl9PmEddxBEF/MvrYdYpO6COOgDpCrs4siIHA==
X-Received: by 2002:a05:622a:1014:b0:400:aa1a:bb4c with SMTP id
 d20-20020a05622a101400b00400aa1abb4cmr1819076qte.3.1687855338902; 
 Tue, 27 Jun 2023 01:42:18 -0700 (PDT)
Received: from dhcp-64-119.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 cg13-20020a05622a408d00b003f4ed0ca698sm4242972qtb.49.2023.06.27.01.42.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:42:18 -0700 (PDT)
Message-ID: <b551fb687a07e1461ca325c6951e96f4f962941a.camel@redhat.com>
Subject: Why does kgd2kfd_interrupt() have to schedule work on a specific CPU?
From: Philipp Stanner <pstanner@redhat.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jun 2023 10:42:17 +0200
Organization: Red Hat Inc.
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8)
Mime-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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

Hello folks,

I'm currently trying to learn more about DRM and discovered the
following code sequence:


drivers/gpu/drm/amd/amdkfd/kfd_device.c, Line 824 on 6.4-rc7

static inline void kfd_queue_work(struct workqueue_struct *wq,
				  struct work_struct *work)
{
	int cpu, new_cpu;

	cpu = new_cpu = smp_processor_id();
	do {
		new_cpu = cpumask_next(new_cpu, cpu_online_mask) % nr_cpu_ids;
		if (cpu_to_node(new_cpu) == numa_node_id())
			break;
	} while (cpu != new_cpu);

	queue_work_on(new_cpu, wq, work);
}

/* This is called directly from KGD at ISR. */
void kgd2kfd_interrupt(struct kfd_dev *kfd, const void *ih_ring_entry)
{
	uint32_t patched_ihre[KFD_MAX_RING_ENTRY_SIZE];
	bool is_patched = false;
	unsigned long flags;

	if (!kfd->init_complete)
		return;

	if (kfd->device_info.ih_ring_entry_size > sizeof(patched_ihre)) {
		dev_err_once(kfd_device, "Ring entry too small\n");
		return;
	}

	spin_lock_irqsave(&kfd->interrupt_lock, flags);

	if (kfd->interrupts_active
	    && interrupt_is_wanted(kfd, ih_ring_entry,
				   patched_ihre, &is_patched)
	    && enqueue_ih_ring_entry(kfd,
				     is_patched ? patched_ihre : ih_ring_entry))
		kfd_queue_work(kfd->ih_wq, &kfd->interrupt_work);

	spin_unlock_irqrestore(&kfd->interrupt_lock, flags);
}


These functions seem to be exclusively invoked by amdgpu_irq_dispatch()
in amdgpu_irq.c
At first glance it seems to me that it's just a typical scenario taking
place here: Interrupt arises, interrupt submits work to wq, then jumps
back to sleep / former process execution context again.

What I don't understand is why it's apparently important to schedule
the work on a particular CPU.

It seems that the do-while in kfd_queue_work() is searching for a CPU
within the same NUMA-Node. Thus I suspect that this is done because
either
a) performance requires it or
b) the work-function needs access to something that's only available 
   within the same node.

I suspect there is an interrupt-related reason why that particular work
should be enqueued on a specific CPU. Just by reading the code alone I
can't really figure out why precisely that's necessary, though.

Does someone have any hints for me? :)

Cheers,
Philipp


